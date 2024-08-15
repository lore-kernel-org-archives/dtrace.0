Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A30EA35
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 01:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723683974; cv=fail; b=Y8vtG6yMdNQp+V7L9Xh5rQRoz1YY/dHO+5A2heKsPnHvHw5V4XVeY1le/TXsrU9l5eYfTS0ve6ZH5bjoIGi1YHSaenzyzdigoTxCRxT8hnrwmOa/8Eo1Va1oWunyxG4BQeOFCxsXRQ2RQn1MN+gPRCRZlKsoEzHW7CCYrt1HuHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723683974; c=relaxed/simple;
	bh=ff/v+gGyNlNKvFqW5O0z+hyAJ0EBBnP6wCD4hPOHGiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mriuKKZZVxFPpUfnmEzo13/+cPtxf191H5KixevPIJK25o387sqEi21/0ViTgOowiyZEDZOkbRlUJbGtoyDPV0+Xjxp7eAYSuZ4RCVG2bAYqOBh3Sml0ZcPmTNf3mzOrM55Slb4a6jAlXRxPvrZNlg7W5V6TdnjBD4iMXv0B0IU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Akd4EqQD; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y+YNf9ql reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Akd4EqQD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y+YNf9ql"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EIfMHC006104
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 01:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=Ske80ymr+LDePA18CnU9h3xD+SqPeMolYyItE7snszk=; b=
	Akd4EqQDG42Z6UPHyw/nCDhU2QlnVzK0bf1mEKrlYOgO+Ti0lC/JT1I0av9BnZYo
	8jCxeg4lMgpmLNmzIMHHOHL5T+aSs5remzxBE9Putl9lceYp09jEyyL69xJWHLJc
	hW4LwEnpQiPMnMYxWOyhS7LpiBVsmW3wI50f32/mvCUp4iJ3SkgklVbrv2m8xDvv
	IJFCmfQKTWTaEVyuHpG/5ctQI1nWve5vt4zQNHvx9ADD0AUmOnHqYkMg6/eyt4og
	zyy3+nhzbQt4UTzN0+Gy7IW+UoV6AbA1s5thTiuDO5BgPntb2r4HiUh/3ulgE4jY
	o39N8J9e5z0uJ+E48crFqg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy4bhpq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 01:06:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47ENPheM006077
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 01:06:10 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnbmnn7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 01:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpTUUSZ9/fOiyik3kHDGIGmVJYkzI1ZFyRJn7UKJp2lUzOTPFXY8+uustKsjs9lNx+bjQfEHIXq/RSIcTsVro14U1XodyHoBHRQANdjxW9HsvcJxV/scFwPWdg0LSUVf7gzZnFC+0kz8csRvgnRx234luQPCFt8KBqxt4lCaoleYxRoeRpexqvhxnuljY5pPQCaABU6g2nireVfntfuOeH2Kxvzx+nvdJFKNlV3XpiBfEBUDkgEigIa+8LSHugnPRN6cardVkp87XaSzCBe/qLqN1S58EuvecOJiIpm67zmAueFYdkkyec9M+wOV5PY3IShIyOfLTsX4LM4XvUbeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3K/XF7OJ5ZieQWrUf7Rtp/MmZDwUZVblo7NydR12n8=;
 b=RYmLmERd35iIeldfQd2rqechpkjlYiuYjPvucZQrK3oi2CQnSCI6WG3Vygd961si/+IoyUjqLUz2YwC2FXa1XWqy/6m8b3ASmRp6btElBoRI75d8VxI9IPafGyDJ+EkYi/tiO3GQpu41UUE37JmnH3e174tt3NnwN8yYgidv81CBGOIJ6HF+vN2QzCZilucbKpvDF9/iSkVxqoJAwXN+2FWoAbxfHqJyeTUT6x1wlq5WsdzxHtaHT83j6TtbHnixYFHGKAD45+VSVMVbeHz0VovDjgVu72P9lGpHmrPDTHGHcdt1uylAtokC2oceIfX6Q6+IX2zkjprPu2CfWLa8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3K/XF7OJ5ZieQWrUf7Rtp/MmZDwUZVblo7NydR12n8=;
 b=Y+YNf9qlo0KTDALZbzbcnlYGNwJricOHCjKy58d9Uq2/h0bay7y06xJwhS6FphNlHCeX9RXslvMQc1CnaTQlMkKade9azUpYjfAXDTTmKVS08orB+NpruwTUwQBPQqBKL9sJgkv0JTGe92aNaEo08RStxdj++c4SaRxJdnAzOjQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN4PR10MB5560.namprd10.prod.outlook.com (2603:10b6:806:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.9; Thu, 15 Aug
 2024 01:06:07 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 01:06:07 +0000
Date: Wed, 14 Aug 2024 21:06:04 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Action clear() should clear only one aggregation
Message-ID: <Zr1UfNh6dvi7V4XU@oracle.com>
References: <20240814025925.25408-1-eugene.loh@oracle.com>
 <ZrzT9mvBboADVnsE@oracle.com>
 <f4c37d36-5a0f-17a7-19d3-37afb41a331e@oracle.com>
 <Zr0vcu6DN8ucMO95@oracle.com>
 <86e50ca0-e881-9fdf-e098-027d5da2d1a5@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86e50ca0-e881-9fdf-e098-027d5da2d1a5@oracle.com>
X-ClientProxiedBy: BYAPR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:a03:54::46) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN4PR10MB5560:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6a1653-1d3c-4948-404a-08dcbcc671b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?5a6UqL5aB+vNty6zDHUOvq/sZ/4t5iurpPOMuUxMqfkRiVyRymHM4Y3MZO?=
 =?iso-8859-1?Q?lM4RdhRNjZxx2erzFRcpGC5QCcDNrFhW99uAB7kRY9lwvmna1v3G8Znkdr?=
 =?iso-8859-1?Q?p4E6ev+yrGubVTfl16r0u2rMcieC+8aWqI+Msm9CacwCHBsQ8URgPgmiAN?=
 =?iso-8859-1?Q?nBrYSBKbm77IfhdbhSV/wg77tgj1bd1xLipNhc6UJSOF9lkkVC3C5AAoGv?=
 =?iso-8859-1?Q?WACTlsU+egeEfyzZG9jeoDqJgyi7SlLvPcGondhz4Tfabh04zdpoUk0bIO?=
 =?iso-8859-1?Q?P5rE9wVt4lHz4vCDdQcqtRW9xkgWPPqMTdiuP9wfy3TIAGts/2MYNco56f?=
 =?iso-8859-1?Q?pfacF3ezW2gOWOB/T6yAZ22BBjgAxNopgASQbk7eqRmlgw4rho/hwJXERl?=
 =?iso-8859-1?Q?lcyoBPNYnjAMMiuXZGrKUkqR6HW7KB+XMGabNt4ycvNsLfD5pXqswQKdeB?=
 =?iso-8859-1?Q?9Xftp3zQx9N4DsQ4J+xFhDez+Qkebkv9tM1QkpUYWfALuNs0NdZ+oByklK?=
 =?iso-8859-1?Q?BA6bdr6I6RDphzC+/e4Ja3dSe9gSaAo5kjokAV7UrELDynjeFm7YvQpwCq?=
 =?iso-8859-1?Q?RtrEzHN16yPDMKPwf7EXiPwIGRXOLLo7Vv12YCjn4ZKFCevbp2wuD96IoM?=
 =?iso-8859-1?Q?lF0ak0SIDWdiaX7nlSGpxBdVZDsIlAFTb6coDdcbL+PX379H6pCfhXclSF?=
 =?iso-8859-1?Q?T2+0XHq0Pv8VqGUlCcdr9gPfh8x4w30+8dgH2jenCpU9985MFul2Revf6F?=
 =?iso-8859-1?Q?+G6MoEI5R4NQtFjAtxoE0uusWpuJ/kiS2FOMaFaCaZWKUadLc5JVdonIRB?=
 =?iso-8859-1?Q?M3fC5FKYM9rkwkYE0hl3XgySfwZU9vAwDKurEBmNopResVlctxOxmsKnWQ?=
 =?iso-8859-1?Q?+juJJCrI+wivVRGDspxd1/iyA1k5Wc7V6KxrdLjLyolb2Y5MS0xFwvYOnR?=
 =?iso-8859-1?Q?KBwAH3p8Uqe2V1OETzrXBqic9R8eA/QtXXoOn7cb1+AIEKweFyl58PNRFs?=
 =?iso-8859-1?Q?GdaUAiZhRCXqcTLvi6Ku/Wok+Q12yfe1JqDCrui7A/qyeLZF4WZ2nvf1D/?=
 =?iso-8859-1?Q?3m6ZHXRsyWFCd8z12SAjNnmsBRrqPK0zQJOPk+ZVavTksZ5VGwX5OOhxYB?=
 =?iso-8859-1?Q?tsytG8tG5RN0vCTZIb/a7qPV+SO5635Bo/GZCUH598W1DnNO5W8c7zGXgO?=
 =?iso-8859-1?Q?9bF9urKPRgcf3WPR1aaeRDPhqHmWX41FPS4KaH1Frx9Zv1z5aRLW4I9VBq?=
 =?iso-8859-1?Q?o1cthLI7yz2JeO0Hx2J/WdsBVph0/dVn2v0IMZGcdzQLAdFs5QY9BBvmI3?=
 =?iso-8859-1?Q?085LHrJZI1IScyd/LbRPKT91Otyi9b5nmWebNctmyXAK+huoK02y46dabw?=
 =?iso-8859-1?Q?tuvYeC8kF1hMDfBf2L91zeaPLub3nN3A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/lS3cSB7WCp/szckr8PEWDrTQ328GCLG8bXTK/1rbFEhp1d+4kjzP25IhF?=
 =?iso-8859-1?Q?BQqiMg1/UE9/WqaF7dBJ4e/gZX1vJ92mZABql2q5nuur1s8vCgHH6mGkFH?=
 =?iso-8859-1?Q?Hm4RbPDazYRxjR33EVw6ZWOvGKQbHP+OgXqZZby1lzQ2e83YgSTbPiXYqT?=
 =?iso-8859-1?Q?pAdrCTqqJbgitYQ+FjSqPWpJ5ZOwevBMZSkPIwdpJhgThXrDWVy4XOwfzF?=
 =?iso-8859-1?Q?Tx1N2EGkXsMMPSHtYqVCqcSJglFitMKyhV9GRUNQqb3OHV/irZbckZOEY5?=
 =?iso-8859-1?Q?D0YV2DKMTL3yW5LUicxpTeEdCeKVGodpNPw3Di6sLdS5hg5tfHAAEk413I?=
 =?iso-8859-1?Q?b7YGXlLE5NplafGEZHEVBvkUtd4q9Du5QMs9ZFHlKwu5IqGG8+PpoGbKUM?=
 =?iso-8859-1?Q?t3PHa+AAcJro/Zwva5BUCPI6/GHv9cOU1MixMwQtNcoXvM7pQrxxdshQVT?=
 =?iso-8859-1?Q?K330A1vi9JVcz8/XoPzIusMLmTGE5Jm+9U1rO5Team20dzha43QneMXtoS?=
 =?iso-8859-1?Q?VNzSqrf2mdSq0Olx24o8eVoogAolD7yvKpZtXmXQBsAzYNBwFNejib8o5U?=
 =?iso-8859-1?Q?23ulc/h7KHfrdHX/DwkxUAtXqUaoUWqcBk0KcpVbW3/8Kta/BD0SCvCNoI?=
 =?iso-8859-1?Q?tf4uJj4SmjPl3hPXVDAiSlfyfO6YeJ2KNOoSB9IibsHk2FAYrzI+nWwPBf?=
 =?iso-8859-1?Q?fkmrVu+UjDYOVN38d6m/Td6hGAI+YJEZmVv/fRNMpOV3TUfwHZr5fJMF2d?=
 =?iso-8859-1?Q?dBsEmUMU1q3rvbcCJIlF2s7UpmlCoE7j0EHXSYCdja50Mf67pA2n1BegNg?=
 =?iso-8859-1?Q?+B7e+2+sIieEvlbGK6ocPkMDY1YTtqJycRbLnkENZxTxjgJsYyhYSvbv2U?=
 =?iso-8859-1?Q?Gq6GtHoyzT5IUyB0Gt4bF51GGMO/g6bxHFYRgC/DXyvDTnmwPOF3rUfQwk?=
 =?iso-8859-1?Q?QLwm1+5e9iLanvoF4rYvbi7u9t1n/xRA+E13bzmJSfMmec8munV0kjBg1X?=
 =?iso-8859-1?Q?SQaF4yCVTWa/DfEWZ8zduCGMco1vEhLh1+4LABhtKP5C6DwL3MdHSaOGXa?=
 =?iso-8859-1?Q?Ue+HCLMhIucb2xDN6g1LrdPllRyLkEYMfVpytfRngadWZ82iv3IGtLs9a5?=
 =?iso-8859-1?Q?inh09M+xb8QOmgd726c8vn+AdZSWvV0GIsq1Sj4/Gien4rakppl6QWmlXX?=
 =?iso-8859-1?Q?H4uxuZDmxSihQP2qTimhzRQyoS6Cd599qxSiVVMwjc/0EEWGu+2sAE1O/T?=
 =?iso-8859-1?Q?S0uvlfBD7qAkFoTF9cX7Cp9auprDiXije09oSv63O97LylAk5CHCYBtEX1?=
 =?iso-8859-1?Q?Vy2QPBMUVjNWE1GqeXjmtJoEo8a6S8T6M/v3lXLjl69TlHqLqhS6rbXaBD?=
 =?iso-8859-1?Q?hnNZMF2VkdVQSZEVb6ie2KENWdL5XrAz9fnwwPPBtD9G9BY7Y9m7Um5pQQ?=
 =?iso-8859-1?Q?yJUu4EaeYtgqXzxSTJCSkHx3UHS/F9DmlRLYf9miall4xnd2lMRrBA/7o/?=
 =?iso-8859-1?Q?+NuTlETPBMfXESuNyiPsF/JYtuHyFaPZmtwfIy3IDS09YcjH0deGA81Xqr?=
 =?iso-8859-1?Q?s6fwdxUerZpdHdk/YGIf44H9ZR8wR6cncqEf3fgI6MRWij7jbnbNVOqews?=
 =?iso-8859-1?Q?f59ut+894rpfmQexozi4f8rRExAbXV6I7dkOTEoXpxQma8EhKlzlJA9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1DSy7UKR/gDbGy+xuhVL8fhouFBLRDKpW/pdZp/MTLPPnSI2uuOF8YtD0+LSWSva2vd8iJjHVrvhQqemqYsKskXeHoA1FDz3RZcErk1zSJl6sH4vR5x63jGNwIU7Vvb2uP9nTCLtXc5WhuSybk/MFG8QmS1cF5Ut0PaJdGNp0F+hx9G7WJ9HjTsgamDAthR3uKOJBQNr5kgfGTK21eVrXOvnKw67ayXijOxeRusNDF4bjZlKtmv2H2azdeBDLeEhGnAbtrDv2pi8aEoAN0/low3a508hrsABG3zqfWeCe1v56UNBUioXEtkgXHm5F/haIcDfT1C85EzuBS7PHmE5YpM+0wBiaB5Mzt0MK+hF59aNGiSLQNskOT1fKmcKRpkuTCNMjLEtKGEPOQZKIFLEiEFzKddLJWrG/UdHN97PrITsSbEyoxFbH8CZYdkbRSBhcz0mYN+S+hiyS5eCaT4ArHnjr2fTGZreEzwPLyrD6kUq/emOwsj7VXT8bbfYoiMx1i//MWvXF91nhwvksofPGO6fYco+t9GoIHEmwq6wcD2Kvqj4FPLahdZWNTdUonb6rfKhIG6gkDvFA34MDca3n0KhBMIkx5mnP8b9pnFZu4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6a1653-1d3c-4948-404a-08dcbcc671b3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 01:06:07.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5r+hhQXcwYFw/+Q3rEGa5tqKVsM3i5ifOYAsFETjupMxGQCe4WPO5Y1RpZ4nelXaX5gjISok9lMKFv9UDgzHT4aXgXK3bStZDr/z0XUOD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5560
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_21,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150007
X-Proofpoint-GUID: uARZjwa7t7tw659du0jAcQBErqIWcpa7
X-Proofpoint-ORIG-GUID: uARZjwa7t7tw659du0jAcQBErqIWcpa7

