# Slackbot: Pingity
### Integrate Pingity.com searches and list reporting into Slack

## Initial Setup
1. Clone this repository and create a copy of `.env.sample` as `.env`.

```bash
.../slackbot-pingity/$ cp .env.sample .env
```

2. Replace the Slack placeholders with your own key:
  * You can build a `SLACK_API_TOKEN` for your implementation by initializing the Slack Bot [here](http://slack.com/services/new/bot).
  * You can build a `SLACK_WEBHOOK_URL` for your implementation by adding Slack's [Incoming WebHooks](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks) app to your workspace, and then adding a configuration for the Pingity-Bot.  (This is a good opportunity to specify a channel where list completion announcements will be broadcast; or, just specify the channel where you expect to be talking to the Pingity-Bot in general.)

3. Replace the Pingity placeholders with your own:
  * Use the developer dashboard in your Pingity account to create an API key pair.
    * `PINGITY_ID` is your API key's *ID* value
    * `PINGITY_SECRET` is your API key's *Secret* value
  * Note: If you're running a local implementation of Pingity for development purposes, replace the `PINGITY_API_BASE` as appropriate (... probably with `http://localhost:3000`).

4. Start the bot:
```bash
.../slackbot-pingity/$ foreman start
```

5. Once the Pingity-Bot is running, invite the Pingity-Bot into a Slack channel:
```
/invite @<bot-name>
```

## Interaction and Commands
(In progress)

