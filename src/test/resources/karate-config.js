function fn() {
    karate.configure('connectTimeout', 15000);
    karate.configure('readTimeout', 15000);
    karate.configure('ssl', true);

    return {
        api: {
            baseUrl: 'https://petstore.swagger.io',
            pathAddPet: '/v2/pet',
        }
    };
}