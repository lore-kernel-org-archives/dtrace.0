Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E741D7986
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729205644; cv=fail; b=gxRxRvCBIfUGgzN5FZDmNXgfuveJ1Si/zJc+OiqGi1crwNYtLxq1pmBx6YzWklJvohARgIaDPz39QIxQcTdsH5pWpuA5CPj7wY0arriPtgZWeRffj80lnLxWQ+lKLcP52U/wdrFr2INiDEnE6Eu2jcptbsrGOx5uJGyNKRAHDko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729205644; c=relaxed/simple;
	bh=2Sz3pppPY5Gb510PlY9AitOww4Y9Dq3Tm38MPNzXtAs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jMi3jPlbsvtP1Xmg4QdS0i4z5UWjgtYKZWgAlj/wdoBx5CqnDrNBGjn4T2RtFXAUdiXOUt9nHuv4dpYWKW2l2/GVhG2qB3ok7j8Yd1EJDwrETsCXVv2CeULd9vrwuHPIcz+3avH2TY5tyzUfTj6LfFdSEu4XURwiTD9qw/4W5ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CgTnlwta; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lADOCthn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CgTnlwta";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lADOCthn"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HKtkZB010309
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 22:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=yLwJ4iw//4G807t4kYnAdSsEwDG8fbz9pdPlvRu2gnQ=; b=
	CgTnlwtaZDoa9T9bIKOghgSC1zdAGRDM6rxGgc2DqnmdQdKZTxXhRDKbjyf1IEdP
	Tpm5KIlcNKosXGo31+qwY7Tiu3x3KzeAs28l7ThA01x3KXcTk7iKQN7wpm3ESEkp
	SazItYAbM7JMGDAbbE1Ytrf2JEvglhf1jkkKWVmlDWnZz7mBv7qqyWY/2avzh2pD
	o5R5tvGfxbw571c6MnG1ndsE47eKcvz8cG9tr812LZ6U1QBkJfvjNL2QDstLhtg4
	A1dNhqMY+l75ixavcYmQ3Qhz3ouOzNFYi1FB2mxjxE1naXEOmsNKxrz5V7q+26X/
	gMnjULIaLF8q7dvIGPb2rw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h09q023-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 22:54:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49HMjmrJ036023
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 22:54:00 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjhd3n5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 22:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mk1oCfLZfLu3FP2/WrboUKOEgUl1OH6xK1I0ZqMBrzp23tHbgdNX3YLsx8xaxo9YN97kiEfWUedFMihEHsY+8DGALoy3beVg7xzLGmIr9imVV2VUKfD6N54QWqa2kTTWkE98Y8up3vgNBQo2S3NugcOhNFD8XSpLGJakVENTJCFrJMejEOEuywArtmzOlGWojSAw+AwjdKY7CJ9usS1t90rqSAENp5ic9WTE1Zac5lNB5Ntfr2v++0QfQuzQv/shN0K9+/aiBZkIRYKpf2Dq4a3BVhay2PSHOl8nWZVoaLkLgE/dGoWu41zMNpsmvdaJLrPVtecRD1d9GC/sUQW77w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLwJ4iw//4G807t4kYnAdSsEwDG8fbz9pdPlvRu2gnQ=;
 b=GiTf6aYrAwXkfb3PJL1VuYQwFxkIFRJf8a+N0BLoo9M2KRHPU/XzSXSTnncRCadal2Ry62efikKs7+ZywMnV2HYw8d48pZEVKaMsLokcQcrRdz0L8DLfhWELuqhpsDwVhSiwYN/4lzUBdjG/FaTvQdOkOvGsX+lfj69ACowmCItIPh5dV2NR6mQ80R15E1eXbLxQbWzp1EYsSTw4BVLWjXPFp75rEgSbcnyjONV5ZPe2eavgiQNAuQpIFz+EbLtA96HmY8clHrbpKdcD2m3S85vQk4BNraXLlTXV94Y9J8FV919tysvW2hZ6pkLKRA1SL+lV/ihghmdRyCvq83ocbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLwJ4iw//4G807t4kYnAdSsEwDG8fbz9pdPlvRu2gnQ=;
 b=lADOCthnYgCQ+rHNYJwJpEEsU2DdGzkSaLMchRkgySDmdogJHi/JtVcVU2rAN7CgGNMzYWEpGraeODRazIFTfKj5cFTQmATr0YcoKHdtHsCezCCXf8EXbwAKT5nnVgGxN2McREII2hxD0rovxUuGTkH+v80KyayPxd+OnQiFrrU=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SA6PR10MB8158.namprd10.prod.outlook.com (2603:10b6:806:442::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 22:53:56 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 22:53:56 +0000
Message-ID: <1dea775a-84af-e3bb-58cf-bfdaa198098a@oracle.com>
Date: Thu, 17 Oct 2024 18:53:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 19/22] test: Fix tst.probestar.d trigger
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-19-eugene.loh@oracle.com> <ZuXSOvSAa3iDJY9i@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZuXSOvSAa3iDJY9i@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::30) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SA6PR10MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: be00a884-306e-4fcd-2e28-08dceefe9455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEVPL3gyRlZ6TUNIanovN2U3SGF2MXY0dFhQUXpYM1dWT1FOTVVIQVVMU2Fv?=
 =?utf-8?B?YVhtaHo0L2J0SThFcGoydnk1eC9mejd0eVdmL1FJTDVhRmw0OUNkcnBOaG85?=
 =?utf-8?B?NmdGL2lqbktSNTNyQmJxMUt6UzBIcUY2TEJiMENLVnBYK0taTmxweGlmZTBp?=
 =?utf-8?B?c0IrNXBQNGVtUnhoUWYvL1RuNksySmY1bUtHUFdzOUlvWlJOTmpOenByQW9G?=
 =?utf-8?B?OHh3RzdmbE8xRTdqZERXbFRoWmIrUWVORHNvdXNlZk00VXpMYTBGYTh3YS81?=
 =?utf-8?B?QVhRVWNyZWwrZjZQM3E1cWtLckcrQXhFV21ybk1LenIxSDl4TjRFU1BzZGU3?=
 =?utf-8?B?R0pmZDVtS1J4aVdJMjBYM0I5VElENkYxMjV2emhUNVBtU1NGR29wSEpuM21t?=
 =?utf-8?B?Q0xHVTBET1VVNVZXU2xUM2VkUkhUQ3lJTEVhd3cyTXVKcW42VUVhR3UrSDEx?=
 =?utf-8?B?akdtVXIwNUpoaTRTM2FPUkd0QXRRakYyWTlCd0ZJTzljQ0thRDB3T3FKRitQ?=
 =?utf-8?B?N213MG1pbWNJSm42VnpOd3RzWVZqZytwNXFJOHFGZGFSdGgrWGlzbnBWcld5?=
 =?utf-8?B?cGE1QVowcTF4aTl2TG85aHdmNjJybTFFeDVCamdoeS9Gamg0SlRmQ2JMY214?=
 =?utf-8?B?ZGZ6c29nc1M4djFFdjhsbFpJNUFiUWVmNnNPeldoZm1BZTF5Q0tVZG1LVlVM?=
 =?utf-8?B?S2NEQzRnZHJ4dTF3TG85ZDg1QWh2Q1RtZTJaVTdhcTZJbkVuQW9GNDIvQ0FI?=
 =?utf-8?B?YzEvMFUxWFI0NkNhOTR5Q3VLUGtFN2lzMUc3MjErQW5VdUJCSmdTRjloWDdG?=
 =?utf-8?B?V0pRYkM3Y0d0NXFpdnRGZ0grdFAwakVIUGxVTTRJbUJmQkIreTZGY2dGYjNw?=
 =?utf-8?B?SDMwdUYzTU5aWWE0bnR1c1A0bDBITHpkVEthem9HZ2p0VzVKTXV0alFxSGlL?=
 =?utf-8?B?Rm02bTRtalFBcFBzM1JjY1QvUnVtdVNxUkNVRG41U1lENDFxeTg2Z1Y1OGR1?=
 =?utf-8?B?M0hFS1d3V3M5UEN1d1UrSWF2Wmk3cFBwWkFUSnNpMXVKczRMSzkrc0xKeC9Z?=
 =?utf-8?B?dlBYVXVBZ3lJUzMraFo1K2lPajJnNGFBckRDQlAwSEo1T2RjcG42T0dsMTBv?=
 =?utf-8?B?azVzVHR2TTJkazJvcFBRdjZ3QytQa2l5R1hrSjQ1eFZwcDRzM0ZvTjlMV1hR?=
 =?utf-8?B?SEl4NlgwYmRBUVN6ZXFjTldCcWJKZ0lnaTkvOGdkRUVrNEtueDZOVElhMi95?=
 =?utf-8?B?MWZSTFVJcnR0eEZxMjFWRFpZSzV1a2VsbEprSlVnd3RzTzlSa1YvRUpMeEJI?=
 =?utf-8?B?K0VNRHhWdzZtNGYrRTRLZWZ4MEpldlEyY2hFTU93MFRxVmRvTmdpOWR1VlNV?=
 =?utf-8?B?L2NqSmlqT3VSU090UXBCUUxXcUFHQ0YxQkdoZ283Y3VRYzlQNjhjQi9xMERS?=
 =?utf-8?B?aTd5MFNPVGN6RngxUjRtM0I2b0J2L2pNZWY0ZUZCd0sxQ1J2dE1JV0xTTU5o?=
 =?utf-8?B?cEJMbXJHd2hRN0YyNEpRSEhoQVRWbXZTNTFZaWxLalphVUZpUFg3TmhxbWZ5?=
 =?utf-8?B?SXJjNWhZUHZFV250Mmx3ekZva1FteEowdFY4M1phRjZDQ2x0Y3FQcUVFTGJy?=
 =?utf-8?B?Mm5NOHNJallUMUZJRjlQcUx5MmRSNFh2cUhLam1laCtJVExRUkx0NmNoUFNQ?=
 =?utf-8?B?MGV0QUR2UEVXd0FKQng0NVpvSnZ4bkVEa3pVTnpETGRaKzgxd1VINXN5blZq?=
 =?utf-8?Q?SXjFsbgK/C4MwDMJBX9PicFnUnKMvijWCC4J8An?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1BVMUh2N1kzdXhqZHhzMmNvSjFIdlExVnFVTUFYeGMxbVlObktNSktmYmdi?=
 =?utf-8?B?cFJDOWE5N2l1bUgzU3BBMlBVcGZTTWN2MXFEaERIUTBGTllkeXM5dlVSUjJl?=
 =?utf-8?B?dU9SdWs5WDVjMS85QTRtTEhIVGwyQ1JDbm5wRGpjT0JlNXV5U0xOQVgycldH?=
 =?utf-8?B?S1VjQ2Y2a01JZ0YxQkRhYzFQWDlhOUgycURMRmwwZm5PSWhaRjliQ1hMaFNv?=
 =?utf-8?B?aW9BbCtHczhMUVlLcGZSaEZTZStjMmw3b3FwMUphbHdCZEhRQlQ2bXlOLysz?=
 =?utf-8?B?ajdQQzZpS1pqNzNnNjgxRzFNWlJNaWxkRExzYmVuOGk3dG5aczVjQUZIR1dQ?=
 =?utf-8?B?NVpUQUg5eTJBbGRzU0U0TGZyTkt4RHA5THpEUlZXMzNlYVphSnBlY3Qxa21M?=
 =?utf-8?B?QmQ3Tk9rYmthRTRWcTh5OHFwZDdJRHlGeC8rbnBDcGl3WGU5aUp5YUpKaXNm?=
 =?utf-8?B?RW0zcXlEeC84UHlNaVUzQ2pXdStZL2FORHgxcjRkK0dOZFpJT004bEdTeFph?=
 =?utf-8?B?d20rV2VzOGFXQzJKamxDRmI1elVPSEFZOTgwNGJ6dG5qRnhYSEVaWUJ4YlhR?=
 =?utf-8?B?WHRkdTIzTWJQQlVPVHZkZnFQVmJQbVU2K2YwemhhQ25DMnJWZDRpR1M5ak8x?=
 =?utf-8?B?YmhVSU93TlVwQjBuMklrbFRCblBiUnUySEMydUZwNWdubXJZb05LVmJXcU9w?=
 =?utf-8?B?OHVtSGhqeG9Pc0lrVVJmYWtOVUtwbXc3WVhydHVwNDVDSld6YS9PWGQ0ZG8v?=
 =?utf-8?B?OFoxM3NiZnpjQzhsVVVPbGRrM2x3c0ZuS1N1SWlvajB2VWgyMFA5MTdDOEFx?=
 =?utf-8?B?TjF6VU5sc0w5Q2hzblNIZW92Q2thQzFtSTR0dkZucW1XSERtcTdlU1MxRUdV?=
 =?utf-8?B?Z0RkdWh0U0VSUjkzTVRUeldxeTlxRytvRmxlMUF5Q29pSXRDdlBoWE5Cc0Jw?=
 =?utf-8?B?eUR5RjRlT2pPdFFHUGJyM0kwZmhBU21kL0tIQXMxV2cyRzRzcDdUY1NTWHRT?=
 =?utf-8?B?Q1RGQjN6RUhaTW52NWM0bHZqWVpFT3hTWHlxejhhdUZ3aGpXSDJlb2Z1M1ZW?=
 =?utf-8?B?M3NxYysxeTRhRERuQmVFQ2Q3WnlycHM3dURVVUpKUTkza0VZUTRXMXlhQksy?=
 =?utf-8?B?Mm5RdlRGaklxd3paYnNoWFo0djZROHQxNnU3UVl4czkwT0lqVnd2LzZiUVhx?=
 =?utf-8?B?Q0Qzc1AzRVFDUkw3Uy9UWjA1YWZQdTlJMGl2RWsrVjVMS01FVGtmbk9MQTdy?=
 =?utf-8?B?ZWtBUGg0NUpldDA4b1FEbGloSExCMkt3QS9vQU5yVDZhWHYzWEpmM3FGa1Rw?=
 =?utf-8?B?MEljLzNzTXYwbm9QT1p1OTBvckFBa2lvVlU5SnVvZ05FV0VSb0hYWG94MGFy?=
 =?utf-8?B?NEdtWWRFTUYrQUNnSVo3aE9nTmZBOUVub3V2czVjOHBXU1dOcHljelllYlRk?=
 =?utf-8?B?Wll5YWVoYTYySTRBbVpSVHBUZVBsYlZwM2NoUzZFeEIwMnJXQ2lQLzBaV1pm?=
 =?utf-8?B?VW83Tm9NOUhFR0QwZDdxU1VId1VEUE54RVBYeVBhdm53Q2l0ZlJVK3VJTzMv?=
 =?utf-8?B?REtkVnEyNVF2aHdSRGhBTjF5cGNaU3p4TWpHMGZCbHUvUmpkL1Bxb0c4OEhx?=
 =?utf-8?B?YWlRT3dHWWpTVUd4VlRNUmhqM2R2WVBMejJFVFZmMU5XRHYvbkhCVnJNbEFh?=
 =?utf-8?B?M0lIa3hPUGxERXJJaXFsYlJQTFpsdWFiSFBjWS9XMlphRnIwcU1uQWhJSk1i?=
 =?utf-8?B?VldqSWJLcWxvTkpraDNQeXFGWlRneVdOQ2tleVhXV3hUcmo0TGNLVkI3WHVU?=
 =?utf-8?B?Q2NiZVFDalc0L0JVTWdvYm1wVzBvZTUwV2VmNG1JZkR6U3Y5VmNQUExGbzNy?=
 =?utf-8?B?TXZ5R05rZEZBOE9FSUZrZXRPemxCZG9CY1RNMnJVSU5GTjUzY2VqTDdHc1pC?=
 =?utf-8?B?ck01NDZqa2M1WlBudm1wRUtxam1JQ242TWdNQTkwMFZuZkxSRkFBUkV0UXFU?=
 =?utf-8?B?UEJBMjNNT2ZsaXAxR0hsclBJeGNMQlpvYnVGcllmMmVYTUF6V1hTV09XeEJG?=
 =?utf-8?B?cVVFVFpFRWxpcllJVDVBU1VIV2ZsMStQdHNldkhUNlZGclpKY3d0RU1kemo4?=
 =?utf-8?Q?rmArfnxwWFiP/5tjkwJIRV++h?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ye5OZOXyfw+f9cTf9oU0dCDKHTt+uD/bGxaVkSjiTn1ukkHEUM6Aa2uynhysJtI2MMO/oB4ZaeprfwOZQM8dcQyBXPd96+WbMYl1K8QBW7PGiMTjQmQs3YcR4FoEjlgB5lI0Bj5EQY6/ZfVIeYtdzy2lxBa166YgInd3/+2dwL7i80xNasSv2IT8t1Jn3cHQuEBp89/gt98YvfW+3vZb4SAh+i9mekhVb4XgKZBXqaOQmmP3U5vyEv7CQmCaSBsq4KRu3ODEZYGqlG8AgzwJ+GR/Ub6TB/ofihxM+2FH86I8mcpP9TdYs2tladH6lM8oLCk6H75U/3lh+bc3fMOiACWqE0gbYlfTrVY1Aq+a4PKG+S18nmhhfVtE1YthSwWrnsPFj1gBGlM/VVlEST2BLv7ASkfA4dXbrDXAuOYeV1xsgmYtqzLCHr0TPEgTPj7vN3RC4Quv9GGhjIjW/cL7SwzVmWvguLkdl5ZnIEL38ac3Am/JzQ6hZ1+hgnuoYy5iHv+Nu3Gppbm3yEwYzsqN6aUgkUpV7zieqyjtPVcK3ziXx9f+tczr18gSEDLAtf+a28BjLMqOPzGL9EjFt6zGZrUNyJ+3pORKg1fh+j1EEMQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be00a884-306e-4fcd-2e28-08dceefe9455
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 22:53:55.9466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +24Wh2+jxWnSwL8qu3L4LI2U3B8tB0ViFSQSbO35z1zSUoxDAV92+pmClA9WyLK4GZ3G9P2kxT7/88+oWGs3dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_25,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410170155
X-Proofpoint-GUID: swxtsWrTOJgb0Mv1JBKWkJaQyc-T92z0
X-Proofpoint-ORIG-GUID: swxtsWrTOJgb0Mv1JBKWkJaQyc-T92z0

