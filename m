Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C972B211C
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576678; cv=fail; b=XVKFmIDZq6GnYUPy3PswUlpDs/HW/IEEKakKfexCfAnnI119m3z8UCaEK2SkXtA0vvgVFcvRlO7bjdfAxHmQVpPRyf82Bch7lSAjYod5XZ6bQSQ5CqnnafYCQuf5+WKzE6/L7GrKXcd0rSOKX7bCYqIfpqKTufy4ymI0hsTxxzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576678; c=relaxed/simple;
	bh=FmZ4daEytZIu2/1EWu2VXsvEfZoqv3YDSXtFxmHvGfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V4FWthLrgBeu/JBe8W05FNP4MaWnXKc5HC8l9A7vX6IIKkrZVqL7UamZuQOR5QD0lOxeGoeJZHkqHiVa4siZLnspyWQl5qBP3bc/0fLEY/qC0Oqg6WiMOwh/OvVeSCx0SyzoAhJJ7328vMeeOKLqMzrQm7+N2ZyfdAn8MwZ1CsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=elQ5dvkx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IEgOaceU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="elQ5dvkx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IEgOaceU"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fXFJ031517
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=IBaonR6oWjV40RT
	cccYJmU0YxdL86hKTdLPOD5f384E=; b=elQ5dvkx8aEhQYjkWUUH22O03cfacJZ
	cp9NiId2psHDS/N9NUlxHG31/qPUpCNZDw8ufF5nfuYnOqOmAQ+6trsr13f4EeVZ
	yw26UieaAZXKCyGGlgzlriblyy3kaLJICSb8rPqV0JkkM9UdZpE4kIEvI+xhQiUz
	iVBKtQJOcnIO4SXdhPClXfetPQOBapkkSzon0tm5htTax+G+r1JVkOBC+d2XGAya
	/2+us6crcs7T/t1l0bqq8qjL3KHmWVYnGCVHg+0sT3Apul+gWT52R+4YZ4H/1PZP
	xGCWLKVsyUVRJS0c5fPakM7K7+bnx3SQxmIiDZqlmVmGux2EuC+/sUg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje1gdwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:31:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47251bZj003851
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:31:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c3scxh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:31:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuI/L54xqVNyQLpaEDgJiLpUn09AS1CLpA+SWA29DJY7WqWKGLNe98Y0n6P7tMwD7auTYnOE8YAv3kGviieUUCAzEdOnpD5XOXQpxBOY09v4Yav66Pz/af0kJHyDORUymt/eIzu5inq2pSeN/TuUlmi3JjuMF5YOk5OkffUVqrC7KWS2ychtiXHMLM18Hi71Ekyw3Nq3edblimoFQpssFM07vmqRiPvDOmTQookJy6KR+AG8bDi6Y8dFyjgU1//w4CEM/1xUqBCuYOzPdJ8hcZxd9FetsQ66ocv1aBqIuMlxBnMK3Z7X1Km6KW5sginQYamZj9BBW3CAx/Dltjv42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBaonR6oWjV40RTcccYJmU0YxdL86hKTdLPOD5f384E=;
 b=rHAY8YM3y+8ZHVNrUGC3dXubYMUl8VcLwXEFXAYluJXv+yvrMUlolU6sdCL+hbSLAVGg7253kthPuRrUHp5ZJ8TvLElqN1j98ekiQlUZGj0FpbxPay8oJShVJLrLE8pQWELFR1geGylKIOlCfrGqfSGJ7Imm5xSYbNkD+wjFjdH9Bm/ot9gAZeh5BPS8S+gVNbQ76vq3tYFpLEgRstnxFWEH7ytWutOyvrCBUZNVP53+FqsiTNoXElwxRnjwuXOhhAGOSWcu/zox8xK4L+eJXB5EmcTZsvYjFqJSru5NmPI2P9GUnBsDOCmUhGMZM51zTbe7MG2ftJlGsBUqbAsBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBaonR6oWjV40RTcccYJmU0YxdL86hKTdLPOD5f384E=;
 b=IEgOaceUdr0G2ULfUBciZjw8hWEWU76YajHHtpQaT8lwrgZKR81pxopqIznvLfLcNuePYnzfnG27hBW7ZpncwMY25+PGLbfbolzvOM0lJWb43AMIDeA2xdu5gJD2klOqarMHMLTOsuTw5RQKL0Pbvw9XzPDBUHkGR49dnZjO2A4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA1PR10MB7856.namprd10.prod.outlook.com (2603:10b6:806:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 05:31:12 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:31:12 +0000
Date: Fri, 2 Aug 2024 01:31:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 7/9] runtest: remove obsolete kernel coverage data
 collection
