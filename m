Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337581E1A34
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731703381; cv=fail; b=RYuj+NTbIpx1BLkVSwwqKq4mDs9zCFbQT4YvztAG+d1tcmwloRzTd+goKScBdEuKWtplPemzPK56ktGy1403ahCAUhce05v82bDuLAan70vYsxBbEZcqcXv1Naupqdn+gaTjlK9aHA+kWxmPvMWU7rHUYhomlfEWMyC7vtynCZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731703381; c=relaxed/simple;
	bh=MkoJXpcxYqbAMrLJXTBFpLr2KjKi5CpLhruCb6yNps8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y5D97ieo32iTG2ZoVxIVEHtLOcAQ+8WsGsoSBsNUfKFNFPT9y1uXtA4vswfisnxL60XxJQ+HksnlbAeMY5HMuy5SNRu3cpds7EtzaaYfDr/2FFmmvhcUIGOwBPnYTfksLrGMMznLIYz7NtL3QGYCTos/t5NPRpWU3Tk5VBtD3yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QlfxAiBX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vDKU0+hn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QlfxAiBX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vDKU0+hn"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKNNOa013836
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=xKclSgJ7kdxmPjzYlH
	PIreoIkZDsEU+SGox0IQRQ+lo=; b=QlfxAiBXxehjrgRcrrcLzqZKqAwqUcVY/J
	+1iBREJtIt45Hf/kBE+bTeiUeJwMKhnVgKrGkXbW+uy8XfF3mGLCqvLpgcrgV+Cg
	6/P91ckS1eWg0mFMqCKpz1hILcpRJt0mk/sa4+9RfnG0qmiYS9hMiXHV9uoVa9Ev
	bNaTZbizE/lQpU3VyXoTsUL8o8tX0b+P1UOAiyWO9VQOlaWsS42/efkh8/OAUWt8
	zSU0cNHS6dJWEtThWNDNRU/Nuc5Fn5dTD0uCpIsKPfr8t5nafB9mv2630VuhzbYe
	4ljad1f7s2YzHVXm2kCYzhipe/bUk3LM0SIrIQqrLmFIhTS6JlBw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42vsp4nx8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:42:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFJFlSX036149
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:42:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6cnswt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:42:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8VpxzY3kvTNyI/Zw/Pqk3u/qwkT8/nZXrjkIPrMDnIIoMti8J57cjjSYraIlhN3L1BFOP7StDjmmdJZFx3654piJtjxdm+7Vn0FhEJKvniGgHP+9RG4jG7XcYMCqKjKaknZeiIQIMxHLuSqRthbOok2GUpSo9Snijk2nqE1UNe9hZvs4KfHnjOSLhukhs9Rc3Q46CDbbJrGI3pcFWC4GLHb9XYOpclU93NmLz99H+dyfAPx/nvW5ZD7VdA8vMeJTjhiBfwdK+5FrTD1WioXo8T8/LOq1tfptggZ5LnpebjGHtupMP06OtdGOwPbLpqQUOxeqauTRcEslF1LgiMOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKclSgJ7kdxmPjzYlHPIreoIkZDsEU+SGox0IQRQ+lo=;
 b=Wqkj4JveE13b8VTK+ndkXlVFoFCeBgZqI9ObWlgMpv0i1n8+03TaDEtOoRyV+BZwcE4ZD9gYygCOz2/AGrOT9mVptWr1K84+jziGziosWrjsRNriPWm7T1jT46oHi9PgMHdTblu5swUpBtE+E5G2gGU8PU3zipjkpAaHQS/0tCl3j+Xcj1AZHjELBysZfZ+V5ImipMiTVOpPDNXo+L17IMOUJr0hLsmaFrOxa94G6ZakSm1Kzq7T3p09dJThOtdsf09fIfkrcXJMtyyazgWsbvIFOaqBRztY5Z4stpLyIeWgNxbq4sNH+eTsxbUaDRNZBdMG6H+i/p6AdWmJNBwo0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKclSgJ7kdxmPjzYlHPIreoIkZDsEU+SGox0IQRQ+lo=;
 b=vDKU0+hnXCx2CXm/APw2JJmupNcGng15VCXXi2Iij/5OR8as892u8Z8yXLuQVulYFZ5l8vKyp1gj3yMtOvZcul/y5EEuQM9z9ITPJKGpE4eJt79IXZxMxK5NUU1XsVzigXXsbPEbBmvc4xaP0zQnEqafsegpLtub5hFcfze6nGg=
