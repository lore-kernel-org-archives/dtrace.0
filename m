Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0128FFF3
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754496177; cv=fail; b=EwVDdXRqvL4bRWZnVP8piL36aVL9pAgRewIMf5k/nQ8FkLfeKR4P/DvUfo485e+77Xyv93Kl/sD3rQ4sON3HrAGa6vBL/rbnu5gEg41gxKmLCM+kBD08GMgmQJ38tFNzRWXGBrLrcsWNF5sv7SuXvodcOpRoTStGurFLQxVpIo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754496177; c=relaxed/simple;
	bh=adCycdygnigoxRaakKuRFBEoOopuFNWjCDobtiQAUEg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RC4rDGlVpNkWM6qtIgV11h4SdVRwR5ic3O5UPN7qzJNm4qiddDA0XvGBFVAVtBzGsl0KZQBtIGPiM9YU1Udjj2tu/N+sGh5asT4xg+FGuGQtxp1cAdpUH84jdCPwD0ipWI2gcWQcT3dKUckVJ8mriA/jexOyoqNwjozi8DBjJ0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cIKGracS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G7JpQ9La; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cIKGracS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G7JpQ9La"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CSEHA001256
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gEzR7NF1RfSlHXrvHDNej7NMCbEU4n/8u9660YWs/6Q=; b=
	cIKGracSDvp1QZk4Edik9fyNq7tQEy21aBf+NVb2fkM4D9gOP53OXJ+kB9G8Me1W
	XrtQ7s39QE8MkdYik1nHUOz9pgh3aePc59rReu2Oo2jrRWs90gN0Qmv21aWXUs9o
	CnR7va5gObFI/Jk5/j64mw1eIux3lThP0w7mkFAt/SGzG/rlvdHJvYwvjCFcokbc
	cLkhbl6DBeulBXh5wYDh/s2tBiGmd36ezX37DGMhikY1rsFpa3UbCd8tA+EhZ9zQ
	IUVaEbw40A4YYWiODzoLzezwRHIXdhrfxaXJ5wTpcDwO3e3O8HsXnhG8w8DxMgR6
	MfaEcZDE0Ql8hdpJHMvTHA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvgt0sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:02:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576Fa5q5009871
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:02:52 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwm7eq2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:02:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeSX6mzdcHn/LJ33jGasXAmUw6lcQBCEoko2XKS8iqkRgRisWGbKJDROntYuW6zsYYF9u8auOz2bBY2c4Fc0khdiW1cA3j6Hl3buJp0iUdWz29IZn+4QLDdS0PKzoxHtLKCH9kViuH7/3VStM54SJJUDJaggq5FUUE7Badbwj6dH0fhA+4gDtZ/DTGMg6jjfs585vaTY/kgoz2hs1CKZZmHfVnFfCDTCpua+LQJr42L1NH93dXrIb2kY8/qHSqNQWACkz1XbwMAd/gnOBm/mY8A6MoRPBM8SnDvoo/NgZ0aEzNBunikI/cV5b06hoHiBf0wWl31OvVQp26GD06EJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEzR7NF1RfSlHXrvHDNej7NMCbEU4n/8u9660YWs/6Q=;
 b=q74KqIbcKdfDouD6e9YUGKJkuyvhCQqpLhOIJTVQCR1mDbb+7WJ1sk1IjK5TxrGHxtaA06AubA1Yk+moq9KRQJqHpa9DaRimDfOowAfyvNXD2i5O1IXVtDdj9Yy9n9pmsdsYqKxcIevGWJ7czdhDTJY/atlYSIwSQHLdx2RKzYtxi+0PJHvfw1tk28MzJnVjqcTayz/xh4IVu66+47yTwH/vKGc/XcyP+iSCZ+KCVyfFBmS5Ui0yo7xIMoNCDz5efk8g23aXBnwN3TZXPBbAcjDjPHAUXGouSO+NaQymDNafbLMnKJmnKDYgjog/5pKLNF0/FKshZU6l51aubXNouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEzR7NF1RfSlHXrvHDNej7NMCbEU4n/8u9660YWs/6Q=;
 b=G7JpQ9LacdNgJO4zgGC3fkQ54kJcZ82iH3TOtghOMOXKnioxEuxNTT7ZEixYFoGezmWpb4om5W9T9yhh7pSR6F8pvxm3ipYuFdgcIMw6L6mVWfsj8mL3d28nCsHfXpcQf2Hd/iVEjUif9vPHc1uzHYOAiZ570TkU//WUWUX8R+c=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DS0PR10MB6247.namprd10.prod.outlook.com (2603:10b6:8:d1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Wed, 6 Aug 2025 16:02:49 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 16:02:49 +0000