Message-ID: <ZqxvHazir0akoL8l@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-8-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-8-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA1PR10MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0db81b-aaf7-46fc-db3f-08dcb2b45251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?948yeGpLGntQc1819/XJX5T1RXxMm+ctFZslJ5VFqFQSuBmdn/Wib1ICCmHP?=
 =?us-ascii?Q?iLNQQpPD9/lTp15Q0zjyUvpkg2ZTfwneBpXaw5t+jMaXX/SmRVykX10+YQKa?=
 =?us-ascii?Q?obW8U8ebLrZn4ckxm9Md6D2Iz4vr4rdHjNAzueIaylNfM2a2IcwYVcIFqTs/?=
 =?us-ascii?Q?6mrBgr6Fm/EXB9JwpcUs75zq/A9SBEtqRvv3UJrGTxVQINtqxEVPqdQpfCuH?=
 =?us-ascii?Q?T8rMGVHPbL7/PuNQIcgf0gRCZskqaxDguEOfyxaP0maokHZ0Wcknr3c6jufZ?=
 =?us-ascii?Q?qZSZMk0U4CctC10/Ov5iTXiEzVS263fLnbIaUhTiIY1sDWjq6F3lB1D6g8Fk?=
 =?us-ascii?Q?kGEVlaCmdnKDU7Gfqd3nUuwCub7WZDVMPfvf414we8MhHeDCipSoqp8dMxFh?=
 =?us-ascii?Q?tDn7fptIn50CGKfMqHuXgMs5manlfYQu+frSeXIcYR+acqomw6jdqGhnQeAf?=
 =?us-ascii?Q?LVhlzwhlpkTEyrP/7Rb/FZMLe/PlGv2x8zSQ7uCVtsbdP3UIlClDP4Coficj?=
 =?us-ascii?Q?kjSUlemTBvInZJnJHHm10V6SdRc/4YQrlBuHigZlOUWdn+f4Mg1/di8WAbca?=
 =?us-ascii?Q?XBl4czgSN6wjt7T+lGg0vAXpINGpwwBzm+EqRioI6wQPr4ED483SlDzncD7N?=
 =?us-ascii?Q?xcBsuZCgkysAPUOi9N8kBIFc+wR+kcflyP53k6lrUIS0OPyGzGjlA29XcVH9?=
 =?us-ascii?Q?Lr1fPg+Kv3YL82H0H67YaPOUNiR8NI30pxpB1XFmfVYHU+gmn9k79eLotIg4?=
 =?us-ascii?Q?RebNSoEjSpUvBIBPosiRjlzC9JKBbMD3fmIHBOIRooe9MF7oRzmyneDF59LZ?=
 =?us-ascii?Q?QO2xVKO2/2rastG8nSqnb28Z36XLj3rCopW/cFl2xT0LgELPpAXYCtiD7HCw?=
 =?us-ascii?Q?16/Gwh5033yNev55o0Bdb9AfUMI7nq7gN0y5NlggPfGFur96UUnO8iyrDk0F?=
 =?us-ascii?Q?P3KMjdsXZypex0CfD+VZsSZihp+C/otXCOg8R+bHsK+XFv1qvX4ORYcBUB5F?=
 =?us-ascii?Q?gl6ZSvHwEov63PhDFXdDX96o45WCCpZjHo//ONw9ftAyJKcdEetgLh/Be3sO?=
 =?us-ascii?Q?6ofgpbiMT9Lb680L+6MOM8mtnbxM53sTJnKRG0IQX3hnuey7KpaKm2Y63ypH?=
 =?us-ascii?Q?yaUHq6L/hhd4X0Nn5W2U+xRH2HPE8jNKv4QfV4c+gZpV6oIemvt35fmYSzXn?=
 =?us-ascii?Q?Qm7+EAO/zI0muvyVdLuNp0JuvOCkaLKeU0BvWdlzD2P1ZsWOuDYt54wfvQ1I?=
 =?us-ascii?Q?Uw/eQqI8TjMUzMsJa1R9t8z+cHyeAzdQ0UKAlUKQashQztUffERYCa8NjSAY?=
 =?us-ascii?Q?yQpLSi54BDXTj4bHDHSqtjZliOmSJ2Ezd9q5zng08K/eew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A5Lm8oqwxjIQoMXW5Wf54+5EpCw+TK9ORnx0osgFcQetEo0TnBX5CpZLmkIU?=
 =?us-ascii?Q?hs/lwIZjKVSSHJnN52RXIzc+bzFoSBjORbta1ifGR3nolLoEcxCPwQNY0O9h?=
 =?us-ascii?Q?0sTmy2LvAqZZN3KuNdaWP0o6wvYHqgtUm8benHConzxdfoBSjt8IEdRQdnWC?=
 =?us-ascii?Q?z+tH5DsIlalZN2gHnla4RvNHFbY1syku7XzLKbhec79WIN/h/Uhv4D++LUaB?=
 =?us-ascii?Q?lrxlzWSpW4TybSt4OpVqS/4rxm4hwicatu8ELuiAEGUz0YX5U5JK2QYO+CEF?=
 =?us-ascii?Q?ghhyL2Bb7vMJbRcdVzFQXXD8x/1i2G7IbY1I6ddcBeLk4s7lmR/3fSQ2WOYL?=
 =?us-ascii?Q?keV4Yp/FNQ5sQ9p7PnW/b445o7I46fPwvUA0bmHDJKg7skYiV84uaD1QzpnU?=
 =?us-ascii?Q?JGBAc5bWLoMThe42o8YgxxDwPtj0iE/eKL8xU8VRH6HGrkfW4N7TZbgkpaUU?=
 =?us-ascii?Q?bADoSaQzhQRzdWLO6WHpzIuLAnFepAyT49BrUiCMizkcMgpEenmu9vMW3dEm?=
 =?us-ascii?Q?PlsxYRmgFHpYJEadBBrCp+zkynrQPzRUI3HujwDdSPpZzDKhbRHyA98oF7v2?=
 =?us-ascii?Q?NOJZ7jCqrpNuPtfIIUuIw5QGEjf4S55X780C2l+TBZ+2e1hUWMUi6ziLhkvM?=
 =?us-ascii?Q?5pqPY7QCZqdyzNttCfLi5vXPrG4WVPmgDVlJVyjncH5CCs3/Xrab6VCuZcEh?=
 =?us-ascii?Q?ednWOjFPcIz9TpzxtCFUpG7f3HKbuTlX1xE7C+yVWl5GDvZB97f2Bb13VY9q?=
 =?us-ascii?Q?4n8Gz7CIh7rx8+WqatHCwaQdyd4UMPrYECCS9Tr8qSi0WJz5xh0TIvvQ+q9s?=
 =?us-ascii?Q?ISNbNeThSp1Cc8qLq9kNdNhYmlPrfkVzDsYWE22PzpdQQN7HREyVbfTPZHJJ?=
 =?us-ascii?Q?I2xvjbyBa2pLZOxVvg+AsfRF07mnFJ3xwCHTTbHU7VfWO/df1E1dXHPeZb0S?=
 =?us-ascii?Q?v9g8aCd7X7Ug1lqgZVEG8FgCIJ3ho1WqpNSuL1HYZ/tdSrjxIG1YnpJYfUp7?=
 =?us-ascii?Q?jykrGZ2oWeePnb82ksklYKC4aEfxo8zzjWITEI5RYz1nmP7HGLFiUjiXdJNU?=
 =?us-ascii?Q?/Mnkh8nJHTNL+SxSkAstfg6uAgdD/CzuHfwYoB8OAPamsXBmlajHI6eEqSIs?=
 =?us-ascii?Q?HwsgRQSkeZBXJir2fTgljeKP6nL92e6IETJxoIJnUeCyP3t0qi5H7mlrWTkZ?=
 =?us-ascii?Q?kZqsO08r2ltGDn6y3hmZXS+Ey2owcbSuQ+5rgE6ZDVgOX0TwRqVY+u269Xma?=
 =?us-ascii?Q?OkHnQUhGGaaROIUH2S+hvUUdpe3NI/QaRHlB+xxsKogj9DmUXakR5+zsE93B?=
 =?us-ascii?Q?87UVet9V+2vlLYwZtpQ7BzWOkItmEqAghF294HSJBP2MPgUBHgA6SNfwqRbI?=
 =?us-ascii?Q?6ilpQzmatPKpCKPlEfWl/SKoF3y72hufgtjtAg0frGV+DEWG6cFRHyxjL/zc?=
 =?us-ascii?Q?nuElMsvrH1qaFtouymOaDIJduOC7/z7CFv3AU2PeLJgm0yx3Qt3bsOYJMYHv?=
 =?us-ascii?Q?PjOJ3C7CsPJ/qZexMpHuRarOU5yb9R2RbJdRuYi9uaD9pUpIYjzSQdo6GNsC?=
 =?us-ascii?Q?Bwepn5Sivy3UX9OiXuLuUpDAmErPreemF0zgD/PKvRgMyC9GWIgJ4EFRCnrt?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gyNZ94L7AluX/C42pTO9orGGP0by3N20sVAL5WJMnRtmYLWQJBZ7ZZu9dMHCGEF0OoL9K7yp70nz4/Atb6iMDQNOTEQDYcDiOc077SmWD9T5bybWIcMKyVDvEkT5Ts4DgwFV1fJ0Eimdo0wvKWgx6B8+bzb4r1YF70IIeyhv2KjKhNu5Dje2BWsKV2O8wEpWopFTnX3cBeRStFb3MBuVfMeD3wvBCYVhwDcM6uMCDo/EpzSDo4DQp93pOjlPqi3GMEe2HzJVH5M2jqYqDFjst9q3+wtAC2Oc3hmFJNghkHlF+40pj0Sa8VE5gKcCtfHgmsD0dkX9ZqXmILaCWQZiXUi9GJSe9nO9brey9YSklzl1WqSjD0pHlXiwkYKYuEYM7UaggzSI0xbb8+Qc0zolERbktv7TnlwQ3nlRRdeUhsr6izIxQDnBp8lYZwUngWfu+IW32QBOLxGXoq5Yrqgtb2B6evvIsrZe9ojc8ZQG36MCx2AwyPaRLLfG2N8kE8e6Q6TC7nMdC7DcMdWbBdJN1v/gQ0g2lYiHetbOXzHgGHnDW7E97koIaOzE625B5WlOYb04Egn4DGFxvnscGzVmMZMlZQPVJwXQ6oxspzpnbis=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0db81b-aaf7-46fc-db3f-08dcb2b45251
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:31:12.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXz6Tn1pZ3LHbRbi+U9I5BCD/UybX/2fTie3V9AZ1DmG0xvSVN2zquYdd6vmBqHQr6z0Y0lIsusSdO2EzNkBypUJqP5Z/BdRxBgxxCF6Cno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020036
X-Proofpoint-GUID: Yl65KWsLk3jLsMyJn1m6lku-Uc4uy6I3
X-Proofpoint-ORIG-GUID: Yl65KWsLk3jLsMyJn1m6lku-Uc4uy6I3