Received: from SA1PR10MB6341.namprd10.prod.outlook.com (2603:10b6:806:254::12)
 by CYYPR10MB7628.namprd10.prod.outlook.com (2603:10b6:930:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 20:42:54 +0000
Received: from SA1PR10MB6341.namprd10.prod.outlook.com
 ([fe80::71a2:62f7:3f47:b1d6]) by SA1PR10MB6341.namprd10.prod.outlook.com
 ([fe80::71a2:62f7:3f47:b1d6%7]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 20:42:54 +0000
Date: Fri, 15 Nov 2024 15:42:49 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3] Allow arbitrary tracefs mount points
Message-ID: <ZzeySbY7k8Wt5iU7@kvh-deb-bpf.us.oracle.com>
References: <20241112134256.118717-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112134256.118717-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BN9PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:408:f6::11) To SA1PR10MB6341.namprd10.prod.outlook.com
 (2603:10b6:806:254::12)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6341:EE_|CYYPR10MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 517e52c9-181a-4f5a-82c2-08dd05b61447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?96cpJBFvGmPSAGFUefmafyhOSb61vBVQCMUlPJS/tcLZg15NudAc+5Rg3Kle?=
 =?us-ascii?Q?KWYMaoxKW09nGs2n91glE4V+N2O+9+Rnyd+pGn9JgK659B63rY7sYLj64Svz?=
 =?us-ascii?Q?FicUu5VzxMn+FImICjWgK3G+0U5lZLqt8rjjEuDsWfZ2FMnwgsX9LqUWiSOT?=
 =?us-ascii?Q?+OmFutAkEiDWeaGnsFw/RcP8ipwFjenT0huFhozav3DX1B+UUR7JoPpUN4l6?=
 =?us-ascii?Q?AEhqsI+OHibF1dv/q9eBJeyG0rUChSr8GuQ+loWZm8F/BK+DGeoLFyiUU1/K?=
 =?us-ascii?Q?USSD76QCqhMhcbVVah8ey9hbsIppQiynqNgffbTC43SAJVzKrivUa0tddFPr?=
 =?us-ascii?Q?QakuwvMJR1t/tJQ5izGDE544h69aSWxG6TZTjEhbBzSEuRF8FZ2sgw1srmZ7?=
 =?us-ascii?Q?A2mgu7337Y+/1FSvwgPPt4tjjTwbezfeT0j9945GDsOGLXdwrpFa9y/U9COK?=
 =?us-ascii?Q?Oc4MhMmSIDNnNxnjMrVGbNZvrr6O/cL2tnKYj9dXFHHswDemTM18epk8ZzKX?=
 =?us-ascii?Q?kTf5Rwll++sRVt/qTqt+IomHlA2h/Ak3ZS0QJDZcmgcKisdYQmPNrz1S2y8a?=
 =?us-ascii?Q?1Lli9OyKZTqFZ/1Mhh5Fu2fVJ8TC04Yob9TLD7hlONfzDAbZhAxBgHE9QPXY?=
 =?us-ascii?Q?JB4fi+DrYpmDY8q4Q4al1D/lN4fbJb+/EtxfMKu3wIF8DBoLC9hG4K6Qg4Ll?=
 =?us-ascii?Q?A3g0To/Js/zFudS+p0HhKn9mPIdm+cjSZCpCreVKj3p7E42cuhJlhrBkw+40?=
 =?us-ascii?Q?kx8XBeJVu9bo5DWB7nKP7ChT4e7l8JRhxVKl0RIYtptPj6n4kSCzOWnIGfIC?=
 =?us-ascii?Q?NWY3H0Gm1LNSX01cHOfafZ6EHuQN6IVEO/UTa7Pefdp/TU8nKAC/YKHG3+9O?=
 =?us-ascii?Q?/OkTZVllXSwZKSqjHDuudtXj4VqRwqFA+6TPlfDxZ1SmFU0wIGMZZphLAPDv?=
 =?us-ascii?Q?PKsZaknQVcjVDuTCTkyCAftId5LSBxP4FueXxyGOUeaqnX8DWidOGwtzsjbW?=
 =?us-ascii?Q?AWLPoXTboS+i8nkXiqPmG0b5WAuKN4hDkDSiYLjjdn/NEmZinAKjKthuyNj6?=
 =?us-ascii?Q?zSH0KWNEnZNpz1UJ2swuO6QkE4vl+UXiCJ/IsHnKTbOwOIjat+x8gPXHDQIo?=
 =?us-ascii?Q?6Iyj+rqRRIWi9LRjXTQEWP06gRRCeBcMeIhx+uhT+r0plbzK1DP6Oe0lIfiC?=
 =?us-ascii?Q?MKwjGk/fRXSDUqCoBp/YrugSORppOHlzvqE0zjYo1PDtpch375BbKki6FcEv?=
 =?us-ascii?Q?Sd4wodkvMIw/7Xr/SJmQ//++ImdzFS3ZDY59LVxw5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6341.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qv+7jQUr1ptaWGl3ReMpIitnwxXDLABa1KPj/0L5F4X3oj9beLcBoyLn65dW?=
 =?us-ascii?Q?PF6o6vlL6L2JiG78EiLjL3RWs5xZEpGy3QF92Qoa5/sIIP9IaSV1ho9N1n6Q?=
 =?us-ascii?Q?NhrEUYE3LE9u+OkVGOqm+vQJwaonUVDJwiy2rTkSyhRQ3MsA/ZICDLOBi/5g?=
 =?us-ascii?Q?PYlCy0q/ng44wqVvQpTpCgFNO7luDsFY40dcHdUwyMskuQYrw7KUOowkQMit?=
 =?us-ascii?Q?PLyL4IakIHF6Dbs/xHjyWUbb/Uy6fItwJGTibUFXm64iZz7ETYq6g0C2p5eo?=
 =?us-ascii?Q?jwR505XuVlN9mdCFXpqhE+/Fv2SaSZ3Aa7XrkYNMyfiyGY1ZgNEFvTYADa3W?=
 =?us-ascii?Q?/UtXlsk+pw83zyLcaewB+0c8sFWhBamR5I6WEc0/T8rghkWjG5s/CxZn1R8G?=
 =?us-ascii?Q?2/F2fxWQ/47apJQZKAnJFLkSzT++usquoXYWINLJQ5dj0M9OsamZPw+pIW1s?=
 =?us-ascii?Q?+AETw0YWJ6FN6wiXAFx92NtpmM4XtkMZatKzCtIRyl1ewNxJf/N1prE73QXA?=
 =?us-ascii?Q?8/62CskWZ4yqkY5xNOcuwa7utzEFpizBZLcOsPa5GhZLQ55OkpKRCfBtguG6?=
 =?us-ascii?Q?s8FUIkacnbtaABJfWPXqCQLc0Pect310xOZptn+YvsEN2yLk/NW89hNcPjcw?=
 =?us-ascii?Q?bVXrdwBInp8BbzuM18OD/KXse1GSVgiczLF1e/UwBqcKZ3ceOn/1q67gwFch?=
 =?us-ascii?Q?1uwS4kb6kt48ennZlNVBswJ1iXgICJY33qOej75UV4uu1vYS2bu0G5QgtBLi?=
 =?us-ascii?Q?D81QWVFvYd5ZlAX+K2nqtx8kPFbBD47ycwRJ5mQNqzN3U0SiepmwHrfbbRsS?=
 =?us-ascii?Q?Hp9SXaN95+hwvuo8P5sKQEW5awIzGJON9r82GVJrWwZL25zzal/ioALIKDz1?=
 =?us-ascii?Q?MrnCfKtGirPwvY02AfzEV+GpqnNakfpxiG5EyjOue1ripTINcA9u9YySD1C5?=
 =?us-ascii?Q?S2qQCRPozmfSX4BDjYB6+r5rQNUuVZ9IJQ25r4rVbfu7GybgPwMD6KJDAveM?=
 =?us-ascii?Q?M27uGZMuQjGdYHxuwd5awDVf1LEpCCqgDgRONX2ItI0w+BrdWr9X7011/oPz?=
 =?us-ascii?Q?e3xXuEQlcGb32hoyPSolO/8jt8eInGlZjFDhn8epmrNZaVnQQHIMgTDS0Hv9?=
 =?us-ascii?Q?Hnson9dIqVd+aDYhDm9wU2aLiScMgTWWYZthVHPhOqQYiCQHfA+mVV8dgT+j?=
 =?us-ascii?Q?+v+pibJExojK8OMIe64AzqXGpecRaZuyW1qmPsGR7bcpEwmI0iwI7kWwUjU7?=
 =?us-ascii?Q?lJcdOQXltHoGop+nrEBA0D3c7SHq3iagTV0BQwZcaq7K4O1Yy0TNy2kWcrIU?=
 =?us-ascii?Q?FBBtDU3DzqvUFxT1U3J8w3/pUa/pRfnq3RDYVHcXAHGECX+nBdx7reJpXU9I?=
 =?us-ascii?Q?k5kkYA3LqNULfF0VkiIv3KGIYQW7LV9cOJ9wBlXI9Nx+S6jX0es5RqHp8WpG?=
 =?us-ascii?Q?Gs/T/MUT+8IXSmqyRKa7CRO5H+DfaGRB3O4v7zcYIxl4QFBA6AdQ1vRuip02?=
 =?us-ascii?Q?wvIiggJ90bCx6De60Dkq3BWfQfVoV2k49QjI7raw0XkBe+QgC5iEwSRKXDkV?=
 =?us-ascii?Q?xrHPvnYviDE2SbvhWAgRq3OSqWYr34yxOZuy6yy8lzlu0lUl0HAOSmyCcQT1?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	epJ4hQxr28pJ6g4i74fi7JfDOLEf1N2OIFHyZFXYPs3Louk3KuSGEXVjbFx3JYZCakMIx970H5C/M80iF9OjZnBV2SUQ4M3T4Kb4Xi/aseH7/pjGfRpWEj82LdUMhMq0FE+mw10vSAplfZo/UPSrm2NSlmDe4dQeQvgr4LgYuKqrhHBRcjxsOX2s5E/qc7TEinpZ2SoSBi2Pd1X6q83ggujB1oVgg6x3xE2NG9hJDJjBn9W3d3ChA3TXtHSldk4Lm5BE5ZpJ976I8h+sObvQORq8PAP3acw32ifY6azYt9IdYXlXLYHAH/LhbTLQpXXdmPjqIzZcsGDaIYrnl5MRFMpkDdcJLFkPKOlNouTbLS7uPPCyvUrwsJ1pO0sPBSgxjBYGRZ4NfMg1RrotBbAuJCteXOe1+oB5y+v97nkEI5XP0ftC1t9d1YnK6mjdL5hxRXNklo5edJF+9ANL1ohbiVs9FwHqITGUin8gIDqmtklVA2te6nuhJ/CCQ+J4hxP+49gc9uZsVx7rN9W4iB/0jQaUl0UkARQbU79P79Tdf+EFRQtbYFG0UwkDK5rHPUVxvvar46dTn64TMNIKcleWSlQszBBFK36XYXOK3UfW6tE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517e52c9-181a-4f5a-82c2-08dd05b61447
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6341.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:42:54.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0juvPzHBWK8rhFT1RRLf0OH9qvp9GN3tkMbi29ASX1lVQrrZ3mG3fyGN7dqicUaVGK3YM73mB/Gx5gAkfLTAVQsBQpv7sddlcF9kSDnRHBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7628
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-15_07,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411150173
X-Proofpoint-ORIG-GUID: UAPKCU-wOfqg9Gg8FyLyNUJFhBTGDLle
X-Proofpoint-GUID: UAPKCU-wOfqg9Gg8FyLyNUJFhBTGDLle