Message-ID: <c6457db8-f144-4232-b802-b8eba00bbb6b@oracle.com>
Date: Wed, 6 Aug 2025 17:02:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix various memory leaks related to stapsdt and usdt
 probes
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672DC48BED654643C7F8912C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <SJ0PR10MB5672DC48BED654643C7F8912C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DS0PR10MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a11e25-347c-4513-3db3-08ddd502b0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEc2RE1HRXVKMEtxQnJBSDZFelFwTVdzeGFPdEt0bXlWc0crdjVtcTFtZjNi?=
 =?utf-8?B?cDFGekZYdUJCYUVZTFNxVXZDNG1kRld3MlZwa0h1Q1V6aHMrYkxsL0o3dTRk?=
 =?utf-8?B?WEZjWUpTL3U2bFlXdnZSeFo3VVFxbmo1amhDd2ZpZHA2OHdDbmR6aWFPaW9w?=
 =?utf-8?B?UjBqa1JQRld4U0dzcFdnU0MxVEtoYyt1Vk9BZjV1dXpvMTdHQ0RMMEsyaVVa?=
 =?utf-8?B?UmsyTlROazVBTTVtMHdVSWh5OGJncEV1bmpsamFoMG94MkRHMTRuUHdHVnl2?=
 =?utf-8?B?citSVjMvYmF1UjRBekJUcVh1bmFoaXJqSld0enhsYnE3ekFyVjVLdTRQdFZQ?=
 =?utf-8?B?enJ4NW50WVU0VWNuSTRwdnVJQi9wSzRNOEc3UUxFWDMzTWRLSWVqRjU3cUpE?=
 =?utf-8?B?K0tMT3YzQ2gyS1J4MUhQZjJxRjREcG5od2VXeUttTG1KdGUvSHdYaS9aSlU0?=
 =?utf-8?B?RVBkQVNIWmhBTlpzdm12NmZicHJIZjFwMUhxRTB4RjRvQm56WVhnUmFyYWgz?=
 =?utf-8?B?ajBYQ3prd3l6dWNHeXY2QmNFQjJIalEzdldqbHZEVS9SYnE0MVdpWVdBaTdZ?=
 =?utf-8?B?cC90S0RqNnVUeFVzcDR1a2ZIa3BDbDUxbW5ZT2F5M3p6MUgyRXBGeURmNU5v?=
 =?utf-8?B?aUl5cVY3ZGtuWVNVV1YyTWU4L2VCbExlKzk5emlFWGhiNWYwU0ZxS3A4bkJ4?=
 =?utf-8?B?aDEranMwczlFYStZK2l2SE1TTlFBaXBzVVBueGRjQmpjS3gyRi9VU1lPTy9Q?=
 =?utf-8?B?YlkyaXQ0VHdhL2RZWW84bFpJRVhGb3luL2Z3SFk1RVVLQ1ZZN0JOYzYzeFBR?=
 =?utf-8?B?aStwUnRNSExudWdKc2w1TmJDR2RScjljZnNRUFNGVTJLbEdYL2RCRnVjVzZW?=
 =?utf-8?B?d3VQS1RUb3cvTllnbjBuek5xRGJqa2JaelhhRWRrNFFWNzRIV1dwYS9YNlNk?=
 =?utf-8?B?KzIwZTNheE04dlBzR2FxeWxpZEQrU0RoTFFRMHV5VHlaUHJkYzNOZjVaV25Z?=
 =?utf-8?B?cUpDNkswellCOHZEK0FFcktWZ04xaTJFUmJXTG9tSk5xYTh5bkkyVTBoSk9K?=
 =?utf-8?B?Z0RXczF2UEd0Uko5bFJrTDhPTWwydnVva2ZCaVdDamZHT2g3QUlGd1pMTzlK?=
 =?utf-8?B?R1RwMmwzdWpRRzF6SHpzSHJkRDUrZUNPdHY1Z3RINm16QWVYY09KQXFmRXNT?=
 =?utf-8?B?aEZwbUJCbS9Kbkh4TVhVbW82YzJHOG51TkNNMFhKbHIycEQ4aWo0aGh3RGQ3?=
 =?utf-8?B?Ny9WM1BlNHBudE1EY1lHTFlyRnZRN0kxWkxDcVBJaXFwNWluOTlRT2hjUVFp?=
 =?utf-8?B?QjdFRnlnMTdUYzhRdXZudldBSFlKV3BmNm9TNWwzRlQ5UXlnbVg5MitCZjNp?=
 =?utf-8?B?S0F6UWthS2ZvblYzdzBKTWo5enBTWjZVYzl2NUVpRnRnR3B3MTFkN2NWRkFt?=
 =?utf-8?B?dzYwVlkzckVKaEhpakJ0eHBhTmhHdEtibEkwTys3VmZ3NWNrL2dyN3V2dDVE?=
 =?utf-8?B?MlZkbnRuc0NtcTZSUkZWbjZORXJoL1oxTWNSZE9jdm9kbkIwK1JHRFp3eGZl?=
 =?utf-8?B?eE5XVTdaTjExQ2xCenZtSXpRcGdVeXBHbmJoc0VYRmtWcW9GVVU1blRCeEpv?=
 =?utf-8?B?ZnF6SC9lSUQzbmgza25ONlh1MGtsY0xNTmFoMVBnZ3dyeVZXQ2Fja2tXMnJP?=
 =?utf-8?B?cEpjblMzTENLU2N0dDFpM2l4QmY4Wmw5WVk5djJvRDhKUEpPdldIRXdFeUpv?=
 =?utf-8?B?L2VBaUdzTlI4M3JMa0tYR0hnaS8zTnJ3QWJYamJYMWtpV2phdlNLOTlEd3lq?=
 =?utf-8?B?cFVSZ2M4cmV1ZHBiY3RTTi9OMGk4SURDQXpjbkcwcndKQ0QrV2tpeUVqanpr?=
 =?utf-8?B?L05zTXZISjc0QmxhRERqVldwSlBFV0ZPY0hhY2xVMEtuaTFmUUpBYWEvZTVQ?=
 =?utf-8?Q?Dmw5mE85y1w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHhRTFZuY0diRUhLU3ZlM1QvRG1iL1pnbldpcC82UkVGTlRMSUFEOWJOd0Za?=
 =?utf-8?B?SnpRSkdjWGFaYzUvWnFXNDhwMU5LWC9ZWlh6NTk1d2pmcnZTUGZHeFJwYXJk?=
 =?utf-8?B?YlY5TmlyUGFobHpFMCtBbk5mcWE4TEVMa0RKS25kREI0VDJHdlJURElPd0hG?=
 =?utf-8?B?MExMeFR5R1c3cXVHZHJKR1EvdWJpV3hIS2lDZjdHaFN1ZEd0UWpCNXBEVGQ2?=
 =?utf-8?B?M0R4OXdXOWs4UldOOS9XbWNUK1gvd0hFVWxkMUlXTFR4VU1zM1hqc3dTK2lz?=
 =?utf-8?B?amw0enExcWM0UmE4NXJRRXBlQ2dqcURuRWQ0VXYzNS9iSTlPdFZjSmd3aXBr?=
 =?utf-8?B?OVltS0FyWlM4L0Rsd2tCZ2hWQTh6SDlMR3VVZGUzTXM2RHowRWdDeWtuaTRs?=
 =?utf-8?B?WEVxdEJaanZjaUhGTXhORitGSGJFRXFTU3YxUzRZV3A1WEhqNTdYd3VrQ2NP?=
 =?utf-8?B?c29SUVpiM0ZZWGhPajg5VklONGs5NDFTaS93V0htOGlsSnFEcTlRZEJzQ3hy?=
 =?utf-8?B?OEtMaG1LMkRWZC9LcFVFZkFHc21ibVRVQW9ubU5lL3ljTlZzU3dFa3lRekRD?=
 =?utf-8?B?NjUxMlg5TTJmM3d4RWdYclAyNVFBcExnMlhZRDlab2NtTGpLRzgxdFpFcTdB?=
 =?utf-8?B?T01XbGdGYm9Na0xaL3lHdlE2YjFGOHZQbSs0eThPMC9tY1h5eVhaMFd6dG5Q?=
 =?utf-8?B?V1ZISEZoNmo5c2RHNTNSdUhnaHV5T2Vab29MQ3I1dEs3UHNsaFRodkNmandt?=
 =?utf-8?B?aW9xeGx2VHh5V1B0d01lenB0MEU1N0laZ3lpeCtaaXkrUStoQkZFOEkxYzdJ?=
 =?utf-8?B?UlpIL2NnUFB5NGE3Nk00eFBkTzRLMldEY1BGQUYydDkvUENNTGt0WmdKcmhV?=
 =?utf-8?B?U0NiTHdrOEVaanBER1czZmw3TzZpTG9RbU5hak9FNUhYRmpGTGF0ZStrRysv?=
 =?utf-8?B?UHQyK09aYmwwdGtLaTNEZkVFdDlQb0haL0JnbEJMRERKVzFONDVnODZFMUxM?=
 =?utf-8?B?Y1kxQUNGcC9uR25MUHMzVGUwR1VDc09TcEVhbTVjb1RHTGxiQUZlNThsTzRP?=
 =?utf-8?B?eFNRUU11dytHNGJaaDhHNURmb3gweCtGMWs3aGNHSGEvZDM4bzZHamR2d2pu?=
 =?utf-8?B?MWlreHlzTU5RSlgwVlZnajZ4bjh5YzJBSzBGNnAveFdpVDlLVFdyVXEwRkJF?=
 =?utf-8?B?VXhrV1Brd3JqdDV3OWhUcFR0K1RQcDhoTFp4S3FyR2I5QXBQY2hkUVYySFpX?=
 =?utf-8?B?RFJRSDJjMDFROUV4T2VkOWErSUVONTBoQ2licVVxQmVwNFREVSsyRWRTREJZ?=
 =?utf-8?B?dm5tREhsbEt4eTcvNHdVTnhNL1p2TlpNUWR6djdPa0RNY0FnTTkxUWJPN2lm?=
 =?utf-8?B?U1hCbHZ5MDFsT0lsVjhXV1FXL3YzWGE5Wk9HZmM4c2R0aWJ2aHlSak9RalFv?=
 =?utf-8?B?RWw2bnlweHRIU29wNW9MbEZzWUgrYWVlaDJlclNTZnU2clNSMVBUREJCc0la?=
 =?utf-8?B?NjcvMy9DMmN5aHg5dEFHQWJUMUsvT2x3SnF2aDl2MWJKeUtrQjBRUHJxdEx4?=
 =?utf-8?B?Q3BYcjVIeVZlOXhOYlpUUlpuNUNwWmwvR0xtNHFHNklLTVRmV0JieGtiaGw5?=
 =?utf-8?B?eTYzSVZCUXFXUFFZU3A0bVJzUFlDeEhzTUxhNlp2MGM4NGxmUXRWdklRV2M1?=
 =?utf-8?B?Yy9XaEhpKzBJYTdZMit4dCtDMk5zUHVCaW9DWjRZWlNSZnhiMGd5bFB1NFNr?=
 =?utf-8?B?c2U1d2lwQm4ydzNsMGMwdFhmS3BNY3FYdDNxTkdBUVB3czZiK0lhd2dBU1J6?=
 =?utf-8?B?cVZzdU1nbkdFNW9CZ2ZoYXMraFZwY3pYQklSVWN5Q0wvcnJqdVdERjcxY2dN?=
 =?utf-8?B?bml4dDBpSk12Qkpjd0cyQUVzR0VzczZJNmxCa2ZibTNMQ2tPbktSMjdIOFJt?=
 =?utf-8?B?NzN2MTBNeWlqU3FCUHFrbGd1dWc0UktCVDhmR1ZQOEZQN1pJdGZ2QlFXbDdO?=
 =?utf-8?B?a0RJTnAvbjluSzBRQlJkNGZtdmI2ZUZsOGNKMm9pUGxNTDNvMnVFSEtOelJp?=
 =?utf-8?B?cm03RDgxdStNSkNldDNBZi8yL2ptdXI1ZXNMN1pQY1Q1clQ4V2F0Q1NKN05r?=
 =?utf-8?B?Y0tncW1MYWhKLzdGbTlycGNyRGFBbXRKQVM3ZkUxRXNMS0lTRkFiRVNVQjVw?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yMtGY/EemRVA7iBWdkJiLzWT2y0ivGvVLHl0faoKqRGPfQR8hVdfv2q31FTxmWt13jANj8ycBWbkO2HdyBS79sWUByFRxmQeBx1jpP8b1gauIld04v4WfExhNdNvq2tCQWQTDameq6kEgRj2tkumAImFR43SLElpwpvZhaOCPY3isQ60W4UeByTcHzXpv9ltRPajv0eaC4+vE/yf0VtX3sjTGarphD9EhKFhircdjCNLqP5fIH1fsFa+6L+Q96NlqkKRHwRube08f4mmycmo7C3HEs7HwV9MLxGxOMLJzB5CtVkr1yzmpdHH/q2XkvHTWFc/Za6mZKkn4f/yhO5tfYmprQYolSimsc1/TlHT7ukFl+ycCky0eC87tRJ3VJVidN5D7njUzlX0mNTVYtwU+4Bbelx2Olfdstu8McRCQO/8VeW7VKCXl6tK6pBj6AClvb6242ZNRvanDSCcg0aHthpdAEeCaPAJCifeLL/tL5DQSoDQIpnPu80+siek/coKlMphqp7a0AHBz8S4dzyneTaCI6YUT74EmuaBdBeMhC/oOG5NFsMFwz0Teik73AmJLXXNc8aAuptxCOwmvaSLtHbeiU37hQBg1Qovs3lFclA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a11e25-347c-4513-3db3-08ddd502b0ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:02:48.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udAEue0U265zuvh6qPvTa5J+kHeDhhgGdoTciKrquysIFM1TD4tNrCT0KaVt2bUkkr94ikFZ/YnYB6oeXWdeXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6247
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060100
X-Authority-Analysis: v=2.4 cv=WMp/XmsR c=1 sm=1 tr=0 ts=68937cae cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ftxqXsB2L1bEL69yvAoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dFlyvvJyFurGzNc9AxOpWrjmFecVXSYC
X-Proofpoint-ORIG-GUID: dFlyvvJyFurGzNc9AxOpWrjmFecVXSYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEwMSBTYWx0ZWRfX6DNcOkxbyp+p
 Qg1rAdNosIYNle9cbjRTiOSiV7ZGXe2KyLXhIoY7U4RrhRVAg0Dh9ZZWvKd5ARXeGPA0CGf4EH/
 EvFVtup7feFoTcv4cvdxopodqDFn0DN7tyf3een3vCXfS2HyYZ6Dmb8JiOKxwbyuETILKSvOlHK
 mFj1TcuI+UBzxDKvlXGGl3BKL3fbJkRCXKISluvJ8PzKH8DTSUFrV122//gSHEPnUDuf41blYdP
 B7Bdum1MjaVpVBevH/Oaff9ZnYYsr3s5TnKcLz8ENtL4TWUAIT5ttFa1ksQ4i3dKRrryx90ghCO
 OeGpmDFjgt5mdI08FHMZvLeLE8PyrhQpRUQKzD0tqFd1zbyTpYhAWkW3Sv+I16EsHCIT0WyxtMb
 F5XARwrKguo6dxhEL5wCnp9VnLx18tMWJxQkEiI2v6Hb0Ryb/NZ42YAvCl1F3o/e0659tajm

