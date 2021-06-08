# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#YDNS API Credentials can be found at http://ydns.io/user/api

username="PASTE_USERNAME" 
#Enter your API Username here

secret="PASTE_SECRET" 
#Enter your API Secret here

host="example.ydns.eu" 
#Enter the name of the host address you'd like to update here

#You no longer need to edit the script past this point!
#Once you've entered the username, secret, and host,
#you may now save and run the script

update() {
      
    update=$(curl --write-out %{http_code} --silent -output --user $username:$secret https://ydns.io/api/v1/update/?host=${host}\&ip=${ipv4})
    echo $host" has been pushed to update from "$hostip" to "$ipv4
	
	if [ $update == 200 ]; then
		echo "YDNS update was successful"
	elif [ $update == 404 ]; then
		echo "YDNS Host Error. The host was either not found or authorized"
	elif [ $update == 401 ]; then
		echo "YDNS Login Error. Please check username and secret"
	elif [ $update == 400 ]; then
		echo "YDNS rejected request. Please check login and host parameters"
	else
		echo "YDNS update failed. HTTP Error: "$update
		curl -s --user $username:$secret https://ydns.io/api/v1/update/?host=${host}\&ip=${ipv4}
	fi
}

main() {

	ipv4=`curl -s --ipv4 https://ydns.io/api/v1/ip`
    
    if [ -z $ipv4 ]; then
        echo "IPv4 address retrieval failed"
        echo "Hint: Is your device connected to the internet?"
    else
        echo -n "Your current IPv4 address is "
        echo $ipv4
        check
    fi
}

check() {
    hostip=`dig +short $host`
	if [ $ipv4 == $hostip ]; then
		echo $host stores "("$hostip")"
		echo "No update is performed because the addresses are the same"
	else
		update
	fi
}
while true; do 
	echo
	echo "Last check was performed on "
	date
	echo
	main
	sleep 15m
	#You can change how often the script checks for a changed IP here! By default, it is set to 15m, meaning every 15 minutes
done
