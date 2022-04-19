class jwtManager{

    late String inMemoryJWT;
    late int jwtExpiricy ;
    bool isRefreshing = false;
    //let logoutEventName = 'anjus-logout';
    //let refreshEndpoint = '/refresh-token';
    //let refreshTimeOutId;
    //region Description
   /* late int tipo_user = null;


    // This countdown feature is used to renew the JWT before it's no longer valid
    // in a way that is transparent to the user.
    //com jwt 3
    void refreshToken(delay){
        refreshTimeOutId = window.setTimeout(
            getRefreshedToken,
            delay * 1000 - 5000
        ); // Validity period of the token in seconds, minus 5 seconds
    }

    void abortRefreshToken(){
        if (refreshTimeOutId) {
            window.clearTimeout(refreshTimeOutId);
        }
    }

    bool waitForTokenRefresh(){
        
        if (!isRefreshing) {
        
            return Promise.resolve();
        }
        await
        return isRefreshing.then(() => {
            isRefreshing = null;
            return true;
        });
    }

    // The method make a call to the refresh-token endpoint
    // If there is a valid cookie, the endpoint will set a fresh jwt in memory.
    Future<bool> getRefreshedToken() async{
        const request = new Request(refreshEndpoint, {
            method: 'POST',
            headers: new Headers({ 'Content-Type': 'application/json' }),
            credentials: 'include',
            body: JSON.stringify({jwt: inMemoryJWT})
        });
        //console.log("token atual "+inMemoryJWT);
        isRefreshing = fetch(request)
            .then((response) => {
                if (response.status !== 200) {
                    ereaseToken();
                    global.console.log(
                        'Token renewal failure'
                    );
                    return { token: null };
                }
                return response.json();
            })
            .then(({ token, tokenExpiry }) => {
                //console.log('novo token'+token);
                if (token) {
                    //console.log('novo token'+token);
                    setToken(token, tokenExpiry);
                    return true;
                }
                ereaseToken();
                return false;
            });

        return isRefreshing;
    }


    String getToken() => return inMemoryJWT;
    int getExpircy() => jwtExpiricy;
  
    bool setToken(token, delay){
        inMemoryJWT = token;
        jwtExpiricy = delay;
        refreshToken(delay);
        return true;
    }

    bool ereaseToken(){
        inMemoryJWT = null;
        abortRefreshToken();
        return true;
    }
    Future<int> getTipo_user(id) async {
        
        if (tipo_user !== null){
            return tipo_user;
        } else {
            var user = new User();
            tipo_user = await user.getTipoUser(id);
            return tipo_user;
        }
    }
    setTipo_user(tipo){
        tipo_user = tipo;
        return true;
    }

    eraseTipo_user(){
        tipo_user = null;
        return true;
    }*/
//endregion

}
