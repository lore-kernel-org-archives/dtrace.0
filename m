Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7E1BF37
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114964; cv=fail; b=f6rB3UoPayjNBMa6EUQ4TMfPsgTyQTsZXNGml4S/y8IRbusvKIRpmWs4xYLEA5MCpA9bwzwvAcqgxXWbi7uUl04mLDjY0Gl7h3HXdmkpKsoxeT5C+goRnLFnKfvy9SuTpaMtMo6MNZR7VgcAsUMKJ0ZNYOHyX5UoAwOgxOxTZUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114964; c=relaxed/simple;
	bh=dkvQr3cwx0TxpW0ILCNnBTA1A7v2qJwdgCO5DcW7LgA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iKWrjesJUOMgke2hb1MZPDC9sdK68qXhgK5BiZDalkkQa+IFiWtsCJVC0G8mInD+B8AI8yOTR/iWn14Dqu8tZMo5fkPka/XAGgkefDKrWfcKoYruwwJe89UlaBSPJwuztXsRelhCqghrwTrDmBNsrirfOmLQms9XvAqh7KrI+q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z6bTpxrX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GkXudSsn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z6bTpxrX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GkXudSsn"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541FtsAv001687
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/4jwK+XfGCURNsJblS25R0ic+KE68oQuC1O/hx/Yr8o=; b=
	Z6bTpxrXc92o4mfiHO2MeMW0FxjHZhE2rOpp+VzNW28fnnUguucsXAoAL6jrufHc
	Q+hm1xLN6wDvrwyH/2UZTCNlv/HdnqilaHSZZ6qi22JZ33O61pq7j3/kK87Txzxg
	v00yOqOfQkTGwOFCbPegMDrvRMXl96yjTsRe68Y2D8NmJuxIeP8dBotmxr9YNHE6
	DiLSL9yaYBu/KoPCemq0ckf0jscrV/6Yeshy3HnK7Z1YbRiEVBKTjkKP0OFX9Ngj
	rGRphC5T47mff6jL/LYhqBeTT9z6RLOcCFm6clVra0wE4QuTm+SI6xB4/4ZvNS33
	hbQuY/gW+vDp4sGib63JLg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ukubu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:56:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541Ea9oc035406
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:56:00 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013058.outbound.protection.outlook.com [40.93.20.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcf5p6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:56:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fd0FxKO69gFDfrxutyeQhcRJ8Gi/Y0tEt5Onxi7bFjL4tVUNS0JujGUEYVCSG3sU/gCZSpRF3uQa8bXomo1GpE/R37VFSkq6Hi1V5BXLuAfWSEBjwS9kEkuaE4EQ/dkpj1rkKLhg4Grz04oeE9BNFWXWDZyb1rTh8ZarNVLjNV7F4+ZgbMrh6HckWzrmJz1rkncRMzd4EkDKWqtftCZx8ijXZF2wRp0qZxibHUw8oS3jibHEVlaE0Jv9A7mGZ0kRkRL3i9CV1pYDM9CcAZ+gXrVQxIZLLuDnAVLnmmaEaLz+3HvABCer4AcYJ9ZELk1vNTFtqP3BwExBM3C/upTAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4jwK+XfGCURNsJblS25R0ic+KE68oQuC1O/hx/Yr8o=;
 b=VG4PX2s0FHHDrMnErWPX3U1AsbcK2tu7wfoB969uattfCLdmIdMPwKo2AlQ5cKleZXcWLuWvwAGhUUzBoOhwcZH/mMOp/tLrpGvApg5Qq6JTHbHqFcuc0qL2E8+M02pyNoIm3CC4+WD9lsirlivjOBu3iMCa0RoZwJSfH2wndsHwt8A348ng30KxSevRtkcC+q4umRsWz/Pmpf89O7tBvkUxRLeVmtGIeMRjAut0pfQIJwtEvSRbU576oMny0v9/SoaRUTzXBd5Vw+cAb5lHConc6KVEFYSHNCdAJQhnYtXEszcGuBgjHASGT6vVgzE0ReqnAuNNR+zjSTYCacdldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4jwK+XfGCURNsJblS25R0ic+KE68oQuC1O/hx/Yr8o=;
 b=GkXudSsnk2Z2mT/0VuW1SS2G2tIOyuGg6DqgjGpLR15FGaZDBufKynQkCT6NhkDlv2CVcxTdIKri5V4vStG5zihT4WV7pPtxBU2TDYrRfZyOg+MRinwBKC+eYxoemxYwnOHSzBkbV26ZfDCBaxvZnV21k1OjPxPHK/QbfGGwfhk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB6884.namprd10.prod.outlook.com (2603:10b6:610:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Thu, 1 May
 2025 15:55:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:55:31 +0000
Message-ID: <d9550b7d-6c88-ddab-1755-7ae99d45b6d3@oracle.com>
Date: Thu, 1 May 2025 11:55:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 3/4] Only include dt_git_version.h where
 needed
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ5PPF7F7BBD994C251CF1B3D24E2A6A2C9C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ5PPF7F7BBD994C251CF1B3D24E2A6A2C9C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: ed29038d-1caa-487d-d328-08dd88c899e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0tZR011TytRbmZyTElpa3BkR0ozaDZvSjg0NFNRL1NUUjJzUU96a1ZaSmU1?=
 =?utf-8?B?bWZLVk9SMVB0K25qcUpkYUtTZ3Z1UHhiWGVPZms1VStLV05QTnFCWkY2ajJ1?=
 =?utf-8?B?STR0R04ydzNMRG1JUTJNN2dhcHA0UVhzRU9za3gxNXV4UjRWVDlVMzRnS2Ux?=
 =?utf-8?B?dllwQlE2dVRtd1hqOGRKZ2FsKzNzMmNNS05yenZWckE2dFFzckFkR29mWnRY?=
 =?utf-8?B?UnU0dVBuTEJERmdGeTcrcFA4ZTZKS2V2K2N1L2VxcXIxbUtxaGRwRmtwZDdZ?=
 =?utf-8?B?V1FHN05XbDN5eXdjUEtRNnJ5QTZIbDM1eFpnbzN0UVcxdHpIeGlXUGM0a2Zs?=
 =?utf-8?B?aWdSVWdaVXVMS0ppUWFpLzJ4cy8yZ3pTenJYYysyaEhsVnpmQlNTMlpNYS84?=
 =?utf-8?B?SW9YSjhhQ3JLaWVnWGIzS2U3WGZZWmZHUXhCdXlZM0FzcTE4UFZZOWkxY3k5?=
 =?utf-8?B?T2c3bzhuazQyRTI5M0xjQVM3RGdjVmx5ajZ6eXh5VEZ3WDUxSWJzN3B4S0Rn?=
 =?utf-8?B?bmtzK0U2N1diOG05THBiem9jbytZdU04bkxEdTZxaG0wWmk0VTJ6VWxMS3N6?=
 =?utf-8?B?OG41YUJhcHY1RUdXV0VQUnpNN0hzOVlkR05ucU0xSlBGcVNJUnJYYk1WUVF1?=
 =?utf-8?B?MHBweVBjeTV2K0xtRElCSDNTSnRlaUgzcE9TZXNaQzVzcXVleGNkTXFGc2tS?=
 =?utf-8?B?RXJLYXppS1BZWmJsdzVMMDk2M1BWVFgzeXhldExMcmJ4RGQ0bmZ5WTJIcTMw?=
 =?utf-8?B?OTZoSmcrMG5haTdzRWc0T2o2TzgyMGxsemRZd29keFg0ejBUdVpyWUN3RGdT?=
 =?utf-8?B?RFpSdkY1eXNnVUhGTVFaL3VRRVNhZXBYeTdOSnZCenAwTnp0Y0ZGQTdLQnhj?=
 =?utf-8?B?VzdST1JIK1hMSzRYSG1QNTJzNjUrMjM4cnNKYmNyOWhXbEtCbnVyK1VJUndm?=
 =?utf-8?B?N0lwY0xWYUhzN21VdEQzaVF5NWFkWUE3UjBLL2psZU1GaEp1WUVBdUUwSDJH?=
 =?utf-8?B?cUpYNk9BaGhuSFIyeXZGY0pWODRMZWszZ0xhRkVBZGxDQjl5ejhhR3N3NHJj?=
 =?utf-8?B?RC9RaWJobmF5eU1hUDMwR210Ym1zMWxCTlg3dHhPY3JvRWlENWlUZVl5bGVX?=
 =?utf-8?B?REQvSWQrVXVSQXp3eWtTVzJLSjRmTXN4dnhiVms1ak5FK3dyM3pPdTRURm5B?=
 =?utf-8?B?eEFJcXp0VmtOSElvNGFPdmhUcXlPWXUzbzFsUG9mbldLVUp4bTIycGFpVVJn?=
 =?utf-8?B?dlRGM3ZzeG5lMDBIUFVUV3dhdklicXFLVUYrcWVZaWlqN2daN3lOb3VpZUh0?=
 =?utf-8?B?YVM4UWxiT2M4MWFuRDZtSFQ5YzM0WHJpRUJEUXlCU3NQTkNNU2Y3bXJ6NW53?=
 =?utf-8?B?amJSbGhidW5IWjV3bTVJcUorM1R5YXE4ZE5nUnZDZUZidzk1WGtMMU5PUS91?=
 =?utf-8?B?SlNmYTVuUkNabnFHZlBRWXdqTVREdWJEUmxVbTBBZFdRQ1NHQkltOS95dVFa?=
 =?utf-8?B?ODV0c0lhYTlyUVVBUUkvSE5VQ2JXZmVDRXB6WldxVEpwaWNTTXNrR3llb29Z?=
 =?utf-8?B?bG5Mai80Q1gwaGdYQW5UWXdoaGdCNkRpU3dOZ1ZmRDlwTEREemhBMDE2K0h6?=
 =?utf-8?B?ajM4b2tua1pyQ0F4UXpnL05NU21FQ29JYVJNb3REYnFlZE1lSmRBUTdvSzlU?=
 =?utf-8?B?alpvbEVqUTN3UW5JV1M5UEN2UDRtbFE5bThkV3NiUENOU2o1L3NUSlNBRE52?=
 =?utf-8?B?UkVBbEQyakFjVWdlSmxXcGM2S2dzeXRHM0xDdEJURVYyRUh6R2hGdCtWWkRQ?=
 =?utf-8?B?UGIrOXVtL0FzYjhyeCtoRzBBRDBseE9pM1lnZDNjNEtYMkEvWThQS3hkeXMy?=
 =?utf-8?B?NXl4TVR0QlRQeUUzTWN4UHdHSUVpclVZOTZjSXZQbURzUEY1L3Vld3pSWm9U?=
 =?utf-8?Q?f1KR6Qz+IV4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mkc4STJFV3g3VmFGTEs4Z0VvUVhPZkRyK2VORVl3VkNNNkhPOWdSRTdEVmtS?=
 =?utf-8?B?NWYzQXF6ekRqa1Y4NW9wQWtjbG9kVzI3ejl5SFo3YlliamVBa0pUSzhqRy8v?=
 =?utf-8?B?c1VZVFJhKzFNQStXM0FoRTRhbHlYNURxUEVNcXNFb3FyaG5NeUdmclRJSlNp?=
 =?utf-8?B?ZjUvK2s4RXNpc3FDbm0yWUxyNkx4ZUJmQzU2Yi9pTEw2NEJnWklnekxJUk0x?=
 =?utf-8?B?ZEFYRmlaSnQ0eDdwYlI3TzFWekNIRDZVcXBXZWRucEpTQ2RhQk1mbEVOWTUz?=
 =?utf-8?B?R3B1aVhaSzNKTlU4NFhyWUVkZERqTzRyRlIwa1RucUdpYkZ2OVI5VU93OGk5?=
 =?utf-8?B?YVBCZWlPbFlHT294RUpQNFBNVWpxeWg4aDRFcXRiWlFiQU9xcmp6b1RFZHN2?=
 =?utf-8?B?eUtZYXVrYmovbmZIaDh0d3NXQkNLb1AwM0dNV3M0YWhDemQwWGJtLzMvSWdR?=
 =?utf-8?B?SVBpM0R3b25wOFcwdk1BeVRZZ1A0cnJlOVB2TEZuNlJ1dnJiZGNRQWRnMGVB?=
 =?utf-8?B?ZUJvWTdaNWJLelllYTgrRlM5SmJOUG55RkhGQlVvRGwxMkI1d0QxcUx1RlV1?=
 =?utf-8?B?c3pzcGQzN0pUdTdGN1JWZWMrMGowY2dENnRRL3o4dmk2VUJOOGVFQW9YODND?=
 =?utf-8?B?NzU0ZlFiTVFDZXdBc2dXRmJHMTVQN1k0T1lOUE5RYWRwaVl0UW5yZWlxMmJh?=
 =?utf-8?B?NEd4bFdCcnBLZFFFSTJadXZPWEZHQkNKWHVXTnVwQ1JiRy95K3NjRncxZXJO?=
 =?utf-8?B?NCs2OTExbm5LWW53bitKNlhZbUdGQnh0cXpVdTFEKzNGSXNEMzVtaU9sZnow?=
 =?utf-8?B?MlVYTVZSbkZteFVsdk93em45Q21tb292ZG1sdlVobFpPaE83SkhES1J5Y1Vp?=
 =?utf-8?B?Tm1SbWQ5bDJQTG9uLzJuSHFabXJLdVZnRHhGWW54NW1LbmI4eTBWdVlYelNT?=
 =?utf-8?B?THlUUEh6Y0IrS29wS29XK3ZhMVBNN3NlWmhGZ2l6b2NyODBmWGdVUk90OUIv?=
 =?utf-8?B?VGVvQTJDVWpxZC9ueDArbzhDSlBUL0JkRmVNcThoSG5sS2VyRGhYRGkzai9F?=
 =?utf-8?B?cHZ1YTZ3SkVuYmkvUm9BZjBpbEZ3UUtjaHJ4S0hQdEtoQ0Z2T1lTK1Bramw5?=
 =?utf-8?B?S3NXTDZoWkZ4R1pkdkdWN3V6SDZORmxLdkt3SnIxaEFZdm1NTGdGaVlUblMw?=
 =?utf-8?B?aGRFYUEyanB4TXlqekVpMGtmSFdOVVMwMmRmRU9Eejd6ek9yQVBMWWRHcGlN?=
 =?utf-8?B?aEpHZUVBRCtCRlEvL045eXpGb1d3NGw1V005RDBVZ2gyQ3FlQUNNMTVrUVRw?=
 =?utf-8?B?b2x6L2ZWTCtQR1dpRzZFa2o5WGtzWUtnM25IN1loQmptdm1hL0Ira0g0c0w4?=
 =?utf-8?B?cy9jd0tnQlRuMy8vYmV2czVWMkhTWDV6b0ZudmhDMW1qTTJkaFpzY3BEVjN6?=
 =?utf-8?B?L0x1V3N6TC84cDhUdkZaMzU2aC8xa28wY0FpYkMrNHRpV1RVNmFMUmdyNGNI?=
 =?utf-8?B?VkpoZnVnZEtHbG10TjEyOGdaWnFUem1tcEtQWlFHaExuVFNUNCtGS0FCODNo?=
 =?utf-8?B?RHVWUmxtL09NVmZpdkdEem5VOVJCU2tQMk04RFY1L3MyOHlQZlJHbmtZUmdk?=
 =?utf-8?B?N0locmZXOHdQbUZHWVZxaWVpYllJOUdHSzlEMVBUMm5ra0NiZFhqblZ1UFRE?=
 =?utf-8?B?Nmx0bDJzaGFMbVRMZXpXY1lBK1dsVVRSWWNqVzg0azF1TGg0Y2VTOUxFQTFG?=
 =?utf-8?B?UC93amdLOE9FTVQzZ08rY0wzQ1NIQ2o2ZzdNZ3FrMG1hU3RJK2hJOWJtelRo?=
 =?utf-8?B?V1NmSzBrWkExK0dNbjZHWklQZUduNEhCWGZCb0NoRjZiZHBGUXdFcEdKSU1H?=
 =?utf-8?B?V2dRWnNVVUxhbXlSMFJ3Yy9rSlY2UlI0TzcxTVV4Qmx6enlRbWsxOXNGblFI?=
 =?utf-8?B?LzBOc3dXY21uSkxqTTdQYmVKNTZoSEthZUgwNVZMSy9RM2hub0hRSFpHaHd3?=
 =?utf-8?B?VFBGcm5JcmNKUVBHQXNUZXFqaS9sZXRqRU9ZdlZTK3RGRlFwQWFyMUNYTzBn?=
 =?utf-8?B?N0oxOVQyV1ZDaC9mU0NNRU9zckJvSklpZHZrRkZxMjZMdkNPWWxkV01rK3M5?=
 =?utf-8?Q?FGXg9BRVQmHTQL8rl4yFViSQg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mocmh+ePvzMwfCdiyR38+cYEXtugiYnU/cy4j5SfDnLwFvbALWAx1VkEG3lFEMG861jcp4JYlYKX9j969aHih2QVPz0pBfVDIlbamdA5d/SaCCd/XbPuoXZ22zw5YbM9GKAL6SS6ohKuKmrRozjwbe0W+FqYOFwi60LhOAhMLRgWel8ryvllCtZ371e4LSEhX2BgzT7vpTaQtGZufcW3PySlDvQhGtl9AEzrraqe9im8N7DdiKik3PPMFj8DjLHdWGtmAVkOOJHRkzg6s8wcLOx+FDh84UmcBjK3kGB4sl8DjfbVYuX5Ft1JCCPY3/7ns25k9BFd4DcMYVomk+rS+gCXoabylnYJXq+hF8aXQkETkXWRyT5TQ4VGMIzFnDY1vO/XG0r+ONg9fi7uTiFvzCtj61uWugIQO/FNamRdgmXfvnQSsedmTctfb+mLSpAvQQH8/uU/MvNidb0ZWCLa3bAEpDf3YVMtgNkXCBagv3FhUWh8BwrZNU1IqU1QTDX36xtu8M2zg1c0WT9oiJ5LdseiPJlaF3SAyXM9RuKx28nbrA6bbuu6zTKTAwyKtnob072VaKsYjCQYF7yK9SbWTKvnz0C5kCSisC4C6CG+FO0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed29038d-1caa-487d-d328-08dd88c899e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:55:31.4497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4awpxSzaoPqApSiJ8xCyUXYPnaC2kgMX+Nc0Y5dPBlc7EWnr4SKgozOdLR4AaX0qA7QQ8brXLOCLrYngfxOVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6884
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDEyMCBTYWx0ZWRfX2XoxoFnW+/LE FI41P+nD7wGG/ZNxizVmipL0D7TLgpMusHhAnBDRPRlmkg9mcv5eX6DnK5qkdHEwmY6ixgP03Rt a/y/nZgVX4x8lJmP+nE5b8IJz3zGkVMe/NvvrhgiKP85vdzAuH5hATCazljdYY+XNOIVWG/0G8X
 UIs6Htm8a/jWQA+7ukeruuc4S6hvXRhFQompZliGZ/uTb0xO2t5Jo7IKehU9LPAOF1MEWhcpqPp U6NM0S3yQEY824UUZ/aRHt8HQIoanAiOS10UJpshm5WrUYFwnA+kC9CiJItpJoACjxMhVqO1QdT wTQyCTt2OvyqdVuG5WkfhbxdB1nG+IHHAm2/Mn3J8VTZtTW6HsSDy1Q7+xMo2PZYK0DuOgyMnFh
 mFT1v33MMOhvVZQuFosSlFjReo2jGvEC/4p1je6g8YxwP3B7ooqh/hoWfMu+gTk6c3whSmS3
X-Proofpoint-GUID: c79bKJcxWoYYWdm0x_oyBPDBZWzLHZVz
X-Authority-Analysis: v=2.4 cv=A5VsP7WG c=1 sm=1 tr=0 ts=68139991 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TWb-Gbex-IWcWG5WeF4A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: c79bKJcxWoYYWdm0x_oyBPDBZWzLHZVz

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 5/1/25 11:08, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_open.c    | 2 ++
>   libdtrace/dt_version.h | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 51c056b2..0bda3504 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -42,6 +42,8 @@
>   #include <dt_peb.h>
>   #include <dt_pid.h>
>   
> +#include <dt_git_version.h>
> +
>   const dt_version_t _dtrace_versions[] = {
>   	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */
>   	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */
> diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> index 3fd1b3d1..beef9a6f 100644
> --- a/libdtrace/dt_version.h
> +++ b/libdtrace/dt_version.h
> @@ -13,7 +13,6 @@ extern "C" {
>   #endif
>   
>   #include <dt_ident.h>
> -#include <dt_git_version.h>
>   
>   /*
>    * Stability definitions