On Wed, Aug 14, 2024 at 07:05:44PM -0400, Eugene Loh wrote:
> On 8/14/24 18:28, Kris Van Hees wrote:
> 
> > On Wed, Aug 14, 2024 at 05:50:27PM -0400, Eugene Loh wrote:
> > > On 8/14/24 11:57, Kris Van Hees wrote:
> > > 
> > > > On Tue, Aug 13, 2024 at 10:59:25PM -0400, eugene.loh@oracle.com wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > 
> > > > > FIXME:  Is libdtrace/libdtrace.ver correctly updated?
> > > Incidentally, what has to be done in this file?
> > > 
> > > > I think that keeping dtrace_aggregate_walk() as-is would be better, along with
> > > > adding a function dtrace_aggregate_clear_one(dtp, aid) that performs the
> > > > lookup from aid to dtrae_aggdata_t *agd, and then calls
> > > > dt__aggregate_clear_one(agd, dtp) to do the actual clearing.  There is no need
> > > > to go through a walker function when we already know we need to operate on
> > > > just one aggregation.
> > > I'm not convinced.
> > > 
> > > "Just one aggregation"?  Yes, just one aggid, but possibly many keys.  To
> > > narrow down to which agd we want, we need to know the key -- and clear()
> > > doesn't give us the key, plus there will generally be more than one key
> > > anyhow.
> > Ah true.  I blanked on the fact that clear(@a) clears that aggregation, and
> > any indexed aggregations with the same name (and thus same aid).
> > 
> > Anyway, given that dtrace_aggregate_walk() is an API function that is exported
> > by libdtrace, we should not change it.
> > 
> > So, I'd propose that instead of introducing a new function, we can make use
> > of the existing dtrace_aggregate_walk() by passing both dtp and the aid as an
> > arg struct.  E.g.
> > 
> > typedef struct dt_clear_arg {
> > 	dtrace_hdl_t	*dtp;
> > 	dtrace_aggid_t	aid;
> > } dt_clear_arg_t;
> 
> Hmm.  Then both dt_consume.c and dt_aggregate.c need to know about this new
> struct.  So, copy it to both files?  Introduce a new dt_aggregate.h?  Ick.

