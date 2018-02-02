class Api::UsersController < Api::ApplicationController
  skip_before_action :authenticate_user!, only: [:export_users]
  before_action :set_user, only: [:show, :update, :destroy]
  before_action only: [:destroy] { render_json([403, t('messages.c_403')]) if current_user.role != 'admin' }

  def index
    @q = User.all.ransack(params[:q])
    @users = paginate(@q.result.left_joins(:station).select('users.*', 'stations.name as station_name'))
    respond_to do |format|
      format.json
      format.xls {
        data = User.all.each { |user|
          User.column_names.map { |attr| {
              "#{attr}": user.send(attr),
          } }
        }
        filename = "Event-Export-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
        send_data(data.to_xls, :type => "text/xls;charset=utf-8,header=present", :filename => filename)
      }
      format.csv {
        require 'csv'
        filename = "用户-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
        csv_res = CSV.generate do |csv|
          header_attrs = @users.first.attributes.keys
          csv << header_attrs
          @users.each do |user|
            csv << header_attrs.map { |attr| user.send(attr) }
          end
        end
        send_data(csv_res, filename: filename)
      }
    end
  end

  def export_users
    token = request.fullpath.split('ident=')[1]
    return render_json([401, t('messages.c_401')]) if token.blank? || User.find_by_access_token(token).blank?

    @q = User.all.ransack(params[:q])
    @users = @q.result.left_joins(:station).select('users.*', 'stations.name as station_name')
    respond_to do |format|
      format.json
      format.xlsx {
        filename = "用户-#{Time.now.strftime("%Y%m%d%H%M%S")}.xlsx"
        render xlsx: 'api/users/export_users', filename: filename
      }
      format.csv {
        require 'csv'
        filename = "用户-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
        csv_res = CSV.generate do |csv|
          header_attrs = @users.first.attributes.keys
          header_attrs.delete("id")
          header_attrs.unshift "updated_at"
          csv << header_attrs
          @users.each do |user|
            csv << header_attrs.map { |attr| user.send(attr) }
          end
        end
        # send_data(csv_res, filename: filename)
        send_data("\xEF\xBB\xBF" << csv_res.force_encoding("UTF-8"), :type => 'text/csv', :filename => filename )
      }
    end
  end

  def import_users
    file = File.open(params[:file].tempfile)
    User.import(file)
    render_json([0, 'ok'])
  end

  # def utf8_bom
  #   utf8_arr = [0xEF,0xBB,0xBF]
  #   bom = utf8_arr.pack("c3")
  #   bom
  # end

  # GET /api/users/me
  def me
  end

  def show

  end

  # POST /api/users
  def create
    m_requires! [:username, :password, :station_id]
    ## optional! :role,:name
    begin
      User.create!(user_params)
      result = [0, '添加用户成功']
    rescue Exception => ex
      result= [1, ex.message]
    end
    render_json(result)
  end

  # PUT/PATCH
  def update
    requires! :id
    optional! :role, values: %w(admin staff outworker)
    ## optional! :password,:station_id,:name

    begin
      if update_user_params.blank?
        return render_json([1, '请输入更新内容'])
      end
      @user.update!(update_user_params)
      result = [0, '更新成功']
    rescue Exception => ex
      result = [1, ex.message]
    end
    render_json(result)
  end

  def destroy
    requires! :id
    if @user.destroy
      result=[0, '删除成功']
    else
      result=[1, '删除失败']
    end
    render_json(result)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_user_params
    params.permit(:password, :name, :role, :station_id)
  end

  def user_params
    params.permit(:username, :name, :password, :role, :station_id)
  end

end
