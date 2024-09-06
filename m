Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A143D0A9
	for <dtrace@lists.linux.dev>; Fri,  6 Sep 2024 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725658187; cv=fail; b=UslOYCEf5vGB5pI753syugagdqu2/BwyOm75uzxUnLrbLCWNoZYrMPRo4bobunpvVGfi5nfTCNYFUfciT906xOmCYuMzl1N0QCfdy+OZUfgpZf3cIkTN+fX6qxH1FTIkLv7i9YAvoROIx462P9+O5V7xGy+rYDnDOkCY9Sorp4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725658187; c=relaxed/simple;
	bh=RJDyPviiL0aeL8O1iN4cM2qWSS2QtvFChZ5TxhlXgNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C7tJG3kfr6cdDHFGo8fVPA7ZEACk2LsgxWG7Ctrs4ZZ8Uu788M4yiPIOzmned/+BIZIGBqjJmZkWMkyMG5U79Yk/9GBYzwUhuwa6vBJxuVdQnGKhshJ73jxpduwcVHNtu+rET1ugYBhKmJwOtbk8GLaiCHX9TvtYk/I/LIcwHfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ka2zmkYV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NsImyzW5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ka2zmkYV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NsImyzW5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486KXVsC015023
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 21:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=FcKUJcI9JNtwSeb
	uKiJdAoPd9nsHtBC4IPvu0dvqcGc=; b=ka2zmkYVwHoRakMSi8IvRDV1QQCfG3z
	7ntWuymwQ6gcb6EK/k254nbDAFAqU+kLQ4n/+UX0kT9w67Oz6hfZJjncc6Zd/Ph1
	GuiLFUCT1YExg9NMclBz15zHBAAOSnM60Cy2/Lc8Fm2rTS6ia9ezlgoqrcTjNQXX
	6APPBo+a2DsC/XUdMzNe3r6ksnklujRi/sq6tTo7rxOYOuFltMA3pftL6dpd24IT
	BV96KKmbmKMVuH7IC/lJzezOWHaqlpFhxtE1+ps3EnQG6sBIV4vVif7kzz4MsExg
	h3jJbhvLuHhGRa0ZeQjSbhCOByYkjTs4vIjrgR+XIhpjSNe1Upp8Bxw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwjjnkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 21:29:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486KKhJi036902
	for <dtrace@lists.linux.dev>; Fri, 6 Sep 2024 21:29:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhygeqbc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Sep 2024 21:29:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OC1A5C2n0F4PGFssKrPMR8TET8KjRfNwzbNHUTCgfdIJbc2oYNFjm4lRlJtdzH6spEhFn6Tl3GC4DohJ+aFs9Sn/I6fFaZ4diCfPtsWeyy4P2/tKjmXF8uOnyEBRJnPZ+zCjBwCMhJY0/Cdwkp0ei91RgAyanTOfs1Rm9DWOdW8O3Gg7ryqVxG9PikJBl4FP5N3xOhlFTpRWtSObjrGCxg8EISyFtLKTaZK0pnlwJGZ6fQnwUvpHq3hSXdczkUvZBdIljD7rL9HV1r71/wU3cUAK2Ni4DkwpnFu33+77Ju/ZR8q8d4aE1Gq2VJQFSDIuA7DGreScjb9WDMaxSQntRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcKUJcI9JNtwSebuKiJdAoPd9nsHtBC4IPvu0dvqcGc=;
 b=WS/b47Ye/9Z2FtPoYo3O4H6/Kbnnw8fjvYw9yA0rqZyuyYUkMkKqxXhiyMainndU1Nc2UcUMEjCQVEbA5PfHt235XfMtbZppjFny5cJVZotYtgDS8uxN/tZXtBBAIxjf9cUZVkpux6x7y8nd5ZMsy+9sW9I1WgWDif7GOGp8bR5degNeWrlbe3zhWsfD1iPg02IAagwErbzpUlQ78mf7PQUT07zuKhoJRSBZhlcjYJDnx/f/iRhcWfjRy0Gzi8ZZ0vZV3kIat9Mt2hlE6k3uiIuqcITcunyKFnfxQV2p4PkWuSmVtul5UYOfC/D0cY8CRWutWcsbSmEySJl2pe8W2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcKUJcI9JNtwSebuKiJdAoPd9nsHtBC4IPvu0dvqcGc=;
 b=NsImyzW5oE0uS5kaGGdfEYegiIuXzyV40MabhWwiYBDq8Pt0hwqiNSUSAaQ3F5maX3H3rM8i3VpyRJ7LuKyJW5mMXVwVgLS/SiRzrjNBp1Doys1sbxXslLDm1yIwYzlYWnCxr0iGZUeCqWsJMJfYS1zHCkO4PnVeFF7lT4ww6KE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB5942.namprd10.prod.outlook.com (2603:10b6:8:a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 6 Sep
 2024 21:29:39 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 21:29:39 +0000
Date: Fri, 6 Sep 2024 17:29:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 01/22] test: Handle dtrace:::ERROR arg3 specially
Message-ID: <Ztt0QYPpgK8y9H1u@oracle.com>
References: <20240905224041.10299-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905224041.10299-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:208:32f::11) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a21824-852c-4481-4764-08dccebb03c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xUVif7IA36zWli8FDpu+Uu5aFieWWPKMN2xFbCxnIQGiBiVsxMEkrqZktuSZ?=
 =?us-ascii?Q?m7vm3GqRPX3lX7MjauS22UqzX0lftTjoblongzbYR4F+ejQEm+E36+S2iBto?=
 =?us-ascii?Q?lJZnZ9WC+W3cABlMh4zqL7L7p1KwYo1vAV+FZOfLZ4FpMu+/ruOgN6Hlvyhq?=
 =?us-ascii?Q?427GJ4Vr0GLrAXE5ofw9n4qMDTtL5d59oWfMvKh2nDsRYlnLy9jbJqZkbr92?=
 =?us-ascii?Q?jCepqZLnl0ZCf/X6J5Dsf7T/lPf+twFueU6gi0Jg5VihNRl4MUddzrK0eW+D?=
 =?us-ascii?Q?3bQirBBFxe9DC+C2e8va3HE0PaQnS58pnl43RdL6Z07awZsx9ulqMDUGNtzC?=
 =?us-ascii?Q?PheszjRuXyovw7FW7lUwEgk7jI2nfLFkCKLJSCgz5kQvi3WcCQfA48QjyzQr?=
 =?us-ascii?Q?Iuj+rDY7tepRuany/cwMWOcYLpCDgWU4pKrIneeBNCAnnYlWuF7elIDjJxcL?=
 =?us-ascii?Q?6dlui9tX+jHhdMPHjU3ReYERkrZYtimUjGC8+zV1zU+VO12eomrEBlSH2ibM?=
 =?us-ascii?Q?MvNn5UrStBmh9ROQ5uxSn4copICfyXCfb51Eq/Zj3RYxo4/ywGzLzava2rmA?=
 =?us-ascii?Q?FG2ZLXbL/1itHTNLiCqmtASopBjUcRODn30n9cNaxsoDGfYtHda218idJHHq?=
 =?us-ascii?Q?xHjGw46/IaqZBlTUrBmff6bhv0UKKOf/YGVcNsAPizjOht1Y3ZNumI/Q0009?=
 =?us-ascii?Q?M+KlVDOBe41SL6V8+aftcaR2kISckDHCPCqYb+PNV4lxiH+aYoszxo4+CCNl?=
 =?us-ascii?Q?ctAUs4rFwrRe5PA+oHxvo8Uo8gTMHu4aS9R9AyyM8UpLw5Io4IuNYDjklvZf?=
 =?us-ascii?Q?05qf27CiEQixAKkxiX1UaWZDGFKjsI82JkXbZYIp/WYi9PycWV0nVdc922da?=
 =?us-ascii?Q?sodrOr2MAeKypcav73f6YkCpnRXzsxgdvbcKolZLfm2EXFIp48D2iwZ1asH6?=
 =?us-ascii?Q?NGcc4FGDW50pAa/dhmxAt7RcnuR9TzQePmcesyDv2MlFZrF5WHABNI8hh41x?=
 =?us-ascii?Q?wPK1LRV3xEPQM/IJIjyu0xAapwIp1XnJ23MkvYl7lOrXz8jX8dDtm+mAgC1T?=
 =?us-ascii?Q?BfX8fElZhP6+yQcr4ubTXl2bPI0HL37ZR3sVkFD0kQt/3uaZNX+ez5w2j7RA?=
 =?us-ascii?Q?nKxlA3yc27MQndjNFoYm+GtfGYzrIjOAI9kaS2wWsOV5HZiunr/2IlQ6WZSx?=
 =?us-ascii?Q?YNi2AptFolXSjTExqkBXK8RRiO1P/bwyGSqvLCoaG/XC/fsjeu9CY/L8xcxF?=
 =?us-ascii?Q?kj0bxXk2TX00TxeAurJ0bNhINdI05r1zIjCj9YQ57bXhdxvz71LaSmTfTbrw?=
 =?us-ascii?Q?ozjsU8DLtOeQLIGHn9iKOPz9ILuL38LxRVaDOZKWg1i5hw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vvHxas1CCepgujqRuDqQ7lh+0kiNaGz0t/My4OQlGiA/LbPFxKnYugJ1dVMX?=
 =?us-ascii?Q?vNFCLAs/IWlNdWZbYiLg+c9mYfmVER/em4lxYFghAiVELTZDMO7T/jpJKyjZ?=
 =?us-ascii?Q?C9aT/dUDi2rwPzrGsT7dQX5Ttd3r0vAXXiQ2lY85rH5J0buUOg/FAgNTGfzJ?=
 =?us-ascii?Q?Eeh+gF9CR6wEsEQAtDlHUwSndHoudK+s1Vy3B+ZF+yQVvb26mqWvffwO7Vlc?=
 =?us-ascii?Q?Dx/9VcGQfILGlIy/FmYXuj7lqlvROdx8b4SXkK7m12zNu5eUHDftZwgME/ff?=
 =?us-ascii?Q?55LWFV/9cja5h2gNy6pvke5uQSda6AB1tNtS5xTJ3zlGIWTPc2UzteCDlaD3?=
 =?us-ascii?Q?OD9uv1PenEBZ6cHyAImwxhp7/YPqO5y/1O5XDiORV39fmPAsS9is0nkqoK5U?=
 =?us-ascii?Q?qehkVQS+SD4iGxIBcexKmZ/SKw4HtuRCi3YBzTMm3KbbeorWZDSunqkwUGxX?=
 =?us-ascii?Q?FqbkXWAGfG/lsHghmBVumGra/Ctcmh5dkywBCRPX2nCfrz1IGFsaJKQHF506?=
 =?us-ascii?Q?iseFghjOfYiPJVg0/gNJ3qTZPiEnGDEO3QzjK2K1Hv2eKzWhbwpeHo9uUEKc?=
 =?us-ascii?Q?04KkpVf4FJV70az3z2YAMpbqlpB3xXifNj9Nc3fk2+No9gbOA9KY2OpmXNRd?=
 =?us-ascii?Q?RYg0XmyZoe9RL99/Rn9cIs2+3TvPozGxQd/ZTT2UZ0z/sef7oqoVeZTHqNH2?=
 =?us-ascii?Q?wDoHIiDtLloZ2xWhQFAGTzPXOW+3P7NgNZN5J6k10l9P1XmxDYsupNWf0EYg?=
 =?us-ascii?Q?ITn59Sc+m2r3H76vg/GuoICF425tV51qJvw4NeZkilwkiGji3e0iXwjCyyI0?=
 =?us-ascii?Q?B+vTbsA15oBK8vTmuhAB3681ef6TKFXOe35GIAMFvlB19MIghr0+HLzLwQy1?=
 =?us-ascii?Q?XUVfGFeorfShosXf+kZFFZ+WrQtXlmssA57u03++jKdYlpMdy1PU6S8B/SET?=
 =?us-ascii?Q?/y/c0/6I1/2IsZKmeCVG7g9cgBL3b42QzBKyI1C9IYOHEzJ6jRjCfwwol921?=
 =?us-ascii?Q?jhocUBdLBHryqV/LVrvnCs4v3YdWpWzFkzc1TyGKczb+g6laye6JpjEFWKba?=
 =?us-ascii?Q?cDyGG17Xjy5W+N87K3REspdtDXCWeu/xvDdFqVcMxx0z2JkGYJBCcvqQtfu/?=
 =?us-ascii?Q?jVioh3X2Fq+IHONFkUquR58Lp6kx1IgIJi56Tld+OJreDAEcCdoWHWLaXvwV?=
 =?us-ascii?Q?IqSivJUC7uIcLCJkk7bTrkLE9mVKhN9l23mSfdQExfK8PG1RhojLyEXE9+9S?=
 =?us-ascii?Q?g5aiHecABGMqq2vcz9HrMJskYjg+Lw6rT9s/Wk3m6qxGThW8UUY2Bzz1/UnF?=
 =?us-ascii?Q?N3VBjMgiv1X47hW7T8+h4TsfTEuObcFMCtCUF4EGp5BEoj3YHvJAxJDZlK1q?=
 =?us-ascii?Q?1JBiJyx/f/yA+3sTLWQa54ZQuB9qQe6aT5EQ/hCeQ0sw9IyCzKdl6+ZpoHUf?=
 =?us-ascii?Q?ikuBNbzSZW40f5tNJIdZc7Xco9ccZHS+G72IYPmCaQbm/L9h2aJuQ9JIbeKZ?=
 =?us-ascii?Q?YyuYIHmDxQ4IL2RGUbI0mfX7gavOQctTML//pviKQ1/vS0Pbko1zDPZLCkdH?=
 =?us-ascii?Q?LS6LIkOj8fsuXG44eqXkkdcW9UcXibebcpzDXSl4vhs3mGyeoFd097SPYGvU?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4p+sIihcUh7L53MkFMuz+OXwtr/3bOalejIG/nih4oBBwMNA9jmzc8KePkwOHPIPRDsRDeHlPN1Giq+CpCMj8tp+//wm5Qc1AT7KDdpHWHhjnyB+NKddm9Jlbm1z2jKwB2MUN79zsyBL/VUQN2tBnjyPh7ckcpd2gQsAxQxLAE9+CZ/ru2g7tMMIPKXSzC3HkmBmp4/zQReB5AMRpOuq3kpsfBWzdRrdaagUrtxdf5QBU6g8Py0Nrf/w9TxXMWPCKlbe/W47lkojKc+Xtf5+1xFEt8O/id9MnCmWUz6iLTp7PHybKV4nJwWJV5+yUuIXBBev2SRLNESYv7HFZgfT6a7PEATyz7Q1iyd8W8bneLzumoOz1Z0vEaYWRj2Pr6h3fXlbNvULPmuGEOGnThQjdQFc+ibvLLhjY94890yEPQpZLlhrLw39cI3PUzu3aU6MIjE5I00wJci6GEXXGhUIp6OlGAU9KQU2oiYCPeZsBmvgunBbKBB3YZsZtLtpzBp1qLFW31MGN5cSWV2Opzd9Q2bUp/DIJqMhuQUW9Bbrbj8eQd1J74Rpgcv9tctQfgqSn5c5omDlIy1uzAmzaMZeLv/wS2qaodfIxbS0Vv4ZQm8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a21824-852c-4481-4764-08dccebb03c2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 21:29:39.8011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POBRQ+ZqnrDi6UNRs3UbLrt384uFjRnUKNiua2hGT8zlrGjuIlWETVpGes8Gi+EiKSgiiaRMq5pzN5RV0y9xYGGi+WC03+eIi5+uQCKk1sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5942
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409060160
X-Proofpoint-ORIG-GUID: SDmOc0Zxh8NG03Dvqt6fE2wguEozEZec
X-Proofpoint-GUID: SDmOc0Zxh8NG03Dvqt6fE2wguEozEZec

