Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE1721A420
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403544; cv=fail; b=iNMA0EKT2rLiozWDO7e46EVdCeU+Y5NZeSO7pNOse6qHatCWdtPF7Pu505DV5mXIcFy1d/fxLcIehOx2NhluRA820splpANq7Sd6P72CQhoAPb+BGAVrlXzFu75i1eXLw+qSgjzfAge9Fs7ECCemUiAu3Q2fzKz8TPgUVDAum78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403544; c=relaxed/simple;
	bh=Gslrti56FcsbonsgOZxLQE5vRJSrnsfBQwfFNUf0UvU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=CPxt0FSBesY14mnth6UuxDmnm+zjO9t4Wj7iICaH3BHRcz771bEM1SYZPtCuCe5WMuiu0InDUfajrcOKC6/xstpxEsj6KH20eDQMEoFHf848WRCTqkq4s+2kNTuEKktjA1n+EW047FhN/KGLww6kz2gkEPpuOCz9ewp4lhn9dSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TuR6jHuO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iv7A3Kz0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TuR6jHuO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iv7A3Kz0"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57NBwh001457
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 12:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=gK4InErnP+EzfzYRJ5
	Xcn5TxZFUxFeNni/CmLAHVAcU=; b=TuR6jHuO3pE9SSfTiwvgzW78acb/d09Rdv
	6Eu5fjCmTTolBNJw8Mm1XI653Bfe80y2NKRfQJN//EE/NzlJJ9v/mzkBaBMDjMU3
	XffUXGmT1zyR3Cu65ClwjZwqpJoYrDg7WV3Gq5VrU2aOyxsWVmXbMmuNFni/x0I7
	FfpZa4LEl8KQHURJwxodsLx091mpssgKjN4U7Y8ZPvv38TdfVyoaAZLlDsNE55hp
	SXEMsnsTdQA1dNaEKis3aSmhIP//dRlrwVFFhsMb624zFTaZptR9e/4u/DxN1ImS
	htMgyCyla8fPtW2w/iDYkHC39Pyso+3qvC8BDm9MPoHhZYWIAzDA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tasatwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 12:59:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5C2Rs7001440
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 12:58:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5auq0x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 12:58:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMbLGsQNYqz9dL2uDw7jl1Aw2Aq/lM9V766kv0N5Wn6w4ZDU8MqcUJ81bAoN3tGLbiSgLaqk4DbSHozRepMZyYju2F0jDM++Ol2cpnGpm+XaYhq7iOSuT7pkK0AX2Qarat0rFucnUUFJhifcLm2fLzhZYdmqrhM8YXRmhBc8CnXhTzJHwxmO3GAZNkQ+cUgvMzJPyxu93m0MMAIxzy1zADc4javIVD/zs8qVsvRR/x0w4iE1Xy5DdcdDNP0iNyakPkgTNvUayhkKz4+TGYFRNyyW/gYry62xBE+uqVO8TQM+ftk3cdGsvb6S2mGUhQ7hDeTFOhOzuwcDDz9TEhR3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK4InErnP+EzfzYRJ5Xcn5TxZFUxFeNni/CmLAHVAcU=;
 b=X0xIdO50wsIQY99mW2k26FtZaTxgQ3Cx3Cm40sEHW3/i9sCDz7DohGDPViMVKX6WVHDiTxir+KhfvMDINEyxYpYJ7P79eALGcuUhuKSqFDGb36QkvQ7eQg67n1VZqYaGekdfiryMMo1BpkoT2joxV2gsmlZavepikTwTXGkhUJQT3cd0/gRmdq840PR9DMHI7pgbB+NJHmLhMijMiYYymkHJsN9MC8znXoHlGwCG88NhoE+zvhyWefxOfe8F+d8TGoFt+Uf806khlZMmBk9wPZBn6yt53aqFa8RYE3zxO4+kCOZndA4uy62BYvBZqcVIXikOlkEhmMtq+PRFisCHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK4InErnP+EzfzYRJ5Xcn5TxZFUxFeNni/CmLAHVAcU=;
 b=iv7A3Kz0cgyMIH4HXj2jHDuHs66oQuu1pb33f5W3G6NUe++L4vkr4N6F8onAgKEbIFZXKYA7JzLWxQYuvOkfBLBqWFkzlWWJ8YX95/tdt+rjsaOePBtM+CUjTWY7U3H6eERdAq12b7gsNMT2oqjHaEBXOkTSMzxe6oohdoWpM9U=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB6026.namprd10.prod.outlook.com (2603:10b6:208:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 12:58:55 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 12:58:55 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: Re: [PATCH 2/5] proc: more self-grab improvements
References: <20241203113610.75104-1-nick.alcock@oracle.com>
	<20241203113610.75104-3-nick.alcock@oracle.com>
	<87frn43mqq.fsf@esperi.org.uk>
Emacs: (setq software-quality (/ 1 number-of-authors))
Date: Thu, 05 Dec 2024 12:58:48 +0000
In-Reply-To: <87frn43mqq.fsf@esperi.org.uk> (Nick Alcock's message of "Tue, 03
	Dec 2024 13:43:57 +0000")
Message-ID: <878qsus2uv.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0282.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 88eebbde-7b01-4267-9bdc-08dd152c928e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dd4ZGzMIdygaoU7HB2N/RVDUg1pg+TkdSveuATuCFllqLtS6gcayMxGgs8YI?=
 =?us-ascii?Q?Ve7smo1s3HpUYC3J1INKEeRjR9+VyM0PhiI8neQidd+nA2W/kLGgUdcADrcc?=
 =?us-ascii?Q?Rw+qLp19BSFF9AMkrri2TRQnovEyLfVRjT8rm1F8rhLcNCYZhSs5py+pPhud?=
 =?us-ascii?Q?BQpjxAM2XbJHgcwK+q1tRweX7DvQLib3Mkk086ZCOfVB9LULDjzoFqQpJLZc?=
 =?us-ascii?Q?W3H8/1nY0DqZ53FlnUJTVpk9WaCaUMNtpNXPrhkaiERnw2tPkKB2+04v0l1Z?=
 =?us-ascii?Q?jAiYHG1ab1HI5tjnE9zibsGamvGVjAh8y0rFJZ91H9+Cqu6YtGmbgA6SZTxr?=
 =?us-ascii?Q?/dX8x3osUDbSRuCGqw9AsyzpMlhiO50o7pp7JMyOEBkgTgiunTO/TRONHZB1?=
 =?us-ascii?Q?eI3XQ9GowasrgQPCt3SZQ1qvMWwqt7SzQoGMbJiu8o9a91ea2YBF8GCU7dsw?=
 =?us-ascii?Q?cbOV8Lf2+i0fMaE51BqPZD+UfS/DkDdhxpzSe3YjYbrD+ALVJN+J1xrvREMf?=
 =?us-ascii?Q?cWbdNkr4JfBwVaB+4Zz/fzl8nNcVzeS3BxafiAVNqmc9+HfjnHZIFvgShZEi?=
 =?us-ascii?Q?hQpuOFZTa0xPkfsi1ErmCZDGSYHz1b+8K7Q/1E5JIFA60JWJp49DwfXR3V5X?=
 =?us-ascii?Q?wVDwoLjiYp9R2MpYwIDzHOWC88Zg7zr7Jun01MH/UEriSI7IOpVZSiUf4hSq?=
 =?us-ascii?Q?YabS0seYECQ6avSE5v/b+OieYxlXNUh25Hq25/9By+4H7rIYmiaMpuiHPl/w?=
 =?us-ascii?Q?sPn7F3IgYdSK7CfiOTUsJZFZKJF5gQ5YTO+nQFvoEoyJ1wC3yH4RuNM+7F/z?=
 =?us-ascii?Q?Mzzf2crzlrj4quJDf+8IQOSNf9JmaGdoXIV8hZ2Lxz1oOGlcjiinDGVEz1GX?=
 =?us-ascii?Q?6bBIOa3SqZQmlNkMHK84F+ukMMY1XJTA/bK0RD+giE2dXzmFEK9vXMXR6c47?=
 =?us-ascii?Q?IQHUJTqclDRZwtSbsthCoqk/bqjRPMbftsSbgmlW8bNcZnGC6K1NWVCO4tlO?=
 =?us-ascii?Q?4s951QYqEPd4VSXc9ibyzjhLJF+U8i+XYXLJnGcAGGTucdBG9MFh4M3sO/Gw?=
 =?us-ascii?Q?qIF+BVguWsyVdEW0fsZ5TMShRbGb+bO/EOjv8XDvP20M7gK416iUoTK8QaWb?=
 =?us-ascii?Q?nmKDkqGV9VpSrWelEOITDFrwQkcMJl6UF+k6uzQw6DCpsAu10KxNDO72gsdE?=
 =?us-ascii?Q?ZlPZabxWJfnHy/Niio/wmaTtbkNnOmeiLlytHCm8amM078saK3/iwHtMqjr/?=
 =?us-ascii?Q?MI46QDvNx+I1u6ZIoXxUVh+1dgUqdTKGhFeQ1UPmgXBHFh8tW0LPfJawu9GS?=
 =?us-ascii?Q?v8TtB9DsVy7Prm2zRZmQj3O7F8oJMoHejj7tIQvTkZUJ0+ayMV1c6o6powXB?=
 =?us-ascii?Q?eOTRjqA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9W2khBRnz/qVEllsFOsHS5D8m9Ea994m+TDbUiICH4YDN7fCeJW9NCiuMlpM?=
 =?us-ascii?Q?oYDtVDeMYzBeApwVjpMJezf2J6zo2f8Mc2vG3iMRzK7vV38IItEO06IOON70?=
 =?us-ascii?Q?j3M9iA3PvNsKsoaO8EIMxS34x+tzmyK/sQEv+YDhKUzdNL013jRaZtWhwIVo?=
 =?us-ascii?Q?CZo41M/m/fuYZtVFHmh92La7nVRfC9aR0O0cb5I9ZH4jiAXSWfoXizuyRl4G?=
 =?us-ascii?Q?6R+3lw7OhMOA6sYYyDkREqJp5NZp55nEwf0dIeWB9nSH5SJ/oGjr/OqZF8W8?=
 =?us-ascii?Q?mNMJdXrwbh05iZZjDWV2Ft6R0CayttOi1cyGJaXk3WigF/7jfXuxuWyYQKd2?=
 =?us-ascii?Q?YZmTh9ykJvLCDtlqyaNu2rHIEMDvfJnMQN9wTVoP8WbTqAuHnyeHsJquSPZv?=
 =?us-ascii?Q?48WYu9Z8Q19tckdaBfJQYM/4OCWNFlrF7NrxswMIKi8fdn5B1KvnDKrcWwwR?=
 =?us-ascii?Q?K4/I6NGBAzp+xDcxBygg2QTLEFcjXfhbhJn4R1ILBeTJhJ19yoiVPTFSOIFz?=
 =?us-ascii?Q?Fc3qfIryvy+msQzuovIgZz4EvpHFVNqfRLYjavL8JR30gdmR/tf5igWJZcij?=
 =?us-ascii?Q?F/pjYbuHnZMCG+AGmqen/c+CdcJIasKPkzrn/1+InwmpRgI/hxx8+1FQZ/1c?=
 =?us-ascii?Q?m2kNW9GpNiDxT/VeHmNt9iMILR7GuTGWrOXngw3vVlXfB7Nq5Je85v13wPQT?=
 =?us-ascii?Q?A8RFrXmo8Sz9vYorr85Cx863/tfQRZNoGlF+nilgVg24F+0diX0nZwy9WWRD?=
 =?us-ascii?Q?fkmdCI8/HoduvZkhdStoeWVNmGVdOmG4IzO7IjTFk/4IXYeYZTBpjQoA2Mu4?=
 =?us-ascii?Q?GXWZJi5V0uK/y1qMHE4B7SxGMLqAtsXda7b9t9+QjZIHABC3PliqzZBB44jj?=
 =?us-ascii?Q?mwxzqBCO1GgOl9khPmj+SR17nN74XwThL//lM3ub/3475hfhb5fT1xuPwZcC?=
 =?us-ascii?Q?0Ni40o+i7vM7v4LFeFWEqQ+1X0onp2mmK/f6v0QGwnKGjilXMW4G94rmmNNS?=
 =?us-ascii?Q?kj6iM+PsEDYBKj+OXrqm8BSDHTB6sbMSOH4xFED3akxkOyqUr+K3HPbcB+Qy?=
 =?us-ascii?Q?IAM+ajY9qis4jwltcsQbgKrl5ENSNHkF+EdoN+rk38NU1CyRIAbzcIUcWGYU?=
 =?us-ascii?Q?a4P57n1Mf5wsnCt7FFd7635lad/QYeTd/qqkLV6FgHMWICH7MFIi4IG8m/7L?=
 =?us-ascii?Q?A0ILjEPMPzGJGwu8EYCVGOipSLbzPOQ9o+/AxsWeiaMmYdFU0kkH3aFfDImy?=
 =?us-ascii?Q?VE9VqRyofyT8/eOAlNx5aadovs/Qw2HLOfDyDK/P4tqYJoVFYqR7e+NsjtEN?=
 =?us-ascii?Q?zctOPNyDx+0o+zwrcpuhhzZKd9n/ZqWzbhafT4phe+ZcavP/yPupHMKNkD3K?=
 =?us-ascii?Q?FODx/8TSpD9T5jkXEhlJBgaIHRfyQBw+0lcxwJ8sSItVDOwWK+jc7FYjgSXx?=
 =?us-ascii?Q?Te5OEvxyNHnpXwqMC6AO4g+3q22O3NokOyEuWhtWjUN3xDq1Od4ha3pWBTZF?=
 =?us-ascii?Q?YN4q4FEyZpEbgVXx34wxVffUHSrCcImRpVwKI0J1e+c8bPbMqsSrzMSkjWWM?=
 =?us-ascii?Q?c1wQ5TuIVXOIV0a/AySa/rsrDpn52a2zbuXZweICAPfIbH+bwNvYAuN4PSNh?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/tvnFX2mZwmap84g7u/RLfF8fBXOyGlGmlirqjO5KcIlvtNLfMCQnkwIdQtUI0cfYfCYsjKrTQ0z/DCVaMtleAvpj63IcNvCIQHecAFi1oBFLfo4jKMtIKapVAlpehTlUCOdvpYLhFCv4eAqRfK7gMPNAhQDkln0AQO+iKPGThad1lUvQozwTjwvUlj/RMIRd17C8u9XzQjtqSmy/K2KwoutrziW/VLgZnkEG1OZUNMtfD67Z0kwFndCcNSJ6PMdQauji9jMvjN+UjvJy0j/DXnRtDfcxyys/aekIRYHw2dAb9e2/K2cHsNSCf2NbfszvTDztmGXPp2IBfsk61ns1MnhCvm2zbmRdZ/S7W7H2nuwfOyTLKnBxhAN1ls49Wf4GZbbeX1W5fVQaGY4leI+p/89WFBcZXBcf8EOUBnMN5xsD/lJUZ5KlVSPDgHp6v+HeoyrV7kfVs2Z/h1FKFBumD0cj8KnnWbTBSgsHJY0PWVapYfaQ8nvLVJkNN0yc5idMssAEGuuq8IEirglxRpXu83RAWoQW7FaDtoDqBL1hfMMC9Ngg8HRMEjZkmWIz4bpml9HkYQQpzadWhWZyvumYOQqXJJ2ft/LphCqFnly4EI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88eebbde-7b01-4267-9bdc-08dd152c928e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 12:58:55.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sDUrtAh2c5YsDk6AEyOw+/Fp5cASJRIxh5IfIruE0Wm8YTL0I4CHA0NxQo1MSq9mIZnkHF1prbyVW4XUxzdjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6026
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_10,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=576
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050094
X-Proofpoint-GUID: v6sWsy_UNf_l-D7eRE1YhLewAqpx7eVL
X-Proofpoint-ORIG-GUID: v6sWsy_UNf_l-D7eRE1YhLewAqpx7eVL

On 3 Dec 2024, Nick Alcock uttered the following:

> On 3 Dec 2024, Nick Alcock outgrape:
>> This has survived a thousand iterations of test/unittest/proc/tst.self-grab.sh
>> and test/unittest/usdt/tst.multitrace.sh with no failures (after the other
>> patches in this series are applied).
>
> Also survived internals/libproc tests (just making sure I didn't break
> grabbing in a more fundamental way):
>
> 1300 cases (1100 PASS, 0 FAIL, 0 XPASS, 200 XFAIL, 0 SKIP)
>
> (and survived a more conventional full test run as well).

Survived test runs on the usual 8x OCI systems too.

Did nonstop runs on them overnight of libproc internals tests,
proc/tst.self-grab.sh, and usdt/tst.multitrace.sh. No failures :)
Even proc/tst.signals.sh seems to be consistently passing now,
and that's another unstable-marked nasty test I hadn't got round to
looking at in ever so long...

-- 
NULL && (void)
