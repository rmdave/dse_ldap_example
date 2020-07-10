#
# From https://github.com/osixia/docker-openldap

sudo docker run -p 389:389 -p 636:636 --env LDAP_TLS=false --name ldap-service --hostname ldap-service  --detach osixia/openldap:1.4.0 \
  --loglevel debug

sudo docker run -p 6443:443  --name phpldapadmin-service --hostname phpldapadmin-service \
  --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach osixia/phpldapadmin:0.9.0


sudo docker ps


# create SSH tunnel
echo "From your mac create and SSH tunnel "
ssh -N -L localhost:6443:localhost:6443 rmdave@dc0vm0


ssh -N -L localhost:6389:localhost:389 rmdave@dc0vm0

# this will work as long as tunnel is alive
# you will get a security exception since there is SSL without cert
echo "https://localhost:6443/cmd.php?cmd=login_form&server_id=1&redirect=true"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"


# https://www.techrepublic.com/article/how-to-populate-an-ldap-server-with-users-and-groups-via-phpldapadmin/
echo "to add groups and users go to....."
echo " -- https://www.techrepublic.com/article/how-to-populate-an-ldap-server-with-users-and-groups-via-phpldapadmin/"


