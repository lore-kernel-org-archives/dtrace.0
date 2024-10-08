Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67687DA6C
	for <dtrace@lists.linux.dev>; Tue,  8 Oct 2024 18:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728411482; cv=fail; b=A1zrAYoOSbL8TRQBZGs+5Kb5GHHRQhbkwhbjGfxyibL67sRK6T1w8UOaPDGS3s8AT5heNKhDSeorK45/biy6uOy+FJKxkVbLS4w+dbJ+gmjayaLEOD9dzJAtdQ46LVdLhAsLFTm/y/pPFsORfhZwDQlQygf1g1qNvbCzxs2sPRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728411482; c=relaxed/simple;
	bh=VgB+873A3OD/LjUYjEdTTNQcxIq6EOvhcM+psYFvTu4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XjyJB8KxSevgEDqLuurrwnZaSG0lHnL79j7E05cubRP7QNLgXlHpjcv5800kok8KdmkX5mWGyeHcxFIQvPf9gIkXySHycAcPZVHEZTDuwuH2umJtCi0qEhk7sd9LzeSzp50VGZg/sXrKxvA3l79LLidavu4KbrgeTsAkojz/x6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E92DS9ry; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c5zhUhX/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E92DS9ry";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c5zhUhX/"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498IBtgp030844
	for <dtrace@lists.linux.dev>; Tue, 8 Oct 2024 18:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=h78c8Wu9auoyA6DD2ZtUc9UTK4jP1JCbXdBNanl6twk=; b=
	E92DS9rydXcdxbypSk6QrTeM62e0LR9Hl2qcUM5sEQYd/i1GdsYjIuH4790vMnnT
	biVxYYiWGUWaub1je25ouVVn+kSG3UM2elAe5shJW1SGJE/lyZgHaicKrXzYJKcV
	wZdQ/XOqGXizSYaphraUj+omXqr7KGKZdsBl116tunWf4RIiOmXfnqVjI39hmkW2
	m5AnRBU/6JSd/BtOl9dis/ZoB/bcTEyg3Fb4YhcHEmJRXLcgUfngwI3HsHhL5Rbi
	u2WDY06arwcODbGbu2qdGQMu0EqYYy9gSUqEDff3q0hhRorC8W9pw6jgV9HU1eDP
	m7GUL3LVRblbwUtmDZ87zA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423063pftc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Oct 2024 18:17:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 498HBWBc015316
	for <dtrace@lists.linux.dev>; Tue, 8 Oct 2024 18:17:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw7j7wr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Oct 2024 18:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjvlJPmg60TPKWLEnVl22/CMAFUDDMXbbxlnnyEemDO7+WrLTjb1Ai/p1IEKxo4CbkH0JVWRxyGVWzhtN+ZSr2FkKofwcyAomiN9eGEmom52OIRYLzi4pS1TjRxZ5sU+6tKc7XfjHiEbC229Occn+rsjXGFZ1Ro6X5Q0E4f8ip//4pSTI4Fj+1GNa312HPnJ9UsX1ohuPNZH28o2NZZXXg0YbkEATab49MdAFrxDO+r9CmzvXBX+69UxZk4vGw5hRwgUSuTunwf2cHwqjpOydJYbnwIstzU1yrbtcF+Yr1pV5xR5Tq3mWgSj/Y4YYOXCZiw3UURiJIkzJzi5SC7CKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h78c8Wu9auoyA6DD2ZtUc9UTK4jP1JCbXdBNanl6twk=;
 b=U1XwU7eTjzKn7yPrMgYjmnWs3jb+rqa7G2Ff8gL4Oef1eMj1Rvorm/SspjWQs+pgMxDzWTk+IgCFVV1M3XXXHNEa7hHGDIvVGAC9UMbKNXP47i370/zm78Juxy0y3SLiZuMo/8Rz8IObcU2Ve0BdERxQv26zbXMQZcMH1eg/w8Da8uUVPFE0zCyGDWYIa/3nE4NlV1Mn/uKkhUI7z6ReAj9Fylqz2iXIm2tSCRr2rjuUdG/9tmlbjRgOa3oaE7aM6AnpxuQ7fl9FXWlfiNPD9uAagyhz6IYeCAC4vcabxaVka0r32te7gr6JhdjyZJD/bLxJ2CmAXR+Hb+zYllK3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h78c8Wu9auoyA6DD2ZtUc9UTK4jP1JCbXdBNanl6twk=;
 b=c5zhUhX/eVncd56s6/LcjTHEvYqpqzSfiBZDNyd+pzSRtNfQhrvPgOkDLXMrC0JnO+AqPUAbsBzVJIaKAVfxW/WnVGT0Wj0jmDelW/btThjK4F0W2Lg8zYuhfGeRCPah8FMLfQ7sqB9rooD4B5fQbjFfN5lqBCflhFIRwXCI7M4=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by MN6PR10MB7999.namprd10.prod.outlook.com (2603:10b6:208:4f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 18:17:55 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 18:17:54 +0000
Message-ID: <39e43349-2401-4084-b72d-0fcff397d826@oracle.com>
Date: Tue, 8 Oct 2024 19:17:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] unittest/sched: remove dtv2 xfail
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
 <20240628171634.2801954-2-alan.maguire@oracle.com>
 <Zq1Rhz25fVX5eb8h@oracle.com> <Zr+pbCfu2apcbDAd@oracle.com>
 <Zr/utNV5KswtGN3U@oracle.com>
 <3a029e65-1c85-4808-bdf5-683698a1c85d@oracle.com>
 <ZwQyCsh6OEy1amp2@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZwQyCsh6OEy1amp2@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|MN6PR10MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: dce485b2-1a98-4ea3-e55a-08dce7c58771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YW5IUFROS3pwL2FadmZkcUtPVzAvbXhoMG1kelB6NGtyVEQxYWhKeVEyMlZH?=
 =?utf-8?B?TmpaeWxxS2J5R1QwaEZVNmgxdEQwdFV1dVBTQnV1UmFBYkJYK0ZKeEVaRy9H?=
 =?utf-8?B?WlRCQXJaUGRma3JGamRJY0pDejhuQ3p2R0hBSEJGdENCOGJVamd0V0twUjFT?=
 =?utf-8?B?NkJYcCtNTko3TXlEbGswWTZlQlJFMERkODJTcmI2dEJhOExqWjUyOEJoUHcv?=
 =?utf-8?B?aWdTZkcvSEppNmlaWGZDNldUL3NpVFQvTjdmWnRzOGxIMUNBM1puR2tIdlJU?=
 =?utf-8?B?VTRhUVowZEZ1bk5CU0VHT0h2V21LSkFCVjAyU3FDOSthaGdKVVpjZkhBTlpo?=
 =?utf-8?B?cHVpWWhraVZ6NEVIME1lNVFUZjNJWHdDL3hFMytoMFNOWFBzdjdzeXpQcEpx?=
 =?utf-8?B?bm9FcHZKM0IxTzQzTFBhOHBvWXc0OXowenI5MTZYcGVhVm5HYTNxQ1hOQ2ZR?=
 =?utf-8?B?Tk5mc1hXMjFzSGoyNlBvZjg1WGd6Y3lZTE15UFJaTjNuUmZXOHNnRC9hTnJz?=
 =?utf-8?B?WXRTQ2xseHJtR1A3MmczY1dCL21DMHVIbmtBWE9wWENSaW95MWtUeHA5KzZX?=
 =?utf-8?B?V3oyYnRoaWhSNVM1N3hKSjVhQXpxSEhpcmdkcGh0YXNmYy9pQzkzbVRMT2pS?=
 =?utf-8?B?bll2eHNGVkpqM3BKa0hhNEUyRzJYcnpYRkx5bWN2YTlUWmR2ZEdvb2ZKMHZW?=
 =?utf-8?B?c1ByK3NrZTgvTlFKLzVkWkkxd2oyN1RPd0JwY1RBSDRac3dQVnNJS3g0VGdS?=
 =?utf-8?B?K1hKQjk0M3RYRURzeGx1dnBHSlpzZURrQ21BM0h6MTZvOFRTRGN3d2hLWVZq?=
 =?utf-8?B?NjBmTjhYOUEvaC9kZitDUnMxekgwZjE3cS93U3dKZTltQTNtMFN4UjBEZmMr?=
 =?utf-8?B?ZVZkZk1EaTVOeWlxYTRPc21nVEZTTWE4Q0s0Y25BVk9FVzZtclcxM0JuTXhP?=
 =?utf-8?B?bTFteE0ycXVzcUhXKy8rbFVrdEkxQzMvU2UvTFk3UzdlQmkyUnBaUFJOUm85?=
 =?utf-8?B?dXdiNzZidmFpWTcyM1dLKzNpdlZjQ1piK09XVXk5R0JVUXhSek95cUduMlUz?=
 =?utf-8?B?R1l4dEM0SVJxVmY3aW9DajFhUlloVlBObVgzNm1palhZUm44QVVXaHViT2Fn?=
 =?utf-8?B?cm1TaW5wcW1qSDM1c2dHY0w1MklRdSthcmg0M2xhV1gzZStlUno0cjVjd0dR?=
 =?utf-8?B?am1tU1JVY3I0U2dhVE9KWHFsQ2ZWeld2d3FJYnd4WDUwTkN1SVdBNlFMZmNE?=
 =?utf-8?B?U3dhWUR4dVhEK3FvdFAvdW1saHlYdjlpUDV0bWtscWpCQ0lOUEVWMXlGS2l0?=
 =?utf-8?B?WlRjWVFBR2xmamI4R210dEFTMEV4dXBjaVFGVU5zZ2p2SVB0N3hzd1YwMlpW?=
 =?utf-8?B?UWZMdEovRXNaeUJqeGpsQlRjdWdRV0VFMVU0RDgycjllZFhHaWF4ZS9RdG9p?=
 =?utf-8?B?aXU1bFVMUDdvNlRYR0FxYStYVGhNK0ZueVM4bzRwSU5hbEFGSHpJV04yVkdF?=
 =?utf-8?B?RjFqTjNqelhWTUVQbnJaQVAvUFd2UmNhWVIzZ2todFM1ZnlKTEFKRyt5Y2N3?=
 =?utf-8?B?b1U4NSt1TEVsQ2hEd3ZrdGhVTEhtMjk3b2FObUNVQTRrUTV3dnBTN1FteWp0?=
 =?utf-8?B?UmFLUm90Q253ZXZQdDRrUGVhak5KYXh2OFdXZ2dUTWZCaklvK1RFU21MMzBa?=
 =?utf-8?B?WmJkNkdMbXBtSzRqM1N0bjhGaEY2d0o2Zk16eVkxR2lNa2xnTEdOaERKY2V2?=
 =?utf-8?Q?Za7DMZqKGaJVKH5iIs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU5oUzFXKzg5emFBd0lpSDVPaEZBQVpNMldyREVuY0RkNnczcWJEQnJzVndP?=
 =?utf-8?B?a3AwMHlUZjZnRXBYVVNrMlNvT2tlUStNYzVUeHBTZ3JKeWdEMSsxMytkZEpi?=
 =?utf-8?B?bm5pRzRRdnh0Nk5zQTRBS1NtUy9hQytHOS9CcE1aQ2hzRUlxdzJSa0dvbHF6?=
 =?utf-8?B?SVAxeUtSeEZwck4zSEN0S0I1elhnZ0pPT3RwOHBGSTgwZ2pOTWZueVZrWWE4?=
 =?utf-8?B?cW5ubTFYTFlpdVlEcnM4UzVTR3RUbFFyL3pQUE80TmZwajlxZVNkQWlBSmZN?=
 =?utf-8?B?OVlIblh3b2t6U2hnMW1Kd2hMLzQ2NVE4VWJXV3RtUEg3WGpGdEQyYmpOUzR6?=
 =?utf-8?B?MldiQU9TT3RqRUg3QlpmejQ2UnVqTmRzaEh1MFl1NGcxT1ZsU3AyMkEwMHZP?=
 =?utf-8?B?RUhkUDUyREF2a2FOSndBdkVVOEJObDRGMnp6eDg1dHV3OHRNYUZyMkFvY3Vn?=
 =?utf-8?B?bHBmLzJIbmswSnNUa3ZTcnpqWStXZWtVTGd2eTA0ZFVZbGZRcXkzRHgrSmpR?=
 =?utf-8?B?RittZmQwQXE4ZHMxMkdjdlRQMkQ1NXkwZndrVzZvTUo5b1ZxaldVS2pNZHFL?=
 =?utf-8?B?YzJLZHloUHVLREtZenVBekt6NHI1SVpZR3FaZkxlUksvNGowYkJVeVN6NjJO?=
 =?utf-8?B?cUJpWnUwUmFqQUExbWJNSDYyWU1zZ3ZrSkdMaVh4bFZ0dFNoZGMyMmtxbDhw?=
 =?utf-8?B?T3MxZndnR0d0b29FTXAzTDk0R2p0ZGR3UHprR0hPTjE2Zk9NSEg2eUY4RS9C?=
 =?utf-8?B?LzQ0NmIyR0didlZOZ0hqUFROcGtJYmpHL3c3YSsvM1c5dEV4L3VXQUNtdEZ0?=
 =?utf-8?B?UDNSb0ZlWUxWRytOM0Rwb2dMWDh0RlFVL29nN0E5dXlqZFFoeU1SR0pFVTFw?=
 =?utf-8?B?Y3ZmK3FxTFRMNlFZQUJlODQ3U0k0NXprdC92QThDTFZXSXNIN2EvYytvMEJw?=
 =?utf-8?B?WGhvUFozRHM0WFAvRDFyMnUwTzFZYVZyamhhbzY5aURCSFdDdE9zSTdyb2Vq?=
 =?utf-8?B?Z3REcDcrQXd4S3dCYVp3RzVYL082NkFKZjZneWxRTFZSRGthWE96UnY4bGRW?=
 =?utf-8?B?Y0p1L05qcm8vbGR1TjlUY1pJTTUyMG1kMTkxNVpRRjRGNEVSY3diNWxWMldN?=
 =?utf-8?B?d0pUS2UwR3BaYjYraThMaWRDRkFLOFBraXMxWDRuSEJDK1V6UzYrbER4R240?=
 =?utf-8?B?bzJxbFVINCsrOGE2b3BxWDBLeWpxSVNWN2Z3UVdmMnZRTHNwV0cvcDBZSEtR?=
 =?utf-8?B?OGV2azVjb2RGL2dPdWUyN1hQc0xKRHh4Y2lma2lBL0tZbzhEdHZIYzFyV1Rx?=
 =?utf-8?B?OWthdkpwU3dEeUVkWVljeHVTUGRPUHNWa1JiWkRNRWFESUZvNGhNTi9rWVdF?=
 =?utf-8?B?WVJrZEM3VC9OZlpZUWQ3MDk5cU9oLzJnNUhYY2loTGMxVVBtbEw5K1hCUkFn?=
 =?utf-8?B?L3QyNzZCREVIZHZDK1hMblRWRmx4bW96emxiaVFTRUlnMGZaMFpGSVJwWWpq?=
 =?utf-8?B?VjJRbUEwcTV4U00zekdMZE9MUW5NVytXc2wvYythYzNTUUJrNzFCL2tPSnJp?=
 =?utf-8?B?aHhMVjNPMFlPM3U4OUhXMGIwVGdzZk1nZFJ0cEJLakxubnpDRUFyUnlMOFgz?=
 =?utf-8?B?cE05aDR1OXlmdThXQzE1ZEZwTmFvR21QUlE2YzdZaGRZdVZQTllScHYwVjBI?=
 =?utf-8?B?dGxnTDNVZlNUNlhhQ0hDWUl2VmlzKytsOWRFcHNObGNQdTBLblpWRE5laGFi?=
 =?utf-8?B?YkZTSXZJSHFDV25LdEFMOGtCYWFWZG1hRThvR1habnZ0SXBJVjFTbjgyUnJP?=
 =?utf-8?B?M0IvSjE5Z29ZMGVNSWRnbnNNRjl3Tm5KcmtidmlqSTFOM2lBVG9iL1hCNXRW?=
 =?utf-8?B?MWs0bXRRalR1KzU0RHcwd0krZDFteFpLaGQyTjJmV05Ob2tHRElBNm1jV1Ax?=
 =?utf-8?B?ZjQvRUZxNWVLN00rYTRIWlhwWlE4Y1pYSmZxKytWc2ZDODRkTnRCRVErTHhS?=
 =?utf-8?B?Z3JJMk1ySU9pdExYU2JLK1pkQkxwc3BNS2RQVVc1NS9sNzh2ZERQL0xjeitZ?=
 =?utf-8?B?VVRnTVJxT2Jpc0pKVUhjc1lZc2pkaGxzS3RaQXI1c3BOZ0NNcUpNWGduaWJa?=
 =?utf-8?B?cEhkODgxMCt4TW5ReGNZcTBmTXdSWWZLeFJNekxIZmQ4SDgvRmRRTzVTVzBG?=
 =?utf-8?Q?NFa6X98AN2CpWyk+eLfIcTg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YsLU40XOy/hfc6rHWdDS1632QJ15BOdUPFzwP7Ynves7GGI+YPMo//vkRuUQCW+Psb+yHiganGwxqs8BthEiOYlBnFbyalTzLDLCwbdte5ugdNpOTvjORziFUUG5kv8VhxB2hppUIG6pSjlk+R6rB3zPI4Pf6GXOMRKV/IXWuHya2/BGkyZr9ukXg7CAg3EiNm4bMhzUvUIHIrMVNZaMHu8ctsJcBmnCKb8zGjWxtrork1YnEMNb7jQcyN4r5ynVdAzB2zXvssLWNEJ3KkhLURJ4qcglyujz0LU3YqBdtkVsk7T9cFg8TQe7+jZkZ7N2zbub9jGTk9GUBB/RIEhmoEB8ascpklcsjwnLzQfThUM0Iwp6ZAYD3fgf5/n5cHj3P5JuQ1iVqzrAHNats3RpSh7MQMroH9KwDr3vOqc/UAsbilCVAjv2lkMu4Jr6dxQU7nufMuumSRfJcfigO54W7ESNACYcN41esprVH/T7NEZXlwtG6Oc+KzFAbwtzhxoD+kv0586aJM3YkAV8PKXrKXAvQZoN6KOBczmdKojeljHzPpDOd8u1Qa6HMXE0MrhpatQOO7FAZvk7HguMBF/LNE7GBownX2YKOfWGcHC1DV0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce485b2-1a98-4ea3-e55a-08dce7c58771
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 18:17:54.8729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bk+Dc3+JKL7jqvY7ncP5hVUou1n3aZzPMm8hv++uCKEzUQaUqnbDJKrHqtLP7wPCrdc/T1VnJmTrpNy29khPXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7999
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_16,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080117
X-Proofpoint-ORIG-GUID: TnAkbAAw_OKQyf-7tWStLHodLjHdG0gB
X-Proofpoint-GUID: TnAkbAAw_OKQyf-7tWStLHodLjHdG0gB

