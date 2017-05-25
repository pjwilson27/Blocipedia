Rails.configuration.stripe = {
    publishable_key: ENV['pk_live_9lcthxpSIHbGwmdO941O1XVU'],
    secret_key: ENV['sk_live_EeHnL644i6zo4Iyq4v1KdV9H']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]