On 06/08/2025 14:58, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Tested-by: Alan Maguire <alan.maguire@oracle.com>

All stapsdt, expected USDT tests pass for me. One question at the end..

> ---
>  libdtrace/dt_pid.c         | 14 ++++++++++----
>  libdtrace/dt_prov_uprobe.c | 13 +++++++++++++
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 42f667fe1..4af9141aa 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1282,6 +1282,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>  	int i, err = 0;
>  	int fd = -1;
>  	char *mod;
> +	char *no_fun = "";
>  
>  	fd = open(path, O_RDONLY);
>  	if (fd < 0) {
> @@ -1415,7 +1416,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>  				       &fun, &sym) == 0)
>  			psp.pps_fun = (char *)fun;
>  		else
> -			psp.pps_fun = "";
> +			psp.pps_fun = no_fun;
>  		psp.pps_dev = pmp->pr_dev;
>  		psp.pps_inum = pmp->pr_inum;
>  		psp.pps_pid = dpr->dpr_pid;
> @@ -1430,6 +1431,9 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>  		}
>  		if (err == -1)
>  			break;
> +
> +		if (psp.pps_fun != no_fun)
> +			free(psp.pps_fun);
>  	}
>  
>  out:
> @@ -1513,7 +1517,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>  	const dt_provider_t *pvp;
>  	dt_proc_t *dpr = NULL;
>  	const char *pidstr;
> -	char *path = NULL;
>  	pid_t pid;
>  
>  	assert(pcb != NULL);
> @@ -1525,8 +1528,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>  	if (strlen(pidstr) == 0)
>  		return 0;
>  
> -	asprintf(&path, "/proc/%s/maps", pidstr);
> -
>  	pvp = dt_provider_lookup(dtp, "stapsdt");
>  	assert(pvp != NULL);
>  
> @@ -1542,8 +1543,13 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>  	}
>  	dpr = dt_proc_lookup(dtp, pid);
>  	if (dpr) {
> +		char *path = NULL;
> +
> +		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1)
> +			longjmp(pcb->pcb_jmpbuf, EDT_NOMEM);
>  		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
>  						  pvp, dpr, path);
> +		free(path);
>  		dt_proc_release_unlock(dtp, pid);
>  	}
>  
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 8c8dcae0c..986ac0ead 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -795,6 +795,10 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	char	*nptr = NULL, *xptr = NULL;
>  	size_t	i;
>  
> +	/* Nothing to do if we already populated the arguments. */
> +	if (upp->argc >= 0)
> +		return 0;
> +
>  	upp->argc = psp->pps_xargc;
>  
>  	/* Copy argument value source string data (if any). */
> @@ -941,6 +945,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		upp->refcntr_off = psp->pps_refcntr_off;
>  		upp->fn = strdup(psp->pps_fn);
>  		upp->func = NULL;
> +		upp->argc = -1;			/* no argument data yet */
>  		upp->tp = dt_tp_alloc(dtp);
>  		if (upp->tp == NULL)
>  			goto fail;
> @@ -1716,6 +1721,7 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
>  	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
>  
>  out:
> +	free(spec);
>  	if (fd != -1)
>  		close(fd);
>  	if (rc < 0) {
> @@ -1975,6 +1981,12 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>  	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
>  }
>  vi l
> +/* Clean up the private provider data. */
> +static void destroy(dtrace_hdl_t *dtp, void *arg)
> +{
> +	dt_htab_destroy((dt_htab_t *)arg);
> +}
> +
>  /*
>   * Used for underlying probes (uprobes).
>   */
> @@ -2014,6 +2026,7 @@ dt_provimpl_t	dt_usdt = {
>  	.probe_destroy	= &probe_destroy,
>  	.discover	= &discover,
>  	.add_probe	= &add_probe_usdt,
> +	.destroy	= &destroy,
>  };
>  

Do we need destroy for dt_stapsdt too, since the htab is used by the
trampoline via copy_args() there too?