On 07/10/2024 20:10, Kris Van Hees wrote:
> Any progress on this?
> 

The first approach I investigated - using a perf event BPF program to
catch sched switch software perf events - seems to be a dead end because
there is no easy way I could find to access the perf event payload to
determine if the event is a sched_in or sched_out event. There's nothing
I can see in the perf sample to provide that info, and even if we could
access it we would have to do a series of expensive
bpf_probe_read_kernel()s in a trampoline for sched;::on-cpu to determine
if it is the right event. There is no way I can see to limit perf event
firing to oncpu events, so we'd have to filter and that's expensive
since we know 50% of the time we will be in an off-cpu event. I can't
see any other obvious context we could draw upon reliably to distinguish
on- and off-cpu events in this context.

An alternative - that has other benefits aside from this specific
problem - is to support attach to .isra.0-suffixed functions. If we can
do that, we can attach to fbt::finish_task_switch[.isra.0:return to
trace the right location for on-cpu. This works on UEK7 also.

The .isra.0 functions are in available_filter_functions, and have BTF
representations (as long as they do not violate register expectations
with parameters), so having support for these would be valuable in
expanding the traceable surface of the system. There are a few wrinkles,
specifically:

- kprobe event names do not support a "." so we need to remove it
- BTF representations do not have the ".isra.0" suffix (in line with
DWARF) so we need to drop it to do BTF function lookup

Both these can be accomplished by creating a string which drops the
suffix and using that at the appropriate times. I have a rough
implementation working for kprobes, and will test fprobes shortly. What
do you think? It would be nice to expand the tracing surface, and if we
did add that, supporting sched:::on-cpu would be much easier (and
backwards-compatible to 5.15 at least).

Thanks!

Alan

>>> not allow an FBT probe on __perf_event_task_sched_in.  The failure is silent,
>>> causing the probe to simply never get enabled and no error reported, so the
>>> probe does not fire and causes the test to fail.
>>>
>>> In other words... the approach in 1/2 of this series does *not* seem to work
>>> for OL7 kernels.  That is a problem.
>>>
>>
>> Thanks for the report! I've root-caused the absence of the function from
>> available_filter_functions in UEK7 and earlier (upstream works fine).
>> Prior to
>>
>> commit 79df45731da68772d2285265864a52c900b8c65f
>> Author: Song Liu <songliubraving@fb.com>
>> Date:   Wed Oct 6 14:07:32 2021 -0700
>>
>>     perf/core: Allow ftrace for functions in kernel/event/core.c
>>
>>     It is useful to trace functions in kernel/event/core.c. Allow ftrace for
>>     them by removing $(CC_FLAGS_FTRACE) from Makefile.
>>
>>     Signed-off-by: Song Liu <songliubraving@fb.com>
>>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>     Link:
>> https://lkml.kernel.org/r/20211006210732.2826289-1-songliubraving@fb.com
>>
>>
>> ...kernel/events/Makefile removed the ftrace compile flags which mark
>> function entry for the code in kernel/events. In UEK7 we see
>>
>> ifdef CONFIG_FUNCTION_TRACER
>> CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)
>> endif
>>
>> I'll try to find a workaround that doesn't rely on function boundary
>> tracing in these files to work..
>>
>> Alan
>>
>>> On Fri, Aug 16, 2024 at 03:33:00PM -0400, Kris Van Hees wrote:
>>>> Running a full testsuite run (and then also individual test) I found this
>>>> test to fail on my OL9 VM with 5.15.0-205.149.5.1.el9uek.x86_64 kernel
>>>> while it works on my Debian VM with a 6.5.0 kernel.
>>>>
>>>> On Fri, Aug 02, 2024 at 05:37:11PM -0400, Kris Van Hees wrote:
>>>>> On Fri, Jun 28, 2024 at 06:16:34PM +0100, Alan Maguire wrote:
>>>>>> ...since tst.oncpu.d test passes now.
>>>>>>
>>>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>>>
>>>>> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>>>>>
>>>>>> ---
>>>>>>  test/unittest/sched/tst.oncpu.d | 3 +--
>>>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
>>>>>> index d2c2ce57..7a33bab4 100644
>>>>>> --- a/test/unittest/sched/tst.oncpu.d
>>>>>> +++ b/test/unittest/sched/tst.oncpu.d
>>>>>> @@ -1,11 +1,10 @@
>>>>>>  /*
>>>>>>   * Oracle Linux DTrace.
>>>>>> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
>>>>>> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>>>>>>   * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>>>   * http://oss.oracle.com/licenses/upl.
>>>>>>   */
>>>>>>  
>>>>>> -/* @@xfail: dtv2 */
>>>>>>  /* @@timeout: 15 */
>>>>>>  
>>>>>>  #pragma D option switchrate=100hz
>>>>>> -- 
>>>>>> 2.43.5
>>>>>>

