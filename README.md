# Codeswipe

![logo](https://github.com/shatanikmahanty/codeswipe/assets/67138059/8a571ddd-5d23-4509-bf26-5eaca4882210)


Open Source Hackathon Matcher app built with Appwrite Cloud and Flutter.

### Enable pre-commit manually

To enable pre commit run:
`chmod +x scripts/git/*.bash && ./scripts/git/install-hook.bash` in the root of the project from git
bash.

To deploy chat collection creation function:
`cd functions/appwrite/chat/functions/createChatCollection`
and `appwrite functions createDeployment --functionId=647ed6b5a93a2312a159 --activate=true --entrypoint="main.dart" --code="."`


