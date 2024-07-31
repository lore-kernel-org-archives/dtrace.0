Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE0DF53
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455695; cv=fail; b=WwnMYaSKn2StXMKpiHeDDIZd6AuCzhW0c7jaDXtgVW65UjWN9Z7SSQQngXpP43Epm/BIB4Qr48mhhV8amPF5UhjUdC7D/kZ4fPWjCGxUC4Rpeyf/6BpLI0PJOWLAM0ou1gWhOTF4pswHp/8KekLoxC2/0mFetauFNuoSmQCb1pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455695; c=relaxed/simple;
	bh=BxyRBScRSHsJXISg2c4cgbdCRiZejnsFcCc6TcwH4Ao=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=W+h/ZUkW2qg17XQ/cI6Dr9m65lfnfrloQPQ5u1HG9i7jAjHNEcW8fTJG1tvwPRC/BF5z9HNa2cwCtP4iuMEKQq+DUIx8uoMCCZo8YrWYOGqrPz/nbwJpjxFh+fx0T32c09X48M5W5Yy741AyTO2cMzAzaUo/1vTqc69qptqXI+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Limv5WPc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bI+KCGWz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Limv5WPc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bI+KCGWz"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtUaq020427
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=toXpq+nyYJtSGW
	TvJtGyskPjsR5he+1aAmt7OKxmeRE=; b=Limv5WPck6slS2pKQnws0d79zMRg0v
	0iDKkboMQC0PJlAHks49TpWbgGDmDpJYYaBBwlptFu2c/4dbcNyj6bXFGZ+735i8
	cDhgzgAF2GmiSspLTxE5qPWcfsnO2TvNnlQvfEVBEA8GGzeUIB+AZ+RHg/0eJYjH
	sNR1c7Lm0d4ANIaHM02Lc6EhlC1NVa2p/yFN+/FQ68Q/ElVOU6KASRcst4YPaGm7
	2bTZiAJb4o7LpadDYmLT6VirWrF1axq66eikEMJzX8hHaLAYJZz0ivCRUKgh5PPK
	6HsmtdaJAxnT2j9JOM8OTZAS2EoZ9XWBPBcTUEMvj+ulhe1k7uzKqqsQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyg85r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:54:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VINrJO030844
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:54:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehuwfna-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:54:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdK/AG/4eBxPWlhvclgVeve/3WWjvw+T/csQUQeJgEh7U3wMxMzY3O739Owq8k6vFwWD34Bh9EnqxgXUW4uvy2iocFG9qTlilbYG5UKi85l19xLGGStNz5rAboZCXkm2NDX9jLPkASy/n0iCYUZLy2Nd6pI1LWgN7msrMVydlKw8PsY17QXsdgmpFDvzzcivWczc/oGpIQDlcLXRiM3HKTgJa4AGLHhmlMFv1MbQWNxMv14wXQ8qx0qQOpm5KaChxUYqz9qNbevRjKS8p/5nzGlKvWAri5USk63QC0cgAfaGlSA9opdAvEZlgVv4zBH72we6DB7/MgOqLjeJOv4jkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toXpq+nyYJtSGWTvJtGyskPjsR5he+1aAmt7OKxmeRE=;
 b=tji+qt7n6HJO8RI1r8J9gYLRXDqeXnLPyvtCMgEP2lGpyZ6gJePNcPI+NIRN6V4smRBlXbJD1aTYM3yanKRoypAMyjMujFWtKCt8LoAXXBt6buc0InFWYsgEULOpstOE3WH4MFpzRCTyNDWRxPr7WQkNi/hKY+sdYU3Kg+oI8ZmDV+iaFIio4iI4ZGDplzmcj48wqSiAiqLGteTTlVKyas0vDFz0/wtVpCc3SnW/a7T45XzGoCZjTjzdl0tJoIx9L5oObZcpwPIztwtno7smiLFzvZjxzIBdPtsqddIAUWEvi681OizE1dzlszmvi4+jwoaiw+NLO/u2hAtxbz1/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toXpq+nyYJtSGWTvJtGyskPjsR5he+1aAmt7OKxmeRE=;
 b=bI+KCGWzir7GJoq6EzTa6cQLeBcbyj4NAOFiPDMTU4s5agLywmGkuCHq6qCdqqdZv9B8z6GBUtUldbx5Wr6b01EtL2/WEZ2DfyXPLKeUIYKwuL1TD1Wr0o+X5Dj8i/+vjDA0yYU8fasHrxJve1uSdEAwR5CJ47w2GUu/JsCPI/A=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by MN2PR10MB4270.namprd10.prod.outlook.com (2603:10b6:208:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 19:54:48 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 19:54:48 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 0/9] relocatable DTrace