On Tue, Nov 12, 2024 at 01:42:56PM +0000, Nick Alcock wrote:
> So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
> canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
> this requires an explicit mount, and a great many installations have not
> done this and perhaps never will.  So if the debugfs is mounted on
> /sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
> as it used to, as another tracefs mount.  And of course there's nothing
> special about the "canonical location": it's up to the admin, who might
> choose to remount the thing anywhere at all.
> 
> To make this even more fun, it's quite possible to end up with the tracefs
> on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
> (I got that during testing with no effort at all).
> 
> All this means that the existing DTrace hardwiring for tracefs/eventsfs
> locations isn't good enough.  Instead, hunt for a suitable tracefs mount with
> getmntent(), and add a function to open files under that directory, allowing
> the path to be created using a printf-style format string (mimicking the
> things we used to do with EVENTSFS defines and the like).  This is actually
> all we need; there is no need to ever return these paths at all, so there
> is no clogging up the code with free()s -- and actually there's a
> noticeable simplification in most cases.
> 
> Tested with both in-practice-observed locations of debugfs, and the
> obviously crazy and bad-in-a-format-string path of "/%s/%s/%n" to make sure
> that is properly rejected.

I think it is useful to put the testing (and results) in the commit msg for
this, especially since you do not have a testcase for this (and I can
understand why - though if we were to use chroot or something a test could
be constructed, right).  And the case of tracefs *not* being in standard
location is worth pointing out to clearly show that this does work in the
most generic case.

