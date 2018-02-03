### instruction
* 除了login，所有的请求都要带token，格式是`-H "Authorization: Token token=token, username=username"`
*

```
### login
```bash
curl -X POST -d "username=foo&password=password" http://localhost/api/accounts/sign_in
```