On Thu, Sep 05, 2024 at 06:40:41PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The ERROR probe's arg3 reports the culprit PC, whose value can vary
> with minor implementation changes.  On the one hand, we do not want
> tests to be overly sensitive to this value.  On the other hand, we
> do want to check the value is correct.
> 
> Therefore:
> 
> *)  Change tests that dump ERROR's args to omit arg3.
> 
> *)  Add new tests that check that ERROR's arg3 is correct.
>     One test is more stringent but potentially more sensitive
>     to unrelated changes;  the other is more lax, simpler, and
>     less sensitive to other variations.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

.. with 2 minor changes to my test in the patch because I realized it output
success unconditionally.  Also adapted the patch to test for the current
ERROR message output (that will change later with the EPID deprecation patch).

> ---
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
>  .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
>  .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
>  .../variables/bvar/tst.arg3-ERROR-b.r         |   2 +
>  .../variables/bvar/tst.arg3-ERROR-b.sh        |  84 +++++++++++
>  test/unittest/variables/bvar/tst.arg3-ERROR.r |   1 +
>  .../unittest/variables/bvar/tst.arg3-ERROR.sh | 141 ++++++++++++++++++
>  8 files changed, 237 insertions(+), 9 deletions(-)
>  create mode 100644 test/unittest/variables/bvar/tst.arg3-ERROR-b.r
>  create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
>  create mode 100644 test/unittest/variables/bvar/tst.arg3-ERROR.r
>  create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh
> 
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> index 001903ff..bfc77bf5 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -19,8 +19,8 @@
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u PC %u %u\n",
> +		arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
>  	exit(0);
>  }
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> index b11f6c99..3e7caac4 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> @@ -1,4 +1,4 @@
> -The arguments are 2 2 4 1 64
> +The arguments are 2 2 PC 1 64
>  The value of arg4 = 0
>  
>  -- @@stderr --
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> index c23f9503..ec519f4f 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> @@ -1,10 +1,10 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 d_path */
>  
>  /*
>   * ASSERTION:
> @@ -18,8 +18,7 @@
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
>  	printf("The value of arg5 should be %u\n", 0x18);
>  	exit(0);
> @@ -29,4 +28,5 @@ BEGIN
>  {
>  	d = d_path((struct path *)0x18);
>  	trace(d);
> +	exit(1);
>  }
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> index 8c601a43..be1f6d5b 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> @@ -1,4 +1,4 @@
> -The arguments are 2 1 28 1 24
> +The arguments are 2 1 PC 1 24
>  The value of arg4 should be 1
>  The value of arg5 should be 24
>  
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR-b.r b/test/unittest/variables/bvar/tst.arg3-ERROR-b.r
> new file mode 100644
> index 00000000..c05690dd
> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR-b.r
> @@ -0,0 +1,2 @@
> +OK
> +success
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
> new file mode 100755
> index 00000000..fb2518ec
> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
> @@ -0,0 +1,84 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +##
> +# ASSERTION: The ERROR arg3 value reports the correct PC value.
> +#
> +# SECTION: Variables/Built-in Variables/arg3
> +##
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/arg3-ERROR-b.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +$dtrace $dt_flags -xdisasm=8 -Sqs /dev/stdin << EOT &> D.out
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* 1st ERROR */
> +}
> +
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* 2nd ERROR */
> +}
> +
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* 3rd ERROR */
> +}
> +
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* 4th ERROR */
> +}
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +EOT
> +
> +awk '/call dt_probe_error/ {
> +	sites[int($1)] = 1;
> +	next;
> +     }
> +
> +     /error in dt_clause_/ {
> +	if (!($NF in sites)) {
> +	    print;
> +	    print "  No call to dt_probe_error found at PC " $NF;
> +	} else {
> +	    ok++;
> +	    delete sites[$NF];
> +	}
> +     }
> +
> +     END {
> +	if (ok != 4) {
> +	    print "\nFound " ok " valid calls to dt_probe_error, expected 4";
> +	    exit 1;
> +	}
> +
> +	print "OK";
> +	exit 0;
> +     }' D.out
> +
> +rc=$?
> +
> +[ $rc -ne 0 ] && cat D.out
> +
> +rm -rf $DIRNAME
> +
> +echo success
> +exit $rc
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.r b/test/unittest/variables/bvar/tst.arg3-ERROR.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> new file mode 100755
> index 00000000..4f2c70f3
> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> @@ -0,0 +1,141 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +##
> +# ASSERTION: The ERROR arg3 value reports the correct PC value.
> +#
> +# SECTION: Variables/Built-in Variables/arg3
> +##
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +function dump_files {
> +	for x in $*; do
> +		echo ==== $x
> +		cat $x
> +	done
> +}
> +
> +# Run DTrace, also collecting disassembly.
> +
> +$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
> +BEGIN { nerrs = 0; }		/* dt_clause_0 */
> +BEGIN { y = *((int*)64); }	/* dt_clause_1 */
> +BEGIN { y = *((int*)64); }	/* dt_clause_2 */
> +BEGIN { y = *((int*)64); }	/* dt_clause_3 */
> +BEGIN { y = *((int*)64); }	/* dt_clause_4 */
> +BEGIN { exit(0); }		/* dt_clause_5 */
> +
> +ERROR
> +{
> +	/* Report the problematic PC and continue execution. */
> +	printf("Error %d at %x\n", ++nerrs, arg3);
> +}
> +' >& disasm.out
> +if [ $? -ne 0 ]; then
> +	echo DTrace failure
> +	dump_files disasm.out
> +	exit 1
> +fi
> +
> +# Parse the disassembly output for start PCs for the dt_clause_n.
> +
> +awk '
> +BEGIN { phase = 0 }
> +
> +# Look for disassembly of dtrace:::BEGIN.
> +phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> +phase == 0 { next }
> +
> +# Look for a blank line, denoting the start of the variable table.
> +phase == 1 && NF == 0 { phase = 2; next }
> +phase == 1 { next }
> +
> +# Look for a blank line, denoting the start of the BPF relocations.
> +phase == 2 && NF == 0 { phase = 3; next }
> +phase == 2 { next }
> +
> +# Report PC for each "dt_clause_n" (or a blank line to finish).
> +phase == 3 && /dt_clause_/ { print $3, $4; next }
> +phase == 3 && NF == 0 { exit(0) }
> +phase == 3 { next }
> +' disasm.out > dt_clause_start_pcs.txt
> +if [ $? -ne 0 ]; then
> +	echo ERROR: awk
> +	dump_files disasm.out dt_clause_start_pcs.txt
> +	exit 1
> +fi
> +
> +# Confirm that we found expected clauses 0-5.
> +
> +for n in 0 1 2 3 4 5; do
> +	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
> +done
> +if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
> +	echo ERROR: did not find all expected dt_clause_n
> +	dump_files disasm.out dt_clause_start_pcs.txt
> +fi
> +
> +# Dump the error PCs to a file.
> +#
> +# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
> +# we are looking for: "y = *64".  Each time, we check if the address is
> +# 0, calling dt_probe_error() if necessary.  Then we try to dereference
> +# the value, again calling dt_probe_error() if necessary.  The second
> +# dt_probe_error() is the problematic one.  We look for those calls.
> +for n in 1 2 3 4; do
> +	# For dt_clause_$n, find the starting PC.
> +	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
> +
> +	# Look for the starting PC and then the second dt_probe_error().
> +	awk '
> +	BEGIN { phase = 0 }
> +
> +	# Look for disassembly of dtrace:::BEGIN.
> +	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
> +	phase == 0 { next }
> +
> +	# Look for the start PC of dt_clause_n.
> +	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
> +	phase == 1 { next }
> +
> +	# Look for the first dt_probe_error() call.
> +	phase == 2 && /dt_probe_error/ { phase = 3; next }
> +	phase == 2 { next }
> +
> +	# Look for the second dt_probe_error() call, reporting the PC and quitting.
> +	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
> +	phase == 3 { next }
> +	' disasm.out >> err_pcs.txt
> +done
> +
> +# Do a sanity check on DTrace's error output.
> +
> +awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
> +  disasm.out > err_pcs.txt.chk1
> +if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
> +	echo ERROR: problem with DTrace error output
> +	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
> +	exit 1
> +fi
> +
> +# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
> +
> +if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
> +	echo ERROR: D script output looks wrong
> +	dump_files D.out err_pcs.txt
> +	exit 1
> +fi
> +
> +echo success
> +
> +exit 0
> -- 
> 2.43.5
> 
