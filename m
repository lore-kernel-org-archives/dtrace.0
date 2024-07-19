Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC85168D0
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721361652; cv=fail; b=S9nQTd5s3U6vNnQyaHh2QXEBE44oTlhgAgWq73MJHZPAOb3e7HDMC7HcGjZpkKF0HlR0VK2QBqh3mP7TSRBwPa69c2cyIHjC1grysSEhr8qZCjqqUcgMaGzxN+tfR8pfdmTCYmE+jX8OD3lbmRfIvsJ5VBLvouZkDLeeh7F3vWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721361652; c=relaxed/simple;
	bh=i38DL5m6si0ar2Lj3t9vFzhbzHvMAtLyCcHVRUBGg/g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QB1ns1b00ybPscudzDgxwSAnomQel1pAWeYyyBbRkQkzEF6tUC9eLj+Xk9LmHPB1boK+OW1FvTyHySEh9jLAeG+t7ko8TllG/zlYO61Yt+oXrwN0u4UBEp6x6RvgRsy3vqLi9J7RdEtXMhY+6fUT5fG1AfHFfQ+vpJ4Fs4BkS/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KxW5kbX/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dJVbzInL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KxW5kbX/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dJVbzInL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J40nUw025365
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=Oswya202EaJf2da6IUEfqeulCOilExijcrTsdpsziRA=; b=
	KxW5kbX/q7nTQoDSlp6QdhOeTZzChAgYJYoHyS5umqimGKV9d5gXHFVtmknLI3MD
	v38ux9IASw0KiVEzW1VXmJuj3dLhRRVQtChfL8mcavChnnC03GJkprV04WfnbDHb
	KQ/7nDP/jFFGR/f96zKRn+Twq6ZzfTUPHK/RE6FBYIfJLUswzbVoewPde7+0SOwp
	wVi/hZ9ATJDSnfp9U8tJMxAaqTFQt+Naio5zWQjVJTSFSaBRTTlVsh7Uh0HkggE8
	d1mQsdFltPpfi+5EzUZwmlxXuFhN9VdVJ39AVo5idYZP89ABtFkp50mE1sMwI7vZ
	WMWhOGbqqUvj/DA5ULRVCw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fgr30005-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46J1CgZ4031678
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0mk2a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCzbCBSrVan4yiTFUSTMhDIcOY/bsU6Djluvpybp2HfQpthJFhIXWVaU4hYBbPgmwNeB8BbprzNj+Tes5ihIi/EBwHLx5uzfaX2ues6MH9LtsOdgdhV3a74YbT9S280/WfFsV1udzBYCseOth9c0U3o6/+dvX7smFHc32Dg62wKAmmNpCuCEcbRuvwbGKY4X3RWXlJd5+V53ahM1khrHgU9mAuj8Cd5wzfCWSP6hSof0T30Odb2eqHWghTDt5ve63if+tN4HY+HhN4Z3J2V02ta/yLqvcjsPc+7tmjxDVCtzu99eDLQqDeDClGyJURU9D63GU6dRoUnwBsEjG78+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oswya202EaJf2da6IUEfqeulCOilExijcrTsdpsziRA=;
 b=qW3WVpWdXoBRahNGNawPn3+nzaeWy8gkxKeMuOP/fXmDH5ECfM6Z77Ftm9mSdQs5QARLcYN++PYe2wQJYagTOBW+ll17RIZf2dpz/YDZXzHIRcWjd2bbhe/+ZcEdYykG6F877nDq6QD4Vg5YyQshNfnJxoCS4mFhHq0vUo4QwHmLz9oacijpb/9DxJcvQKKYHm6uOb9CptZp1wl19u4PSRqU7yHnwe4Tmr0AFHBJIE73lrInDwQDzQXdWQJOT9tHt8hn+4592DkZdUfxISak580cEoDrySI+b3Fqj65jW4sopioyzKrLWQKz39zrPjw8MHdeXpOjosYk95dR1TllVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oswya202EaJf2da6IUEfqeulCOilExijcrTsdpsziRA=;
 b=dJVbzInLeJpbuAuW8NZUocYYcpRsKxhaPXWj0MYvvfP1QZjoWNmnaquLL3Ojb/y2t7hRsDPrFL99ZbcY4oPyXAsnjNekyq5Vf6bNQ6f84l0iNzL2JLNk4q4NNcJs2kp3N4XVXFtff+l63eM6sek4X4Eq7Sq9Tgk8NIMgCKkbOTs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6158.namprd10.prod.outlook.com (2603:10b6:8:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 19 Jul
 2024 04:00:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 04:00:45 +0000
Message-ID: <89fac2f7-3b15-4235-e0f3-d4313f43ae43@oracle.com>
Date: Fri, 19 Jul 2024 00:00:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 18/38] Add a provider-specific probe_add_clause for
 underlying probes
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-19-eugene.loh@oracle.com> <Zpl/+Q+ekVRqosFZ@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zpl/+Q+ekVRqosFZ@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 308b404e-a15f-4bb2-81e6-08dca7a75da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eXpmR1hVOEtmZGtTWGNYNEphVHUzbU9DZkxZZVN2TmN1WFJNRVdhWE04VXVm?=
 =?utf-8?B?UVppSmllc0QrT0NmU0MrTm0yNFhUU1pzS2NrbW0vUnZ4RlZrbC83UGJlcTdK?=
 =?utf-8?B?YitKN1R2dEh0YXJmK1FRbnBvRFQ2ejNvbGdESUlTeEJ4MERkN1NTRld6ckRB?=
 =?utf-8?B?Z2xadU5SM3hVUm5NR2xGeC9LelJvaVN5TWNKTHBMQmdmMlp6YkJVV203dk9N?=
 =?utf-8?B?bnV3dW1LdDROaTJrTXVGbGZ0OUliZ0tGczNrZHNXSWF6cC85OGRjaDNUS2JB?=
 =?utf-8?B?cjdxNTR3TXVsdUYvK1Z4WjRuVmRjQm1MNXVjeXZJQmNXOHJEYlVSdWwwcC9n?=
 =?utf-8?B?NGpYRDhaT3FVZjU4d3E1Qy8xaEduQmhKR2E1eWpHUEVaMThzZmF1WVVVM2kz?=
 =?utf-8?B?QXpTTXBOaElxVWw0a1M2azhkTytwbDh1RnJMMGpEbzF3U2R4S1creWdaeXgv?=
 =?utf-8?B?M21Kbys2N1BKdXhMaklNYmFubW5EaXZvbzNBY20wUkZWbVJ1TjV0RzRFc0hi?=
 =?utf-8?B?MTNSZUJMcDcwMUozMVhDN0RkQUJZckI1UDFXYmdDVndETzlORXlXTzZsUExW?=
 =?utf-8?B?T3pPY3EwRzVuc1lsNVg5d2dFekwrOHRiZDNyaUF6anlmd3hhVE5seEJ3eStC?=
 =?utf-8?B?WTA5eldadGJodmdFaWQ1amM0YWF0OW5tNU1sSVdLSWN3VGRYMC9zVVo4eEds?=
 =?utf-8?B?K1R1d212bkRMMENiMXNJdlkxNWl0YW5zSW5CWitrckRzU3A2aW5ML0hvaFF4?=
 =?utf-8?B?aHB5TTRYTlFjTjh3M3NOTDBZdWVBWmZpZmtXVFF6TFdkcVh3SjFVWW1TbGRB?=
 =?utf-8?B?eTNNUWFiMmkzK0tZVTZhUkpJamtHVlZjcWdMRGQ5ZjhNVk1SUi9aT3Bxd0pa?=
 =?utf-8?B?QUgrRmFwbjFjbUxpNFJxU3RYd2RndmUxN3JrR21jaXd2TWJMMU1HWTk5WE84?=
 =?utf-8?B?KzkvUStsNk1LWXVmWXpqNmMrdFlUeEZtVkxGK1A2WE9SZXZTTm9mckd6c0cw?=
 =?utf-8?B?bU9VS1NYUTFyWGJNVDM2T1RnY2c1TmZrRXdKVzZ5U09tN1hEY0hac2tOTEZY?=
 =?utf-8?B?blhKcUZ0c3ZnaisxODVVWVlhdjEvT2JCblJtaWNHaWhhK24zM2J6U3drQ2Nw?=
 =?utf-8?B?VUt1KzVwY2pucDd5Q2Y1a3V4SjgzdFhHeDcrQ2hzMitoRlZmWC9MM09nZFVl?=
 =?utf-8?B?MGc0K2o4UE5CVEZMbUpFZUpESjNWSC9IYTY2U2xaU0RZQ0pHNDJHOWRqeTF3?=
 =?utf-8?B?VXJEbjFnUGVzK09PdEVYN2J0eUwxd0wzVWZIV0FTQ0JrSnRnd21DZEFKa2tZ?=
 =?utf-8?B?OWRtOVpON2tmTHVCZWdCdnVsVGN1T3RaMXY0bmxnV3hBUjEvMmNSOHd6dllI?=
 =?utf-8?B?UXJ1VVZqRis3TWNtcjh3a1JkZmE3NHN3MWpUaXA1bTJvNGRIUU1uVEhNVUdt?=
 =?utf-8?B?cUdqRFpzSGJuT3IzWU1JSUpaQ0lEdEl1M1VoMy9rOFJ4bkw0NTVKNjlWS05Q?=
 =?utf-8?B?RFRqRjAxUUxBVUp3SWRpbWFHalF6alBDTStPY3ZtTms0MFd3b3JJNUxqZXp6?=
 =?utf-8?B?djJNS1pUQnpvYkVycEdXVUZTUk9aRXB0Nkh4WjBvWlZLTFpUVTJ3eDdGNVBy?=
 =?utf-8?B?Y2JrMzNZcjludi9LRlhTUktxZ0s2dlFlZWpmcFVhSG5WeXc2QU1QUXNVeS9Q?=
 =?utf-8?B?bCtCTE5uY0FqTVNQVTJrQXlvYklvMDVmODNnVkRCMTU2cUh1Q3BlUzdvMExs?=
 =?utf-8?B?WHNJQmxHallyY3htd3FBYU1wQzRhYTFvQm1yLytteFM5OU5PaWtUQ2JlaGtT?=
 =?utf-8?B?WjA0NWZlOFdOcDhxTVlrQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1hJYU1TaDYrVXMyeE1MbnNwcHJUenRnVUtyYTB3MHdMTWU3R2R4aDRTZFpS?=
 =?utf-8?B?ZHhhcTFGSWIyOEdWdUZLTnY0VnEyOHFIQTlvWDBoVUZEVjd6TUxvdTVWNGkr?=
 =?utf-8?B?OEJ3TU9YNmYzUUJOVDB3c1RHQ01ERFNrV3BkZ0JBb2Y3aTl3dmNSb1ByZzNq?=
 =?utf-8?B?TXhaM0h4cTNmSTlGY2srS3dIR3ZuOEhDVkRBdkFNU1l4WENsMjZQVm85ems5?=
 =?utf-8?B?RnI2RDZjRHVIckJOdVJmUWJGUUpNaGYyZEtudENMUXBUYTAwL2N5QmxDcmY1?=
 =?utf-8?B?SC85ck9qcytMRUI1dGU1emtJdDBoNGcrdlJLOTNmWTNsdUJISkpjSEZyank0?=
 =?utf-8?B?WkY5ckYwcUttY0E5Y29NUmVmcHhRaGh1VXlZMTNzN1hCTTgyaVJQZkg2Ritl?=
 =?utf-8?B?YXdaTGNkWXl4NklZZmJ0dzBYQkNmaU9qa1ZnY2paU2pmdEsxZUx3clJHV1ov?=
 =?utf-8?B?L0xWdHhBWXZyNVBNTTlkc0l2MjlXSzNpT3F1OCtTbm9adDBKYjR0aEZESzZa?=
 =?utf-8?B?ZzczRmNBU3doNkwxYkIrWTlMYkJDbDFQNkpqb21uR215NzVzQmx0ekRibjJS?=
 =?utf-8?B?bHk0cUZOVFRRdU1DTXdjVHI3RG42amZnMTJwbENndnUrTkRydzUweWc4NHdC?=
 =?utf-8?B?N1JuaEdxeHRzOHhZL1ZTZ3hmQk51QS9NWEVITkZOS2dpRG1LcnVoM3l3QmZM?=
 =?utf-8?B?dFZUYU1wSksxWW0ycFZrRi9pYUhWRWNieWVYNVdKSXJvNW9uczFmeWJHQWc5?=
 =?utf-8?B?QWdlU0VWeVdJb0lnSkhhQlYzTGVUZTFrdmdvREU5bzZhSVhoVGY2amI0Q1pn?=
 =?utf-8?B?R1pGb3VrWWdpNmdFVmZlL1JnRDNvTW1KNzJZSURLengvWlVBRGJMckVrYXRL?=
 =?utf-8?B?NXc0YjkzQ3FNOU5iYVFDcHYrdzI3blUwMUl5b2ZhMUFsSC9jazVMZFZySndt?=
 =?utf-8?B?UnNTeVNMZ1haaDczU3dicnlZemlldm9jamhvcjVXRktxRk9EeElqaGRkcFdp?=
 =?utf-8?B?L01sdzVjcWxkQlNFSzRuK1YvU01FNk56UVhpVmhuNm1pblNPUlZyTi96L2NY?=
 =?utf-8?B?cmthNlJJM3YvV2JGS3VXMXM5QnZBRkdRekpwMlhpZWdHSWRvQ1Nsd0U2Zmk3?=
 =?utf-8?B?dkhRZWc1QnNCejBEb29SRkUvcnhHWTRTV3hpYWhmK1ZmYUlBSFpjd0owWXdt?=
 =?utf-8?B?ZGliaDJnTHUxYU0yQkZTNFJncjF5V2x0a2FpU3hQUTRCUjJRZ0JZZGVYeXkv?=
 =?utf-8?B?enlocjhzdjN2SGlBZ1lHZVpGWFR1elRadGdoeDVNVFdjemZnUC92UHBwak1u?=
 =?utf-8?B?WVgvSlRGK0VQVWt4Ujc4TUxlQS9JNXZPaWRybWV6TnQ4TjU0blZoaHYyb2NY?=
 =?utf-8?B?RmZPZTltcjhkdU9EVklCRERMRVpVSGRSdHhlTmtLV0hHUnRBRWxmblNLeWRQ?=
 =?utf-8?B?OHV4TjBtUkRJZVltSlM4bHh3U2pDVWV6WW04VGI2VmFNREQ3engvTndDWVBO?=
 =?utf-8?B?dXdrS0NrcEg5MzA4VG4wWE9hVGY2VUtIeGxGRFVCYzlsUG84Yjh2T0lPdnJh?=
 =?utf-8?B?aEpZV2MvOG91TTFjRHUrN0pRMTN1WW5NSEpvbkowejQxNDVyOGU3WWVvZkU4?=
 =?utf-8?B?YW5FSjZKdnVPcG5rOGhiS1lJckpNN2tMWGhhVk5PaGE3VzRZblFDOHZMejR6?=
 =?utf-8?B?a014dGUwTUlWZGkxR1NQYUI1ZzhGUlRtdlpoUnNUKzcyUWtsMGpRRjNxajZ1?=
 =?utf-8?B?VnBSdklvdjFqN2JxV2hoR245Q3lNNU5LdHdSeDcrd0o0RFdnTGt3RlNSTXJD?=
 =?utf-8?B?M2FuR3orTWNuSnp6bDRzb25pYzdHS05Qc2ZXNWgwTmNmdFZXYzdJOHExemxB?=
 =?utf-8?B?SFdLTmpJVXowbTFpb09iZ3ByVDhqRE1DRTBZQkJxNzRJeUJtaU9DajJsZm1G?=
 =?utf-8?B?WVIyZ1JqZ1ZTZ0ltaUtWc3RyV1JjYnhMb2lOakIra3JwRWtFR2RhMGV6WWJF?=
 =?utf-8?B?SU14ZmIxT1lPcDBEQXljUjI0TWZiSjdWN0dwUXVxM2NNUVhkWFplNnVBMkIv?=
 =?utf-8?B?RnZOU0lza3VTN3dmeVBRbC9KZklMeVJPUzNrcEtBdVhEU0lUUVZCUmN4eDVL?=
 =?utf-8?Q?iEB78OsRd6JeRmVFJW4zXHUpZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	hYpWmfgtJp1jIpctirv3bu+shG3QNmtwQ2x1GsXq3Vd9rRKlgGLaYRhd/X254bzsFCsCFT1aAUaaRhzZubuKYH+pmzEWAaUdoNL9VwaJe5kVjW9roBSkxIv33Nm6bIq+j6ONfBcRPpv8GH/yxloWlhC/2eGjDSdfYAEfp4yCDW5xzGcINXNqXrbfLRppVDPeFi19pExxnZD4Rd45tMattzpTIYuSMpy1yStT6a2Y8bO7C/YZh4zCG6Uq9ChmLAOxhPQ4Vki8XO/jkbGeLt9NnxDNhXsCN+P4J/xm+rjxqHC9DIFkdL8r0gw8G8qNYjDBOzFZCZfbJcGcUTm3bIfyNNFAJnPKCPWSpfU7KVsN8Vd3wKzFapDjQQwhjv6LQryILzxhNcatJ4Bp9Vf2EJjyqpgVne7jSI3Ak6UAojSO2Cs9zUjRuiNyxDDVna+eETc3z9N5v/dIOoz8JleF92N4xhR8jJsgrmKryZu/giCgAiMZUuMdLfhbatrriw4h2/s2QpsiKFcd3iV3uRBe6C5UuRlvlfjF/SaIjU+0KQMBEVX8PglD3BxhIvcjAU2mt2HFln3B9aeXUhK/m4LYIXVOG8s3OY2MZaV4+XX2oppY94A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308b404e-a15f-4bb2-81e6-08dca7a75da1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 04:00:45.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYHShejObT7+HVkbqyzT9uaIMVDce3Z1EtsHk2NWboxSH24q1YNDCI8/m7qvHieg7N+yZRrScFWgO7tr69WqjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407190029
