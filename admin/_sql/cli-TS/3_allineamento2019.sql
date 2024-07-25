
# ---------------------------------------------------------------------- #
# Alter table "USERS"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `USERS` ADD COLUMN `flgUsaDomainController` INTEGER;

ALTER TABLE `USERS` ADD COLUMN `utenteDominio` VARCHAR(40);

CREATE UNIQUE INDEX `IDX_USERS_9` ON `USERS` (`utenteDominio`);


# ---------------------------------------------------------------------- #
# Alter table "DOCUMENTO"                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `DOCUMENTO` ADD COLUMN `tmstinvioMail` DATETIME;


# ---------------------------------------------------------------------- #
# Alter table "BANCA"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `BANCA` ADD COLUMN `flgDefaultBonifico` INTEGER;


# ---------------------------------------------------------------------- #
# Alter table "BANCA"                                                    #
# ---------------------------------------------------------------------- #

ALTER TABLE `BANCA` ADD COLUMN `flgVisualizzaPresentazione` INTEGER;