It would be appropriate to add it to dt_aggregate.h because it is a struct that
defines the callback argument.  There is enough precedent for that - in fact,
it is the way this is typically done.

> Maybe the thing to do is use dtrace_aggregate_walk() with a callback in
> dt_consume.c.  The callback can filter on the agg id and call
> dt_aggregate_clear_one() accordingly... I *think* that works.  Let me know
> if you're on board with this approach.

I think I'd rather see the dt_clear_arg_t thing.  I don't think a callback in
dt_consume.c would work without this struct argument because you still would
not be able to get both dtp and aid passed to that callback.

> > void
> > dtrace_aggregate_clear(dtrace_hdl_t *dtp)
> > {
> > 	dt_clear_arg_t	arg = { dtp, aid };
> > 
> >          dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
> > }
> > 
> > nd then dt_aggregate_clear_one() can check the aid and return if the aid
> > is not IDNOE and does not match the one for the aggregation it is called for.
> > That means you also need to change dt_aggregate_snap_one() but there you can
> > also define that arg and set aid as IDNONE in that because we know that if we
> > call dt_aggregate_clear_one() from here weknow it is for an aggregation that
> > needs to be cleared.
> > 
> > > Now, one can argue that in the current implementation and its current hash
> > > function, the aggid tells us at least which hash bucket to search.  So we
> > > could write a special, reduced loop.  Maybe so, but that would be wed to
> > > this particular choice of hash function, and I'd argue the current choice is
> > > a bad one.  E.g., consider:
> > > 
> > >          tick-10 { @pc[uregs[R_PC]] = count() }
> > >          syscall::write:entry { @writeentry = count() }
> > > 
> > > Lots of agd's will be sharing one bucket and another agd is sitting all by
> > > itself.  We ought to change the hash function, and then we'd have to undo
> > > the "search just one bucket" optimization.
> > > 
> > > PS  Here is an oddity:
> > > 
> > >      # /usr/sbin/dtrace -n 'BEGIN { @a[1] = count(); @a[2] = count();
> > > clear(@a[1]); exit(0); }'
> > >      dtrace: description 'BEGIN ' matched 1 probe
> > >       CPU     ID                    FUNCTION:NAME
> > >        34      1                           :BEGIN
> > > 
> > >              1                0
> > >              2                0
> > > 
> > > You *can* specify the key in the clear()!  But dtrace ignores the key.
> > > Silently.  Same behavior in Solaris.