On Thu, Aug 01, 2024 at 02:21:54PM +0100, Nick Alcock wrote:
> The DTrace kernel module is long dead: we don't need kernel coverage any
> more.  Delete the example runtest.conf as well, and drop loading it, since
> it served no purpose but to point to the kernel tree used for coverage.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  runtest.conf.example | 10 ----------
>  runtest.sh           | 28 ----------------------------
>  2 files changed, 38 deletions(-)
>  delete mode 100644 runtest.conf.example
> 
> diff --git a/runtest.conf.example b/runtest.conf.example
> deleted file mode 100644
> index c92aa6b96cff..000000000000
> --- a/runtest.conf.example
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# Test configuration file.
> -#
> -# Copy this file to runtest.conf and edit it.
> -
> -# Kernel build directory.
> -#
> -# If this is not specified, kernel test coverage information will not
> -# be available.
> -
> -# KERNEL_BUILD_DIR=
> diff --git a/runtest.sh b/runtest.sh
> index 817f4a90487d..16a1a77bd394 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -21,8 +21,6 @@ export LC_COLLATE="C"
>  
>  arch="$(uname -m)"
>  
> -[[ -f ./runtest.conf ]] && . ./runtest.conf
> -
>  load_modules()
>  {
>      # If running as root, pull in appropriate modules
> @@ -644,15 +642,6 @@ if [[ -n $NOBADDOF ]]; then
>                   --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
>          fi
>      done
> -
> -    if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
> -       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
> -            rm -rf $KERNEL_BUILD_DIR/coverage
> -            mkdir -p $KERNEL_BUILD_DIR/coverage
> -            lcov --zerocounters --quiet
> -            lcov --capture --base-directory $KERNEL_BUILD_DIR --initial \
> -                 --quiet -o $KERNEL_BUILD_DIR/coverage/initial.lcov 2>/dev/null
> -    fi
>  fi
>  
>  load_modules
> @@ -1592,23 +1581,6 @@ for name in build*; do
>      fi
>  done
>  
> -if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
> -       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
> -    force_out "Coverage info for kernel:\n"
> -
> -    lcov --capture --base-directory $KERNEL_BUILD_DIR \
> -         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
> -    lcov --add-tracefile $KERNEL_BUILD_DIR/coverage/initial.lcov \
> -         --add-tracefile $KERNEL_BUILD_DIR/coverage/coverage.lcov \
> -         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
> -
> -    genhtml --frames --show-details -o $KERNEL_BUILD_DIR/coverage \
> -            --title "DTrace kernel coverage" --highlight --legend \
> -            $KERNEL_BUILD_DIR/coverage/coverage.lcov | \
> -        awk 'BEGIN { quiet=1; } { if (!quiet) { print ($0); } } /^Overall coverage rate:$/ { quiet=0; }' | \
> -        tee -a $LOGFILE $SUMFILE
> -fi
> -
>  if [[ -n $ERRORS ]]; then
>      exit 1
>  fi
> -- 
> 2.46.0.277.ge12b8151ed