Yeah, weird.  I have no idea what the FIXME meant.  The fixed test works 
now.  I'll post a v2 without the FIXME comment.

On 9/14/24 14:13, Kris Van Hees wrote:
> Given that the patch also adds a FIXME, I think that it would be better to
> resolve whatever that FIXME is meant to refer to before we merge this.
>
> :On Thu, Aug 29, 2024 at 01:22:16AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> This test was relying on a trigger that uses the obsolete
>> dt_test, even though dt_test is irrelevant to the test.
>>
>> Use a different trigger.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   test/unittest/probes/tst.probestar.d | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/test/unittest/probes/tst.probestar.d b/test/unittest/probes/tst.probestar.d
>> index dad7741e..b6da42e1 100644
>> --- a/test/unittest/probes/tst.probestar.d
>> +++ b/test/unittest/probes/tst.probestar.d
>> @@ -1,11 +1,11 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2011, 2020, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> -/* @@xfail: dtv2 */
>> -/* @@trigger: testprobe */
>> +/* @@trigger: readwholedir */
>> +/* FIXME */
>>   
>>   /*
>>    * ASSERTION:
>> @@ -16,7 +16,6 @@
>>    *
>>    */
>>   
>> -
>>   #pragma D option quiet
>>   
>>   int i;
>> -- 
>> 2.43.5
>>
