# Créer le masque : quels avions garder ?
masque <- !is.na(avions[["year"]]) &
  avions[["year"]] >= 2000 &
  !is.na(avions[["seats"]]) &
  avions[["seats"]] > 200

# Définir les colonnes à conserver
colonnes <- c("tailnum", "year", "manufacturer", "model", "seats")

# Créer le tableau
avions_recents <- avions[masque, colonnes]

# Afficher le nombre d'avions sélectionnés
nrow(avions_recents)
stopifnot(inherits(avions_recents, "data.frame"))
stopifnot(identical(
  names(avions_recents),
  c("tailnum", "year", "manufacturer", "model", "seats")
))
stopifnot(!anyNA(avions_recents[["year"]]))
stopifnot(!anyNA(avions_recents[["seats"]]))
stopifnot(all(avions_recents[["year"]] >= 2000))
stopifnot(all(avions_recents[["seats"]] > 200))
stopifnot(nrow(avions_recents) == 160)

cat("Avions retenus :", nrow(avions_recents), "\n")
print(utils::head(avions_recents))
proportion_grands_avions <- function(x, seuil = 200) {
  # Proportion de capacités observées strictement supérieures au seuil.
  observed <- x[!is.na(x)]
  if (length(observed) == 0) {
    stop("aucune capacité observée", call. = FALSE)
  }
  mean(observed > seuil)
}

part_grands_avions <- proportion_grands_avions(
  avions[["seats"]],
  seuil = seuil
)
print(part_grands_avions)
stopifnot(inherits(avions_recents, "data.frame"))
stopifnot(identical(
  names(avions_recents),
  c("tailnum", "year", "manufacturer", "model", "seats")
))
stopifnot(!anyNA(avions_recents[["year"]]))
stopifnot(!anyNA(avions_recents[["seats"]]))
stopifnot(all(avions_recents[["year"]] >= 2000))
stopifnot(all(avions_recents[["seats"]] > 200))
stopifnot(nrow(avions_recents) == 160)

cat("Avions retenus :", nrow(avions_recents), "\n")
print(utils::head(avions_recents))
