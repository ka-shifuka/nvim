if status is-interactive
# Commands to run in interactive sessions can go here
    clear
end

alias jadwal "echo \"
       __          __               __
      / /___ _____/ /      ______ _/ /
 __  / / __ `/ __  / | /| / / __ `/ / 
/ /_/ / /_/ / /_/ /| |/ |/ / /_/ / /  
\____/\__,_/\__,_/ |__/|__/\__,_/_/   

-- Everyday ---------------------
05:00 = Workout (Shadow Boxing)
07:00 = Bath and Gamedev
11:00 = Break
13:00 = Learn
16:00 = Workout (General)
18:00 = Bath and Prey
19:00 = Gamedev
21:00 = Sleep

-- Pro Tips ---------------------
Eat only one cup\"\n"

# 1. Definisikan fungsi wisdom di dalam config
function wisdom --description 'Generate a random piece of wisdom'
    set -l wisdom_quotes \
        "The internet has become the one using you, change it." \
        "Your focus is scarce assets." \
		"Dopamine and constant stimulation can impair your ability to think long term." \
		"We only hear about the richest and most successful YouTubers, not about the ones who fail." \
		"The most important values of all is patience."

    set -l picked_quote (random choice $wisdom_quotes)
    set -l target_width (math "round($COLUMNS * 8 / 10)")

    echo "\"$picked_quote\"" | fmt -w $target_width | while read -l line
	   echo -e "$line"
    end
	echo ""
end

function sshx --description 'SSH automate'
	sshd
	am start -n com.server.auditor.ssh.client/com.server.auditor.ssh.client.navigation.MainActivity
end
