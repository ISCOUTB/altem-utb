# Pre-requisites

- Docker (Yo can refeer to this link: https://www.digitalocean.com/community/tutorials/como-instalar-y-usar-docker-en-ubuntu-18-04-1-es)
- Docker Compose (You can refeer to this link: https://docs.docker.com/compose/install/)

### If you've got all the pre-requisites, you can go ahead and continue with the following steps.

1. Clone this repo into your machine.
2. Add your .env file to the folder `[project-location]/altem-utb/altem`
3. Now, navigate to `[project-location]/altem-utb`
4. Put ssl files (or fake) (utb.edu.co.crt and utb.edu.co.key) on "data/ssl/" folder
5. Once there, you should run the following command
    `docker-compose up --build`
    This will install the dependencies ofthe project over an Ubuntu image in a docker container.
6. When this process finishes, you should be able to navigate to `localhost` in your browser, and see the Altem Login Page.

### Edit your hosts to add a custom DNS. (Optional)
1. Locate your `hosts` file and open it with admin permissions.
2. Edit it by adding the following line:
    `127.0.0.1       altem.local`
    save the changes.
3. Now you should be able to navigate to `altem.local` in your browser and you'll see the Altem Login Page.