X-Proofpoint-GUID: O99BpLaG1BkCkkZIC8O9-Pa5H-hN_RVp
X-Proofpoint-ORIG-GUID: O99BpLaG1BkCkkZIC8O9-Pa5H-hN_RVp

Patch withdrawn.  Its contents will be squashed into a new "v2 16/38" 
with a modified subject line.

On 7/18/24 16:50, Kris Van Hees wrote:
> See comments in 16/38
>
> On Thu, Jun 27, 2024 at 01:34:35AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_prov_uprobe.c | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index c77063a8..5dbd75e3 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -129,6 +129,38 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>>   	free_probe_list(dtp, datap);
>>   }
>>   
>> +/*
>> + * Add clause to probe.
>> + */
>> +static int probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
>> +{
>> +	const list_probe_t	*pup;
>> +
>> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>> +		dt_probe_t		*uprp = pup->probe;
>> +		dt_probe_clause_t	*prev, *pcp;
>> +
>> +		/*
>> +		 * Check if the clause is already there.  Since the clauses
>> +		 * are added "in order," we only need to check the previous
>> +		 * entry.
>> +		 */
>> +		prev = dt_list_prev(&uprp->clauses);
>> +		if (prev && strcmp(prev->clause->di_name, idp->di_name) == 0)
>> +			continue;
>> +
>> +		/*
>> +		 * Add the clause.
>> +		 */
>> +		pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
>> +		if (pcp == NULL)
>> +			return -1;
>> +		pcp->clause = idp;
>> +		dt_list_append(&uprp->clauses, pcp);
>> +	}
>> +
>> +	return 0;
>> +}
>>   
>>   /*
>>    * Look up or create an underlying (real) probe, corresponding directly to a
>> @@ -811,6 +843,7 @@ dt_provimpl_t	dt_pid = {
>>   	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>>   	.provide_probe	= &provide_pid_probe,
>>   	.enable		= &enable_pid,
>> +	.probe_add_clause = &probe_add_clause,
>>   	.probe_destroy	= &probe_destroy,
>>   };
>>   
>> @@ -822,5 +855,6 @@ dt_provimpl_t	dt_usdt = {
>>   	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>>   	.provide_probe	= &provide_usdt_probe,
>>   	.enable		= &enable_usdt,
>> +	.probe_add_clause = &probe_add_clause,
>>   	.probe_destroy	= &probe_destroy,
>>   };
>> -- 
>> 2.18.4
>>