References: <20240531185928.363245-1-nick.alcock@oracle.com>
	<ZqqOogLNszSvuMmW@oracle.com>
Emacs: because extension languages should come with the editor built in.
Date: Wed, 31 Jul 2024 20:54:44 +0100
In-Reply-To: <ZqqOogLNszSvuMmW@oracle.com> (Kris Van Hees's message of "Wed,
	31 Jul 2024 15:21:06 -0400")
Message-ID: <87a5hxmj5n.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|MN2PR10MB4270:EE_
X-MS-Office365-Filtering-Correlation-Id: f7195629-5d01-4260-3ea5-08dcb19aa227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WvCCVf6Ag+VZLjhh6XmlGxLW83hrgGv66lweLxzksH+LCBF5dlqbtDhsKXv0?=
 =?us-ascii?Q?ywv4FtnHuyccgXl2d8o0o9guAqg4veNsXLyB2KfKv25YXTvyi6sAOizRs/Ah?=
 =?us-ascii?Q?6EKe9ZNOaOHeD1l+PouflZx+jsbq93g7t1TSd86lR7M9/UwEP9MvNKR5LwZf?=
 =?us-ascii?Q?20PZzSPgLCEPpbYzm41Wtych0jO3+Z0NFZczRsGzTR2LM3YzZNC71XgchmLU?=
 =?us-ascii?Q?LbBL8ezm/Wl5YTefSYSezbE/6AwKcvKCkC+b9Bza0OxzbSuvIEXHfUc0uNCS?=
 =?us-ascii?Q?oFAJNdnYpDP6kpjPLifmqQmjEcM042MOugSPCnphagAdXsrmzzIq2tpCgNIE?=
 =?us-ascii?Q?7fGZ5GUAwnFufwb1bBEuNN+iw8+IX0lECFaACWVhUHpXZED49uuUSTSP4f/9?=
 =?us-ascii?Q?Q/YJDqmeffmDINeXpUHiELmD5MLLRBOddyGnBogCzRr7PtxLRTHN08Vxfre7?=
 =?us-ascii?Q?1u51YlBoETN/F8JjTDZaW4FejsEBrHttJC527Ryf4/Ry+8b3xQTa9jwR0MA+?=
 =?us-ascii?Q?z2wBcjTX1/DQn3Z1zPUO5qV7JWE3At6Gs9nPRl4PhK0Nfurvbp+9iaogkNbo?=
 =?us-ascii?Q?tSy/JFZ+SvYYCaBZ8P1jAWHo/CU6ryHORkgPwtcYKYp+RRIPztcPi/M+KpOU?=
 =?us-ascii?Q?ooqmtLIFPrMYC8RI410NEK6ADP100+UZ0n/SFciSRZH1IeGwGOX1GeCp/u9n?=
 =?us-ascii?Q?zbO1lWOsdVE2zqT/YUz9eEYd3cCzSpXngsDAoMHj6ZQT1NxInPKuIimA9JJC?=
 =?us-ascii?Q?Bvqky0OUPtuEmdCu1owuwI84vWqj0akrPJbL+bRI8A10M0eFuQcSRvOAmljO?=
 =?us-ascii?Q?yOB1/KPZyaCYW+jGA5JimxmXSZ9O50OQOFJXSdloIUpXp6yD95ZGeenhusa1?=
 =?us-ascii?Q?+AXcecD8zF7Pdkr3h2JXNuNyElJxRh2+mbEutIzVtQDx55LalRWJNdoqXyN6?=
 =?us-ascii?Q?BbxnVAH+aVP1l1+kmnx0Sjm3nX6vTM3RE11sxxaglMYCY3AmA0S8wUlXSeHo?=
 =?us-ascii?Q?Y3JsQeUpvUz5hzNlfTOJTH+V41H2fkcCT0XNUWpTBYKc3ax8GeXJSrvW1jOM?=
 =?us-ascii?Q?QrfdHNIwnYZsps+R2A69OuKmRSswMhlWyY/33nU76k75YYIyVpNdpBh8I2J/?=
 =?us-ascii?Q?fhW8osluc8r8/0wCCzvuJmwsBrteRgEHqoxjlDtEJeqbzxsF4hZyKSZcgQZN?=
 =?us-ascii?Q?6lCTAoFsTWig8W3grkTx5vNkB1VYenzjbUPOgFo3NaX05WLQijk/UDFTkNhx?=
 =?us-ascii?Q?HeHGjq/mvPbzeNT6chfdgDeaCI32gXpQti/qy84mom/vxTTiuly790XKANk7?=
 =?us-ascii?Q?y0UyVLXCZM1C8k0J/zUEKiMeZWF3Juw2bEf2MzjyAcBRkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jIt2kyd09F5GxuCtmnxI0uKoRKrh47PETDpwyReHkNKWgfmpvx9+5q5M6Dnu?=
 =?us-ascii?Q?gwewp9c2C1gtapqswTJQGSlWUdLVxd0b0aTpVqWDC08SzAiCRXPOeQ625hVz?=
 =?us-ascii?Q?8IvlatmZ/6ycYjfOFFyP/mDIiODrgt/ajwbCrblzhcNAnFYsoWAAvQjaZSH6?=
 =?us-ascii?Q?f2xmT/xQSmUvobALH5OwmbZTYA07xEBn0lHwMtpxFvrrDbjwx4qUrlwa3L/R?=
 =?us-ascii?Q?O7+y3S4qg7rrzNPdg6P7F+Drb881HeFWQcC+aIjoG52O/Ngu6umvPx9QS6b+?=
 =?us-ascii?Q?Nr6Bs0HXJYxwxTom83Rx/MZzVdigZhh+LHe5tv0Y4KS/eifumDE+LIcyeZuT?=
 =?us-ascii?Q?TjKL+RyO3r6ncGjH3PfsH3szqShm5SHiHceaZ41qtiu18Y+1Vu2FlAC+8A2U?=
 =?us-ascii?Q?fUZeg63xVwJA8QuSOZYFIo6r78cZyX10nemwjxsS74aLzCEBzfqazkhw9l5c?=
 =?us-ascii?Q?0c6DVXzcaIAK4BKEpO0I03o8tqR42r592IUzc01f0MhPjh7zGbe5+4Qmlihd?=
 =?us-ascii?Q?iGRKbRCtjerboKCUn+yIzqSUUNNM/bgnLZwQMiXE3wp/nbc69w9qhgLpoIU5?=
 =?us-ascii?Q?ZLltPtKID9fpm+Qj6eFX5HupMosfY3fSmGx495Tn8fnEjVAMNbWoFV4lzvc7?=
 =?us-ascii?Q?ie8feQGBLJFTdBflhHXj9DOIdepn/HHLmWJUA2zrYEMI1CFs/JDK7GT60kso?=
 =?us-ascii?Q?sw1NhzPNC02VB/Vc6rxBUCiQIjQWtqRMMJM2WARuz9MGrfr94jSw0YDN7lPP?=
 =?us-ascii?Q?QDBvsLakTyuvq7yQHHPMsSVjP4YPaVjqa8+C0M+Oldff+tfjStHgdAd0ume1?=
 =?us-ascii?Q?5MO3760FjJjIH4OJ0RFLb7DbYeGKRARcO8fsdqIhJTsL1uuxcqPRphOImVA1?=
 =?us-ascii?Q?TywCJ3/3YuU6NZqJjHh7UwIoDySYmiOpN/z/M+TKB4kBx+RdkrfxkK7C7Mjs?=
 =?us-ascii?Q?BLSsJ7iniWNf6mMTJVr+pPHKK4f4uVJVrCl4KfqWhjup2HNyRbDWO+S/nky7?=
 =?us-ascii?Q?vTqZoRJO5QefW1/wPfAkUAGkU6p4+0YMn89YbQd6xUDMsRctZX59IPF5D5s2?=
 =?us-ascii?Q?1DO54oDX60OCkQ+KynnlSAKLEno48baE/fjAkezSBqB/LZoqIbNnNsJ+pg50?=
 =?us-ascii?Q?ksYkM0hGXYdItqyEDMPRTjzJ8+bkHVr/MHVMVL7GZVsj4MIIENMwqwVc0Hh8?=
 =?us-ascii?Q?OZUQOAgVyDJ1p7YercZnPI9lO+0ii981IoQcshaD5ValdTa2I2cxAu1d5s4h?=
 =?us-ascii?Q?kg65/67iYjEq8o65R6aSqNEpFGD9Zz68qnbHrYvHKpe0owrOe44jUnZtb0iq?=
 =?us-ascii?Q?/zieJvUIAfLReMpmaUGNdco2oaEwxu0Oc5s8bjJRfFVhidaDLNsFdYwjmG/a?=
 =?us-ascii?Q?jiUwzsfuLVNp15mYlxAMIdr0101kFe2mPApyjkG1Y830VYCQHHK9Iy0xMoqD?=
 =?us-ascii?Q?EQpQZ5orDfnouv0mmThJym4CpMwwL5kOZWJixF9ego0iOmwQKZsnqglCpLTI?=
 =?us-ascii?Q?cax9m5puxhW81w7Xv3sC9sJiJmz9aTOykKYTeIGaEkzJrnQUG/iO2Kptu4ny?=
 =?us-ascii?Q?REcHC4+beNd+N6bOpnbVhB45NsorkwI1w07nJS1jhJCZUiPMkBMw1/mnqzxd?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jqkDLdZMJMWlgoHpcg0y6y9bliThea16oy2541me49gbFd9+zQXcIRFWm02JtmdKcmngFDOl90xWVV1yozSoq+gFeQsV/9lS6Wb2w7dRrddrXinxv/r2rovIglLiWOqCuXgdhRTqrEwf8X5BQoae7gF291OwPXSyvkvOeZ/fH9hstaGSc/xnLonAjuoHemul34JlQgDLjrh9SZ+RLfJLyn6DgcQBeArbQpgQWWYjBs8zYeNQ0rSQF+LBqoCyV6FEB3j8A6oc1uAtJFhs86flrmqQdmNvreFhbc0fQl72uiSnNv5scctdmFpyV1oamtt/T3/FVDjtiVNPqO+j2dUNb4QPmP4ProDXM8XA3zL5t5yItQqB5pqj9CiVa1CDdd4iAwm4EqPB+Ad08Ed6b6oTXO78nbwm2u6arJBaWqmDGisZ+ylQetILVtsi7Eqn5vJDgQFmuCAs3LGqNZDC8mLx9SJuylztBxj0woQXXihM7SZgqFTg4XG5Ve1rHFXIHY4lq/H2nxmHMMgVLEO5eq0PK61FsUZLXb8USZK3Pnil0pJY2trfAjmXPA1etQD/O2oY54ZSDp8aj5bC+QcEWtDrdFUsL6EQ/IaJotn5YK3nfyo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7195629-5d01-4260-3ea5-08dcb19aa227
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:54:48.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HBwX1D0qsDqRPG3GDpdK8nRokKyaM7yYP/1IqYX0k+vJmV1Y0uVavx41Ro6KGsxWbNB99v7xUXhI3Fs6YA3bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4270
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310140
X-Proofpoint-GUID: 9X2XhFYWCZYZQc6bZpiDj_GyQ3hBuU60
X-Proofpoint-ORIG-GUID: 9X2XhFYWCZYZQc6bZpiDj_GyQ3hBuU60

On 31 Jul 2024, Kris Van Hees said:

> General comments because my review covers the entire series...
>
> Why are there two pkg_config files being introduced when it seems like a
> single dtrace.pc one would be sufficient.  The dtrace utility is used both
> for tracing and for the building of libraries and executables with USDT
> probes,  I see no reason why a single dtrace.pc couldn't cover both.

Simply because there are two distinct use cases here that require a
different set of libraries and headers from different places: "we want
to use USDT using <sdt.h>", and "we are a DTrace consumer". Almost
nothing wants both, only one wants a library, etc etc.

Bear in mind that more-or-less universal usage of pkg-config (as in,
with CMake, Autoconf and Meson it is hard to impossible to do anything
else) has the caller appending $(pkg-config --cflags $pkg) to CFLAGS or
CPPFLAGS and $(pkg-config --libs $pkg) to LIBS. If we tried to use the
same pkg-config file, this would mean that *raw USDT probe users* would
find themselves linking with libdtrace! This is *surely* not what we
want.

pkg-config is not meant to be "one pkg-config file per package", despite
the name: a huge number of packages have multiple. (The worst offender
on my system appears to be Qt 6, with 136, but even a simple thing like
xcb-util has four.)

> On that note, why can't pkg-config then also be used as a means to get the
> location of the dtrace executable?  Why go through the trouble of performing
> text substitution on runtest.sh to insert the location of dtrace when you
> already use pkg-config in it to get the appropriate include directory for
> the installed case.

Because I didn't think of it. That's an excellent idea. Adjusting
accordingly. Will send a v2 of the whole series (because it's been
ages).

> I think this series needs to be reworked to be consistent.  If we are going
> to use pkg-config, then let's use it to its fullest extent rather than using
> it for some stuff but then still hardcoding other things.  That makes no sense
> to me.

Agreed. Anything else you can think of that's hardcoded? I can't
immediately think of anything (because we can't use pkg-config in
dtprobed.service, it's not a program) but you looked at this much more
recently than me...
