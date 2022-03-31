class jwtManager{

const inMemoryJWTManager = () => {
    let inMemoryJWT = null;
    let jwtExpiricy = null;
    let isRefreshing = null;
    let logoutEventName = 'anjus-logout';
    let refreshEndpoint = '/refresh-token';
    let refreshTimeOutId;
    let tipo_user = null;

    const setLogoutEventName = name => logoutEventName = name;
    const setRefreshTokenEndpoint = endpoint => refreshEndpoint = endpoint;

    // This countdown feature is used to renew the JWT before it's no longer valid
    // in a way that is transparent to the user.
    //com jwt 3
    const refreshToken = (delay) => {
        refreshTimeOutId = window.setTimeout(
            getRefreshedToken,
            delay * 1000 - 5000
        ); // Validity period of the token in seconds, minus 5 seconds
    };

    const abordRefreshToken = () => {
        if (refreshTimeOutId) {
            window.clearTimeout(refreshTimeOutId);
        }
    };

    const waitForTokenRefresh = () => {
        
        if (!isRefreshing) {
        
            return Promise.resolve();
        }
        return isRefreshing.then(() => {
            isRefreshing = null;
            return true;
        });
    }

    // The method make a call to the refresh-token endpoint
    // If there is a valid cookie, the endpoint will set a fresh jwt in memory.
    const getRefreshedToken = () => {
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
    };
    //original
    const getRefreshedToken_origi = () => {
        const request = new Request(refreshEndpoint, {
            method: 'GET',
            headers: new Headers({ 'Content-Type': 'application/json' }),
            credentials: 'include',
        });

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
                if (token) {
                    console.log('novo token');
                    setToken(token, tokenExpiry);
                    return true;
                }
                ereaseToken();
                return false;
            });

        return isRefreshing;
    };


    const getToken = () => inMemoryJWT;
    const getExpircy = () => jwtExpiricy;
    const setToken = (token, delay) => {
        inMemoryJWT = token;
        jwtExpiricy = delay;
        refreshToken(delay);
        return true;
    };

    const ereaseToken = () => {
        inMemoryJWT = null;
        abordRefreshToken();
        window.localStorage.setItem(logoutEventName, Date.now());
        return true;
    }
    const getTipo_user = async (id) => {
        
        if (tipo_user !== null){
            return tipo_user;
        } else {
            var user = new User();
            tipo_user = await user.getTipoUser(id);
            return tipo_user;
        }
    };
    const setTipo_user = (tipo) =>{
        tipo_user = tipo;
        return true;
    }

    const eraseTipo_user = () =>{
        tipo_user = null;
        return true;
    }

    // This listener will allow to disconnect a session of ra started in another tab
    window.addEventListener('storage', (event) => {
        if (event.key === logoutEventName) {
            inMemoryJWT = null;
            tipo_user = null;
        }
    });

    return {
        ereaseToken,
        getRefreshedToken,
        getToken,
        setLogoutEventName,
        setRefreshTokenEndpoint,
        setToken,
        waitForTokenRefresh,
        setTipo_user,
        eraseTipo_user,
        getTipo_user,
        getExpircy


    }
};

}
