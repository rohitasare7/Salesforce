
    // change login to test based on your org type
    pm.sendRequest({
        url: 'https://login.salesforce.com/services/oauth2/token',
        method: 'POST',
        header: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer a'
        },
        body: {
            mode: 'urlencoded',
            urlencoded: [{
                    key: 'username',
                    value: '<Your_Username_Here>',
                    disabled: false
                },
                {
                    key: 'password',
                    value: '<Your_Password_Here>',
                    disabled: false
                },
                {
                    key: 'grant_type',
                    value: 'password',
                    disabled: false
                },
                {
                    key: 'client_id',
                    value: '<Your_Client_Id_Here>',
                    disabled: false
                },
                {
                    key: 'client_secret',
                    value: '<Your_Client_Secret_Here>',
                    disabled: false
                }
            ]
        }

    }, (error, response) => {
        // Handle the response
       // console.log(response.json());
        const responseBody = response.json();
        postman.setEnvironmentVariable("token", responseBody.access_token);
    });