Or if output of testing is too much to include (I assume it shouldn't be),
at least make sure you test standard and non-standard locations, and then
confidently report here that it works for all locations that do not have
% in the path name.

> Bug: https://github.com/oracle/dtrace-utils/issues/111
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  include/tracefs.h                             | 14 ----
>  libdtrace/dt_error.c                          |  3 +-
>  libdtrace/dt_impl.h                           |  3 +
>  libdtrace/dt_open.c                           |  1 +
>  libdtrace/dt_prov_dtrace.c                    | 27 +++----
>  libdtrace/dt_prov_fbt.c                       | 37 ++++-----
>  libdtrace/dt_prov_rawtp.c                     |  9 ++-
>  libdtrace/dt_prov_sdt.c                       | 30 ++++---
>  libdtrace/dt_prov_syscall.c                   | 27 ++++---
>  libdtrace/dt_prov_uprobe.c                    | 41 +++++-----
>  libdtrace/dt_provider.h                       |  1 -
>  libdtrace/dt_subr.c                           | 80 +++++++++++++++++++
>  runtest.sh                                    |  8 ++
>  test/unittest/funcs/tst.rw_.x                 |  7 +-
>  test/unittest/providers/tst.dtrace_cleanup.sh |  9 ++-
>  test/utils/clean_probes.sh                    | 12 ++-
>  16 files changed, 203 insertions(+), 106 deletions(-)
>  delete mode 100644 include/tracefs.h
> 
> diff --git a/include/tracefs.h b/include/tracefs.h
> deleted file mode 100644
> index d671f51adefc..000000000000
> --- a/include/tracefs.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/*
> - * Oracle Linux DTrace; simple uprobe helper functions
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#ifndef	_TRACEFS_H
> -#define	_TRACEFS_H
> -
> -#define TRACEFS		"/sys/kernel/debug/tracing/"
> -#define EVENTSFS	TRACEFS "events/"
> -
> -#endif /* _TRACEFS_H */
> diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> index 213f0d9e1385..9c4a2b32888e 100644
> --- a/libdtrace/dt_error.c
> +++ b/libdtrace/dt_error.c
> @@ -98,7 +98,8 @@ static const struct {
>  	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
>  	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
>  	{ EDT_PCAP, "Missing or corrupt pcap() record" },
> -	{ EDT_PRINT, "Missing or corrupt print() record" }
> +	{ EDT_PRINT, "Missing or corrupt print() record" },
> +	{ EDT_TRACEFS, "Cannot find tracefs" }
>  };
>  
>  static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 68fb8ec53c06..950cb34819aa 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -354,6 +354,7 @@ struct dtrace_hdl {
>  	char *dt_module_path;	/* pathname of kernel module root */
>  	dt_version_t dt_kernver;/* kernel version, used in the libpath */
>  	char *dt_dofstash_path;	/* Path to the DOF stash.  */
> +	char *dt_tracefs_path;	/* Path to tracefs.  */
>  	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
>  	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
>  	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
> @@ -643,6 +644,7 @@ enum {
>  	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
>  	EDT_PCAP,		/* missing or corrupt pcap() record */
>  	EDT_PRINT,		/* missing or corrupt print() record */
> +	EDT_TRACEFS,		/* cannot find tracefs */
>  };
>  
>  /*
> @@ -713,6 +715,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
>  
>  extern int dt_gmatch(const char *, const char *);
>  extern char *dt_basename(char *);
> +extern int dt_tracefs_open(dtrace_hdl_t *, const char *fn, int flags, ...);
>  
>  extern ulong_t dt_popc(ulong_t);
>  extern ulong_t dt_popcb(const ulong_t *, ulong_t);
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index e1972aa821e7..775830f64492 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1317,6 +1317,7 @@ dtrace_close(dtrace_hdl_t *dtp)
>  	free(dtp->dt_cpp_argv);
>  	free(dtp->dt_cpp_path);
>  	free(dtp->dt_ld_path);
> +	free(dtp->dt_tracefs_path);
>  	free(dtp->dt_sysslice);
>  	free(dtp->dt_dofstash_path);
>  
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 34b5d8e2467f..670954beb4c9 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -23,8 +23,6 @@ static const char		funname[] = "";
>  
>  #define PROBE_FUNC_SUFFIX	"_probe"
>  
> -#define UPROBE_EVENTS		TRACEFS "uprobe_events"

Since you keep KPROBE_EVENTS etc in other providers, why not here?

> -
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -229,11 +227,9 @@ out:
>  static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  {
>  	if (!dt_tp_probe_has_info(prp)) {
> -		char	*spec;
> -		char	*fn;
> -		FILE	*f;
> -		size_t	len;
> -		int	fd, rc = -1;
> +		char		*spec;
> +		FILE		*f;
> +		int		fd = -1, rc = -1;
>  
>  		/* get a uprobe specification for this probe */
>  		spec = uprobe_spec(getpid(), prp->desc->prb);
> @@ -241,7 +237,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* add a uprobe */
> -		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> +
>  		if (fd != -1) {
>  			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
>  				     GROUP_DATA, prp->desc->prb, spec);
> @@ -252,16 +249,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* open format file */
> -		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> -		fn = dt_alloc(dtp, len);
> -		if (fn == NULL)
> +		fd = dt_tracefs_open(dtp, "events/" GROUP_FMT "/%s/format",
> +				     O_RDONLY, GROUP_DATA, prp->desc->prb);
> +		if (fd < 0)
>  			return -ENOENT;
>  
> -		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> -		f = fopen(fn, "r");
> -		dt_free(dtp, fn);
> +		f = fdopen(fd, "r");
>  		if (f == NULL)
>  			return -ENOENT;
>  
> @@ -296,7 +289,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  
>  	dt_tp_probe_detach(dtp, prp);
>  
> -	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
>  	if (fd == -1)
>  		return;
>  
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 21f63ddffc73..b5c1f5d22a06 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -43,8 +43,8 @@
>  static const char		prvname[] = "fbt";
>  static const char		modname[] = "vmlinux";
>  
> -#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> -#define PROBE_LIST		TRACEFS "available_filter_functions"
> +#define KPROBE_EVENTS		"kprobe_events"
> +#define PROBE_LIST		"available_filter_functions"
>  
>  #define FBT_GROUP_FMT		GROUP_FMT "_%s"
>  #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> @@ -65,6 +65,7 @@ static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t		*prv;
>  	dt_provimpl_t		*impl;
> +	int			fd;
>  	FILE			*f;
>  	char			*buf = NULL;
>  	char			*p;
> @@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	f = fdopen(fd, "r");
>  	if (f == NULL)
>  		return 0;
>  
> @@ -363,16 +368,14 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  {
>  	if (!dt_tp_probe_has_info(prp)) {
> -		char	*fn;
> -		FILE	*f;
> -		size_t	len;
> -		int	fd, rc = -1;
> +		FILE		*f;
> +		int		fd, rc = -1;
>  
>  		/*
>  		 * Register the kprobe with the tracing subsystem.  This will
>  		 * create a tracepoint event.
>  		 */
> -		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
>  		if (fd == -1)
>  			return -ENOENT;
>  
> @@ -383,19 +386,13 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		if (rc == -1)
>  			return -ENOENT;
>  
> -		/* create format file name */
> -		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
> -		fn = dt_alloc(dtp, len);
> -		if (fn == NULL)
> +		/* open format file */
> +		fd = dt_tracefs_open(dtp, "events/" FBT_GROUP_FMT "/%s/format",
> +				     O_RDONLY, FBT_GROUP_DATA, prp->desc->fun);
> +		if (fd < 0)
>  			return -ENOENT;
>  
> -		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> -			 FBT_GROUP_DATA, prp->desc->fun);
> -
> -		/* open format file */
> -		f = fopen(fn, "r");
> -		dt_free(dtp, fn);
> +		f = fdopen(fd, "r");
>  		if (f == NULL)
>  			return -ENOENT;
>  
> @@ -431,7 +428,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  
>  	dt_tp_probe_detach(dtp, prp);
>  
> -	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
>  	if (fd == -1)
>  		return;
>  
> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> index 778a6f9cde90..6940edce6a6d 100644
> --- a/libdtrace/dt_prov_rawtp.c
> +++ b/libdtrace/dt_prov_rawtp.c
> @@ -38,7 +38,7 @@
>  static const char		prvname[] = "rawtp";
>  static const char		modname[] = "vmlinux";
>  
> -#define PROBE_LIST		TRACEFS "available_events"
> +#define PROBE_LIST		"available_events"
>  
>  #define KPROBES			"kprobes"
>  #define SYSCALLS		"syscalls"
> @@ -64,6 +64,7 @@ static const dtrace_pattr_t	pattr = {
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t	*prv;
> +	int		fd;
>  	FILE		*f;
>  	char		*buf = NULL;
>  	char		*p;
> @@ -73,7 +74,11 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	f = fdopen(fd, "r");
>  	if (f == NULL)
>  		return 0;
>  
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index 675e0458ca4c..7ebe010efa79 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -36,7 +36,7 @@
>  static const char		prvname[] = "sdt";
>  static const char		modname[] = "vmlinux";
>  
> -#define PROBE_LIST		TRACEFS "available_events"
> +#define PROBE_LIST		"available_events"
>  
>  #define KPROBES			"kprobes"
>  #define SYSCALLS		"syscalls"
> @@ -62,6 +62,7 @@ static const dtrace_pattr_t	pattr = {
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t	*prv;
> +	int		fd;
>  	FILE		*f;
>  	char		*buf = NULL;
>  	char		*p;
> @@ -71,7 +72,11 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	f = fdopen(fd, "r");
>  	if (f == NULL)
>  		return 0;
>  
> @@ -192,16 +197,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  			      int *argcp, dt_argdesc_t **argvp)
>  {
> +	int				fd;
>  	FILE				*f;
> -	char				*fn;
>  	int				rc;
>  	const dtrace_probedesc_t	*pdp = prp->desc;
>  
> -	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
> -		return dt_set_errno(dtp, EDT_NOMEM);
> +	fd = dt_tracefs_open(dtp, "events/%s/%s/format", O_RDONLY, pdp->mod, pdp->prb);
> +	if (fd < 0)
> +		return -ENOENT;
>  
> -	f = fopen(fn, "r");
> -	free(fn);
> +	f = fdopen(fd, "r");
>  	if (!f)
>  		return -ENOENT;
>  
> @@ -223,15 +228,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  	int			argc = 0;
>  	dt_argdesc_t		*argv = NULL;
>  	dtrace_typeinfo_t	sym;
> +	int			fd;
>  	FILE			*f;
>  	uint32_t		id;
>  
>  	/* Retrieve the event id. */
> -	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
> -		return dt_set_errno(dtp, EDT_NOMEM);
>  
> -	f = fopen(str, "r");
> -	free(str);
> +	fd = dt_tracefs_open(dtp, "events/%s/%s/id", O_RDONLY,
> +			     prp->desc->mod, prp->desc->prb);
> +	if (fd < 0)
> +		return dt_set_errno(dtp, EDT_ENABLING_ERR);
> +
> +	f = fdopen(fd, "r");
>  	if (!f)
>  		return dt_set_errno(dtp, EDT_ENABLING_ERR);
>  
> diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> index 20843c6f538e..63ce3bc43ae1 100644
> --- a/libdtrace/dt_prov_syscall.c
> +++ b/libdtrace/dt_prov_syscall.c
> @@ -38,7 +38,7 @@
>  static const char		prvname[] = "syscall";
>  static const char		modname[] = "vmlinux";
>  
> -#define SYSCALLSFS		EVENTSFS "syscalls/"
> +#define SYSCALLSFS		"events/syscalls/"
>  
>  /*
>   * We need to skip over an extra field: __syscall_nr.
> @@ -61,7 +61,7 @@ struct syscall_data {
>  
>  #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
>  
> -#define PROBE_LIST	TRACEFS "available_events"
> +#define PROBE_LIST	"available_events"
>  
>  #define PROV_PREFIX	"syscalls:"
>  #define ENTRY_PREFIX	"sys_enter_"
> @@ -71,6 +71,7 @@ struct syscall_data {
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t	*prv;
> +	int		fd;
>  	FILE		*f;
>  	char		*buf = NULL;
>  	size_t		n;
> @@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	f = fdopen(fd, "r");
>  	if (f == NULL)
>  		return 0;
>  
> @@ -195,23 +200,21 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		      int *argcp, dt_argdesc_t **argvp)
>  {
> +	int		fd;
>  	FILE		*f;
> -	char		fn[256];
>  	int		rc;
>  
>  	/*
>  	 * We know that the probe name is either "entry" or "return", so we can
>  	 * just check the first character.
>  	 */
> -	strcpy(fn, SYSCALLSFS);
> -	if (prp->desc->prb[0] == 'e')
> -		strcat(fn, "sys_enter_");
> -	else
> -		strcat(fn, "sys_exit_");
> -	strcat(fn, prp->desc->fun);
> -	strcat(fn, "/format");
> +	fd = dt_tracefs_open(dtp, SYSCALLSFS "/sys_%s_%s/format", O_RDONLY,
> +			     (prp->desc->prb[0] == 'e') ? "enter" : "exit",
> +			     prp->desc->fun);
> +	if (fd < 0)
> +		return -ENOENT;
>  
> -	f = fopen(fn, "r");
> +	f = fdopen(fd, "r");
>  	if (!f)
>  		return -ENOENT;
>  
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 205014617586..6a02243ff572 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1116,13 +1116,13 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>   * uprobe may be a uretprobe.  Return the probe's name as
>   * a new dynamically-allocated string, or NULL on error.
>   */
> -static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> -			   uint64_t addr, int flags)
> +static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
> +			   const char *mapping_fn, uint64_t addr, int flags)
>  {
> -	int	fd = -1;
> -	int	rc = -1;
> -	char	*name;
> -	char	*spec;
> +	int		fd = -1;
> +	int		rc = -1;
> +	char		*name;
> +	char		*spec;
>  
>  	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
>  		return NULL;
> @@ -1132,8 +1132,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
>  		goto out;
>  
>  	/* Add the uprobe. */
> -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> -	if (fd == -1)
> +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
> +	if (fd < 0)
>  		goto out;
>  
>  	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
> @@ -1153,8 +1153,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  {
>  	dt_uprobe_t	*upp = uprp->prv_data;
>  	tp_probe_t	*tpp = upp->tp;
> +	int		fd;
>  	FILE		*f;
> -	char		*fn;
>  	char		*prb = NULL;
>  	int		rc = -1;
>  
> @@ -1163,7 +1163,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  
>  	assert(upp->fn != NULL);
>  
> -	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
> +	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
>  			    upp->flags);
>  
>  	/*
> @@ -1177,12 +1177,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  				  upp->flags);
>  
>  	/* open format file */
> -	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
> +	fd = dt_tracefs_open(dtp, "events/%s/format", O_RDONLY, prb);
>  	free(prb);
> -	if (rc < 0)
> +	if (fd < 0)
>  		return -ENOENT;
> -	f = fopen(fn, "r");
> -	free(fn);
> +
> +	f = fdopen(fd, "r");
>  	if (f == NULL)
>  		return -ENOENT;
>  
> @@ -1251,21 +1251,20 @@ done:
>   * Destroy a uprobe for a given device and address.
>   */
>  static int
> -uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
> +uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
>  {
> -	int	fd = -1;
> -	int	rc = -1;
> -	char	*name;
> +	int		fd = -1;
> +	int		rc = -1;
> +	char		*name;
>  
>  	name = uprobe_name(dev, ino, addr, flags);
>  	if (!name)
>  		goto out;
>  
> -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> +	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
>  	if (fd == -1)
>  		goto out;
>  
> -
>  	rc = dprintf(fd, "-:%s\n", name);
>  
>  out:
> @@ -1297,7 +1296,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>  
>  	dt_tp_detach(dtp, tpp);
>  
> -	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
> +	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
>  }
>  
>  /*
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 8f143dceaed7..4598a380b950 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -12,7 +12,6 @@
>  #include <dt_impl.h>
>  #include <dt_ident.h>
>  #include <dt_list.h>
> -#include <tracefs.h>
>  
>  #ifdef	__cplusplus
>  extern "C" {
> diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
> index d5dca164861e..f129e5591465 100644
> --- a/libdtrace/dt_subr.c
> +++ b/libdtrace/dt_subr.c
> @@ -20,6 +20,7 @@
>  #include <assert.h>
>  #include <limits.h>
>  #include <sys/ioctl.h>
> +#include <mntent.h>
>  #include <port.h>
>  
>  #include <dt_impl.h>
> @@ -998,3 +999,82 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
>  
>  	return hval;
>  }
> +
> +/*
> + * Find the tracefs and store it away in dtp.
> + */
> +static int
> +find_tracefs_path(dtrace_hdl_t *dtp)
> +{
> +	FILE *mounts;
> +	struct mntent *mnt;
> +
> +	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
> +		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
> +		return dt_set_errno(dtp, EDT_TRACEFS);
> +	}
> +
> +	while ((mnt = getmntent(mounts)) != NULL) {
> +		/*
> +		 * Only accept tracefs paths that do not contain percent
> +		 * characters in their mounted paths, since we use this
> +		 * to augment a format string in dt_tracefs_vfn().
> +		 */
> +		if ((strcmp(mnt->mnt_type, "tracefs") == 0) &&
> +		    (strchr(mnt->mnt_dir, '%') == NULL)) {
> +			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
> +			break;
> +		}
> +	}
> +	endmntent(mounts);
> +
> +	if (!dtp->dt_tracefs_path) {
> +		dt_dprintf("Cannot find a suitable tracefs path.\n");
> +		return dt_set_errno(dtp, EDT_TRACEFS);
> +	}
> +
> +	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
> +
> +	return 0;
> +}
> +
> +static char *
> +dt_tracefs_vfn(dtrace_hdl_t *dtp, const char *fn, va_list ap)
> +{
> +	char *full_fn;
> +	char *str;
> +
> +	if (!dtp->dt_tracefs_path)
> +		if (find_tracefs_path(dtp) < 0)
> +			return NULL;		/* errno is set for us. */
> +
> +	if (asprintf(&full_fn, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
> +		dt_set_errno(dtp, EDT_NOMEM);
> +		return NULL;
> +	}
> +
> +	if (vasprintf(&str, full_fn, ap) < 0) {
> +		str = NULL;
> +		dt_set_errno(dtp, EDT_NOMEM);
> +	}
> +	free(full_fn);
> +	return str;
> +}
> +
> +int
> +dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, int flags, ...)
> +{
> +	va_list ap;
> +	char *str;
> +	int fd;
> +
> +	va_start(ap, flags);
> +	if ((str = dt_tracefs_vfn(dtp, fn, ap)) == NULL) {
> +		va_end(ap);
> +		return -1; 			/* errno is set for us. */
> +	}
> +
> +	fd = open(str, flags, 0666);
> +	free(str);
> +	return fd;				/* errno is set for us. */
> +}
> diff --git a/runtest.sh b/runtest.sh
> index 46b532d7e161..fbf4e60c82a9 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -607,6 +607,14 @@ elif ! /usr/bin/cpp -x c -fno-show-column - /dev/null < /dev/null 2>&1 | \
>      export DTRACE_OPT_CPPARGS="-fno-show-column"
>  fi
>  
> +# Find the tracefs.
> +tracefs="$(awk '$3 == "tracefs" { print $2; exit; }' /proc/mounts)"
> +if [[ -z $tracefs ]]; then
> +    echo "Cannot find any tracefs mounts in /proc/mounts.  Some tests will fail." >&2
> +fi
> +
> +export tracefs
> +
>  # More than one dtrace tree -> run tests for all dtraces, and verify identical
>  # intermediate code is produced by each dtrace.
>  
> diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
> index 29c581116154..5737c7575a26 100755
> --- a/test/unittest/funcs/tst.rw_.x
> +++ b/test/unittest/funcs/tst.rw_.x
> @@ -1,6 +1,11 @@
>  #!/bin/sh
>  
> -FUNCS=/sys/kernel/debug/tracing/available_filter_functions
> +FUNCS=${tracefs}/available_filter_functions
> +
> +if [[ ! -e $FUNCS ]]; then
> +	echo no tracefs found
> +	exit 1
> +fi
>  
>  if ! grep -qw  _raw_read_lock $FUNCS; then
>          echo no _raw_read_lock FBT probe due to kernel config
> diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
> index 4ac59ccb4315..f3e434ae76fc 100755
> --- a/test/unittest/providers/tst.dtrace_cleanup.sh
> +++ b/test/unittest/providers/tst.dtrace_cleanup.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -14,7 +14,12 @@
>  ##
>  
>  dtrace=$1
> -UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
> +UPROBE_EVENTS=${tracefs}/uprobe_events
> +
> +if [[ ! -e $UPROBE_EVENTS ]]; then
> +	echo "no tracefs/uprobe_events" >&2
> +	exit 67
> +fi
>  
>  out=/tmp/output.$$
>  $dtrace $dt_flags -n BEGIN,END &>> $out &
> diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> index 8292b3096424..cfd100088eb7 100755
> --- a/test/utils/clean_probes.sh
> +++ b/test/utils/clean_probes.sh
> @@ -1,9 +1,13 @@
>  #!/usr/bin/bash
>  
> -TRACEFS=/sys/kernel/debug/tracing
> -EVENTS=${TRACEFS}/available_events
> -KPROBES=${TRACEFS}/kprobe_events
> -UPROBES=${TRACEFS}/uprobe_events
> +EVENTS=${tracefs}/available_events
> +KPROBES=${tracefs}/kprobe_events
> +UPROBES=${tracefs}/uprobe_events
> +
> +# We can't work without the tracefs: just give up quietly.
> +if [[ ! -e $EVENTS ]]; then
> +    exit 0
> +fi
>  
>  # Check permissions
>  if [[ ! -r ${EVENTS} ]]; then
> -- 
> 2.46.0.278.g36e3a12567
> 
