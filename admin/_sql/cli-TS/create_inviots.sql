CREATE TABLE `invio_ts` (
  `id_invioTs` int(11) NOT NULL AUTO_INCREMENT,
  `dataInvio` date DEFAULT NULL,
  `nomeFileZip` varchar(40) DEFAULT NULL,
  `flgStato` int(11) DEFAULT NULL,
  `protocollo` varchar(40) DEFAULT NULL,
  `dataAccoglienza` datetime DEFAULT NULL,
  `codiceEsito` varchar(40) DEFAULT NULL,
  `descrizioneEsito` varchar(500) DEFAULT NULL,
  `codiceErrore` varchar(40) DEFAULT NULL,
  `codiceSsa` varchar(40) DEFAULT NULL,
  `descrizioneInvio` varchar(500) DEFAULT NULL,
  `tsUsername` varchar(40) DEFAULT NULL,
  `tsPinCode` varchar(40) DEFAULT NULL,
  `tsPasssord` varchar(40) DEFAULT NULL,
  `tsCodAsl` char(3) DEFAULT NULL,
  `tsCodRegione` char(3) DEFAULT NULL,
  `tsCfProprietario` varchar(40) DEFAULT NULL,
  `tsPivaProprietario` varchar(11) DEFAULT NULL,
  `tsTipoSoggetto` int(11) DEFAULT NULL,
  `lastUpdTmst` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastUpdId_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_invioTs`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;


CREATE TABLE `errore_invio_ts` (
  `id_erroreInvioTs` int(11) NOT NULL AUTO_INCREMENT,
  `codice` char(4) DEFAULT NULL,
  `descrizione` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_erroreInvioTs`),
  UNIQUE KEY `IDX_ERRORE_INVIO_TS_1` (`codice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;