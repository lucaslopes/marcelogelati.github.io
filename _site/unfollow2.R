## Como descobrir se alguém te deu unfollow? Um segundo tutorial:

# Primeiro, rode o seguinte pacote

require(rtweet)

# Em seguida, use a função get_followers() do rtweet para obter seus followers
# Observação: substitua "marcelogelati" por "sua_arroba"

flwrs_passado <- get_followers("marcelogelati")$user_id

# Quando quiser descobrir quem te deu unfollow, rode de novo

flwrs_presente <- get_followers("marcelogelati")$user_id

# Agora, criamos a função de follow e unfollow:

unfollowed_by <- function(flwrs_t0, flwrs_t1) {
  tryCatch(
    error = function(cnd) message("Ninguém te deu unfollow!"), 
    { 
      unfollow_id <- setdiff(flwrs_t0, flwrs_t1)
      lookup_users(unfollow_id)$screen_name
    }
  )
}

followed_by <- function(flwrs_t0, flwrs_t1) {
  tryCatch(
    error = function(cnd) message("Ninguém te seguiu ):"), 
    { 
      follow_id <- setdiff(flwrs_t1, flwrs_t0)
      lookup_users(follow_id)$screen_name
    }
  )
}

# Agora, para ver quem te deu unfollow, rode o código abaixo

unfollowed_by(flwrs_passado, flwrs_presente)

# Analogamente para a função followed_by

# Os valores dentro do vetor "flwrs_passado" são os ids das pessoas que lhe seguiam 
# na última vez que você rodou o código. Caso queira verificar quem são, rode o código
# abaixo

# lookup_users(flwrs_passado)$screen_name
