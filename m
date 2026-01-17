Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4F296BD3
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768615584; cv=fail; b=aCMQGjLyuXmZI2a3JDxdhB9p8pQXRuOQhx2TO1rPdVKqgY76LbabX+j19Ae01pyz7mIQjKmTxFueysXqxe6G7KPiwE+gGObOm5evdcTDF0nLwNXkskUKufw5rB/IAcunbqIIZliHN2aXtEPKZf/9o2N7iUUZ5SBT/vi682NwMxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768615584; c=relaxed/simple;
	bh=gtmKzHZB0qp86ksMh4fYKJfOVU1qcpyH7y+2lLWrRXE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LEjSeA65XsbrVIrhTYWKkbPT3oIjcvYMXfMrE+aCHQK5U1zxcrQhr5yj/7Bh4u4mXWXFTj96CswQwtfKykVwH0x2WRpy36g0IV1upXyoTfg8lGVQ5aqtieItqw7m5FTMKcYlFMw7Ue6ywhMD/OIRObANGhipRl7E3rzoemlhA7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ReN8SC3Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H58We52+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ReN8SC3Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H58We52+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H1ZOik212052
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=EgH2xJeSsSgpLl0lqn3J3ovsgXCQ+hTdfCJt26DtO5A=; b=
	ReN8SC3QxGt9MMJh84gjTej1JKaXQ4NjYBh7PtsxXhlMPRZ4hTA8JpYLuYF2xYkp
	gTkilZe43aQBvfo0NN+oxGqZyhHuG5yjDHNUmKnsnQceALe2PqPAsvA2tKEbNGB2
	jnYeaNbQU2ly4XYH73Ooy5d6jNrc7HpCoqkAsz8Gfs4uG0jDo0ojmqlwJJ4XQLp5
	6SVcgtLDPDdAKvTkAuiIHG1E3WBy8fJexBp2nfkMMagPFKYeFeUJvKjyRe8tf30B
	B1mvcXfVPls9VO9HR7nZzWyE2XnqSFqDFUpXuQRY1nKCvaGdEOREXPlouOxW1AMV
	0cC6XyHc4xW45O2hrV+WMA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br0u9g0mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:06:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60H1YHEr022766
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:06:21 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0va0kuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiTxlFvMEJvB8KcmgMM9k+7v5PTuKPRCvC6jG/qrU9oE8AFW/Yo+rYuexlMW1AJDIw6znAYRRxi9NRuyxupj+RMDIB9iqE1zC7+NSSuYXRTBqLCRtP8DwhQfpHU2SQLnuhIANle1JnBoZ8NKT8+6a9hLBBzlzDMzujhxkGMDQViaGJqrC3Ukz4A2es3uMzqkVeM4TM6GhzRBjDmhzIlz6XeGpQUTBrxXINFlmI+rkrtw5jvYt1qPs7ziWFk4urS8qKF7wvsjhEzr0l4OGNT1odAPwS9KmPUrZMLnhoeWhCNApeFR56oVs6mCsFJe+5KX9Avv1b7khSjJJIDKDtFzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgH2xJeSsSgpLl0lqn3J3ovsgXCQ+hTdfCJt26DtO5A=;
 b=PBhjPabCIu8AU6U0p5aPbriavHWFW6fTTpP8c3mHsQ/+o/D2VJJro4k4/ZVv9Hqy+z9EP0xKfMjHYUnFNkwBMpynRfQdrMPUa9WxN3vEph2vxtbTRe4lv0ZQoEa165HPcEP4of8va2HJDNYs6zPEkup60CxyPTQy+9f2bN9ZUB9mmdnlg33SQ5hxpr7ZXGiWfE4r5MWKsKEQWEogOYHni2v3BgpoXypUWvlW67mvvyMQNRhGA0VYbsnI2d7jW0TwvV4sgURF6Vo/H5ep4/7RxbMsGupWvEhXnTuacFxSi22A8PAykezXFRlZePvDQTyaxzsDHNPTJXVJrS5lHFmXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgH2xJeSsSgpLl0lqn3J3ovsgXCQ+hTdfCJt26DtO5A=;
 b=H58We52+K61YR+w8q1WlvemS5PCSgP8QGcNuPdxusVV8gpQ5CzKmCxoWgvhIACJ7NLNevx7Z9Q3qZcLp6u23VGyg5encxKHwLVwBtcdKqr9L8uk0U2Tarp51AgZ9/FE9I19Qx2t78o4S2yAeOZpNQR695zfkWMB/b7ZXdl0u8t8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8395.namprd10.prod.outlook.com (2603:10b6:208:57f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sat, 17 Jan
 2026 02:06:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Sat, 17 Jan 2026
 02:06:18 +0000
Message-ID: <c46a502a-bb1b-b85f-091d-9dd7814d7ad5@oracle.com>
Date: Fri, 16 Jan 2026 21:06:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: expected results files should not be executable
 scripts
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev
References: <DS0PR10MB7522AE1AEEB271BE04A500FCC28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522AE1AEEB271BE04A500FCC28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 188772b7-0270-4b90-a1e0-08de556d004e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTNKTUQzTDlPUkM5MU1nMGZDRmd4OHlQR0ZlMzZRY2c3T0ZjSnNiclMxc2NM?=
 =?utf-8?B?QzNYcjdYdXB5Vlh3bDNnTTh5a0UyNTdKY3FrMThzUCt6dUlZcGdsTld3K3NW?=
 =?utf-8?B?NnVjTmI5Wm5BbGkzMXZRVFVVUk1aOXFRaE5JZ2lYNEZBSTVUbm5FMHM3YThF?=
 =?utf-8?B?NVM2aVl0Y0RNdUtJY21uOFZDTU1sTGFlazRPVlBXcjNuU2lCNkI4Z1ZNR0hy?=
 =?utf-8?B?NFBXbDI2aWVnbUhld2JGRktaNFp2bWpwNjMwWUFvQVI1cE14TW1VTnVrUmNv?=
 =?utf-8?B?eU5TQW1YaFJqY2U1L05QV2F3VGtFd2pFdkRzWnk5Y1kzSmcyMXlnaXNYTlht?=
 =?utf-8?B?SkZkMkJHU3pwL0g2MTl6TVdvRTJzMEFHTHhzSmFZQTNUdk8rd1pxYVBkWnNT?=
 =?utf-8?B?cE8zOEFWaXZhSVptN1B0OXBBV01jbXFUN25MQUpEMXcrZjBPWjNXMWYrUkZO?=
 =?utf-8?B?bkpZcXhFNXIya0h5WVQvQUVqVVlSZTBnc0dqQXdod1BEUU5ydHp5b25LNnhh?=
 =?utf-8?B?K1VmUWE1SjdmUU9sTE9hdjYramNjcFk0Z2xDWXMydzBia1kwZHJiM0t3anM4?=
 =?utf-8?B?YnJYVWxBVXJYeU5Rekp1SWFVbEovWTNPMDY1VkdyYXl3RS9WbHVWSFB5Sncy?=
 =?utf-8?B?TW9sR1hkRG9TRUZZSEVPdjRpeWxxUjZyODlTVUxXMWZFbUxEeFlIUUprMEM2?=
 =?utf-8?B?NXVuS2xLQ045SWNnWEtQaG03cXo3N2dKVG5zd3psK0Q0ait2ZGxTb05tYUJ2?=
 =?utf-8?B?em5HRXR3U2Jha2JJZHA5QzQ0Z29YejZYWHMxeFJBRkFLMktLYWFUM0tjSkpp?=
 =?utf-8?B?dUJwZEdGS2prWlB1ZFJRSUhDUmRZQUVVNWd3MFZuT05nZkNuUDlIdmhjc0R6?=
 =?utf-8?B?M0pnV1E5Ny8yd1Uwb0o3VnRrMlg4OGhzdjFKZEl6ZTlkWitJaVVkSlV0Y0tH?=
 =?utf-8?B?bmxzSEZyMjVNN3BXTnk5U1dKU0x6aEZ5Q21DeExaT1hnejFvMDNHaCs4d3dN?=
 =?utf-8?B?T1o1M2l6a3kyQnlkV1N5QUVIbmd1cm1aN1Mxd21IZHVMallMZXdDc1Fob0NK?=
 =?utf-8?B?SGg3L2xpc2FmSWZkVjFZeEVqQlplbFltTkFjUzlObnNQWXczb2RsL1FST3RP?=
 =?utf-8?B?OWM1UHNKaVdlak44cWhsM0huZkRyRm5sUTYxTlBMb0RkaDdXOVhXUVNDMGQ0?=
 =?utf-8?B?bDVMaUNqcnlac3RnMDFDZ2Z2NnhoeDExTDdKOGdTdi9vN01Zb0ZleTNPL0Zi?=
 =?utf-8?B?MW0weUNKQWFwTE5Sa20vQjhLRVBQQWtXRmVBaDEvSWJpdVA5NVNKU05maVJo?=
 =?utf-8?B?aFhGRW4vL29NSExKT2UrUFQvKzB1dlc4Y201ZkZZb05oNVpFT0pYL0ZiSUE5?=
 =?utf-8?B?WHM2N1hnaUVuLzBSVVJrR2VaeWVVTnNKSThzWjFDOHQxekN0M2FLUC9wQ3lH?=
 =?utf-8?B?RlFDZGdnUkFzMUJNbWhLWkg5bUZFK1Vma2hnbnE0eS9KVDVkbDRGc2I2Ui85?=
 =?utf-8?B?c3RUQ1B2Zi9YUXJ0VkZZZ3luQkpwN0c5eUUzK3J5M0JocDVtb2VXeDVGRXBC?=
 =?utf-8?B?U0kzUDJ4amV6Y3NIbHdCVVFaMWlvWXh0TXBsby96M0JrUjVWaWxuOVROT3NH?=
 =?utf-8?B?aE1Xa01FNTlmWWM1aHdPdUV1N1dTdEtNWWdMblE1UjlCTlA0aXl4R3NZN0xB?=
 =?utf-8?B?RHVoVWpGMjAwK0J1TllXazg3ZlkwZHluZEc3V2lzSHJEVFV3Kzk1enBpRHB3?=
 =?utf-8?B?OU5vVWRXRHZ4M0NkYTgwVkd2bnplQ2RJL0hMd1RsQ2UxS2ZHa3Y1Wk5HaGVR?=
 =?utf-8?B?MjNYZzE0N25wbTRDS1FFNTRiT3FTVUhwNkNRTUxMS1FmbzBRZTltanVzSTFX?=
 =?utf-8?B?cVQyYU0wOWpRUm1KWTZpUWZMQ01SdzJ4Z2lXb3RVdmxXUmZXQksxallReTBQ?=
 =?utf-8?B?ODZ6Tm5wUlpqdFlVanAwZ1BXN01YVk83Y3ZSaEl2R2N6N05qZTB3MTM4OWxN?=
 =?utf-8?B?d0s4QWphcnpCY29kZTVuWkp6VnFKZ0hOdnFSNE1vU3o5eG85d1lnOGgzSVY4?=
 =?utf-8?B?Uk5lbk4vaTRsTTlGV2ZycU1yVjBzT0VjSU5PdHRmcFBPTGZJV0VNcnFRSHZr?=
 =?utf-8?Q?YVVRJUzNOU1vHrb10x09Malgz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cERsUEtuSDh4S1JKdDdLR0VxcmFIaUkyT04rbmJnejlveWFubzIyd2tIRDBq?=
 =?utf-8?B?V1RsM3pWbVhJSUtZV05CY1JZeFRnQzZpRm8yam5GdmUwUjkvNXNaYnpTY2JV?=
 =?utf-8?B?OUdUaDliWFhidVM0MWxrODNOV2kvMlVRd3R1cjUrOW5ITk10KzNwaTZFSEQ5?=
 =?utf-8?B?aTJsSEF3UWZCby9PMjQvY0lZUG9Ga1lzbFc3bDhDQjMzZXFFaUpEOURFN2R3?=
 =?utf-8?B?N0F0cTR5RjZia2dZd2JxdmFZRU1kY2VheW41ZTdaenR4TlIvaGttWWtrRGRu?=
 =?utf-8?B?VzZVZWk4YUpqVW1mZGFlbE0yQzBaRllldzhSOG1mb1NCSjhESnVyNUhGbEZO?=
 =?utf-8?B?OS9FdW1pZ2o1UFFzVWFhdlA1VmJ4RXdTaWoyUFhDRlpYc0g5UkFVM1NYeklT?=
 =?utf-8?B?bDZyQ0taZFkrNURJSkloaUhrY1l0dk81Qzl2WHl4Yk5iREFXK2NRbkJrZmNp?=
 =?utf-8?B?K1V1bTFrblhvMGNvSU1Tekp6ODlxM3pTV1RVRmtRRnlhRnRtdGlPcHZxNzh1?=
 =?utf-8?B?N25MbWNlWitDc0l0dHJqZDZ6RW5tNFhHZ2xraEhpV283enhmSC9GOENIZk9I?=
 =?utf-8?B?cWlLRjVLQ0VwNkN3eEdMNitLZ2JEYXA4cWRNUlZFUVd6Q2NvSjlFdUdOTXl5?=
 =?utf-8?B?THl1cXBRem1zOTQwWWdjZWZIWHR6aWNjWVdVNGltandYMnB1WVJld0tndDQx?=
 =?utf-8?B?WktGVTR6eWJPZGpvU0NVNmVXNG8rN1pJeExhZHBQR3N0b1VkWWg1NXBUcGsv?=
 =?utf-8?B?S1Z4TjhKVzluTXZwTFc4NEw4b0gyeEYvTDREWkJTNDBiREI4WFUzeWsvdm54?=
 =?utf-8?B?azZkb2VlZzUyZWNreExLR0JHNVU1bXBLRnIxMUhBYWhSdzVwWnpJMlpQcXhJ?=
 =?utf-8?B?N2drYVh2SzVlYmlwNFJTSW5aV2cwTnRRWmxrV1BGQ1p5QjdhaTRMekVjT3pU?=
 =?utf-8?B?WmlLc2ZDUkplMlMxNVVTOXIrVHNTMmVZL2dSN1cybzRzY1JrTlltdnI4TXkr?=
 =?utf-8?B?TGUxZ2JzQTdxRFRGVVVnbjY2SFBBckJWYzQxRHVEWWYvVWZSZ2puU0pSdnNj?=
 =?utf-8?B?WURNeHRUazRyVThod1IwSGtURWw2OG5GZzFaUis1dHB6QmJUaERLak5URmFR?=
 =?utf-8?B?TEY3Tmo3YnJ5a2EvQnVTamtWazFldGxyUEFKSnpEUzNENnJsbGZhTjNXajVh?=
 =?utf-8?B?MXpRTER3YkRjWHMxZVhvN2hhRVpIS1R0ampZd0d4UFNDamVZTTdScU5QTFlW?=
 =?utf-8?B?UHpIWXVmbHNxUnRJT0w5bUd5cG42MExWQk94eWZsRlBWZkYxZjRVeE9oaXZG?=
 =?utf-8?B?c2ZRWkVOUzYzYm1wd0NkODBuOXk2aFNCUDJjQ3pmTjdPTWw3WkpvWUo4aEht?=
 =?utf-8?B?VW9zSmc0bWlNd3FFZ1FzM01VcUcxZTBwNTM5QmZCa05sL3VWeGRFbHJkTUNV?=
 =?utf-8?B?OHFaOUkxa0VvNTBCZ3JBRDNWNE1Gb1lwL0l6Z0E4S3lwUS9KaHBwMVZhc2xK?=
 =?utf-8?B?MEJSZDhlVkRuN25jV2dZM2Z5UEhnMUJWaENBd1VjM0VjSHhzN1lkVFlzSlRO?=
 =?utf-8?B?Y0hyQ3ZEOXVRL1V6clhDZWpiT2piTUtrZmN6OFVjZ3VBakcyZ2pJNWZKSEpP?=
 =?utf-8?B?aDhqTFVYRlczcjZ3dGVQK2pSQlM0eGl6VUlESnQ3M3dyN0JVSWJzU0FzVkZY?=
 =?utf-8?B?b1NORHNTNTJtMDdHdlpYL2VqcHg1ZUM4cVFSU1FOaFF0YmlQc3RBQlR5RVBP?=
 =?utf-8?B?RzVIUURsR3JyeS83dVJ4YUhDQWZNaFRXb1kzU1Y1dXhnWTh0VDdSNWxMRFJ5?=
 =?utf-8?B?c1BwbHVZeDdrUWtzZEJQWFVaSkVlaUlDOEcrZnFhdkUyVWQwZ2FmamJFZnlZ?=
 =?utf-8?B?dnlJNnpkYXhGMXBRMzdPSERRb3Q1ZWNuZEI4VlA2cTl6NDh4VG1jaDZjZkJU?=
 =?utf-8?B?akpBMWE2YTMweGJUZDhpVTdHOTdBV3UzdjRKekxIalB1cGYvVVREUW0zU28z?=
 =?utf-8?B?M0VWOFF1cEFIZU8wQXZ1UkNzL3dIN0w1MzB0UE9nR0JYcndLRXdrMTgxV1Vq?=
 =?utf-8?B?Z005RFV4VHZpTzVLWHNIZkxnRktMN2pvSU1zb3g2VU1ZUDZObDAxaUtTcEZD?=
 =?utf-8?B?RWw2ei9WV0dDMmE3RFVJTjhLRjl5eGlWUTFpWU5aQXNuZlNKTzFNdldzMkU1?=
 =?utf-8?B?V0grblVyc3I5ZjhzTU1BVFpvcnhmZ1Q5K1RsT1k2bmhqdDIvUHp0QVhHMm1V?=
 =?utf-8?B?bWswN1plbzdkOHVYczduUFVseUdXNis2L2Z5bmZ3QTRiUXk2RDFCWG0zUEFL?=
 =?utf-8?B?b2J1dnRhUnFzcGJHL2N6dGtaQlZZc3RWN2dUa25RUEV6bnQ1SWRvdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hecknw8NUxo/6/wH7N3ik2iRKsgOb2ICiGpoClydVjleAjj7eNiFF9dfNOECylQVaYbvWCurBHazIga2K0AQBBmkJQUg9M1/7hFn8dmH/IOV19kmR2EhdiT6hbHJUpWv9W+EeXzB7pagfOMYO2y2gA95dLN2Yc3mYziLJRmGOa6QcCqS1WCm2YZ/84lVtLHiF/fSPTGAoMoCktQK5HM5vg58Kdnhg2Y7FbDWcQrVEkCxFXtMasqWNcZ/8ZGn7mrmzNiU1GqAz/xk4f8PqrylUSbnPrxuV3yPSxKgPW0zFhnXG5LI+VjdbrTNkhLSgzkbHRACF34mNcO6FXqMApQheyRQFTDPLWC/y7/rWqTxTmjk/Sapa8As6yDHjfsmbzAMrAScFkUt8H/LCnEnyKvWMRceOKeTQK+RaHUd7j9ecAokpRhBgMAqqf17sqf2DQj5pbHLTTXKRpIUsDSbvszBClvM7zkkn4wRf5/osvOgyt9UtjFvPRQUUaY47gbxhsTpGNsZmnycr2fL/aAhg/f8bBSG1wFfKeLxxEdVIHdFWJTLgVeimFL7ne0pzMwU5QI1lDtD4CDmF0d2N1+sKg9hcH08GlKklKSlLDdLsfaiHPY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188772b7-0270-4b90-a1e0-08de556d004e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 02:06:18.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfY95sKmhP8Y3CGcigSnpI/3rT7O3Kcb/G4g5xqnhx8Y9+U0/WImie6dxqepXE+bMy4Kqmu0zRRzV460/imflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8395
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601170015
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696aee9d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=U0PA-RqbzzM480S5-xYA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12109
X-Proofpoint-GUID: F0VP7fuUl_uVfn0-5WpUe4zkFywjuGOu
X-Proofpoint-ORIG-GUID: F0VP7fuUl_uVfn0-5WpUe4zkFywjuGOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDAxNiBTYWx0ZWRfX05cvRXXxrd0f
 8AdMP9eR4ibtk48d/DLMxQ/zbGbpuIF/Slv+JhzE21TaZ2J6ZldKzMk3vmIRNOMMVJ9GasfZF0I
 LysrzniCO+a3xYQD7X/R3W3VRVNrNjy+lvk93VphHLsx7SLzKynDnmmjNlC0mcbkcgri2foiyO2
 Y//sa3dGDWZ8TKUCuk/C1wNRIwPR73RjaZbR1UyLwpi8WAPIWXH91C+LVFsM1dK1oC+UnoPyU+q
 M6tJCjVKTX+9OYF+RHz17eKuZNWXelHJPXxbiTFPT0nN//QaZkGow8+S5t8e45Ax6hmcNzzIwRv
 U+ji2esQSeDULlnT43c2vhFKULgPGMRvkGq2Y9m2gec+ZHAmnu3XUh33xD4hKKJN9pUjOX13SXj
 j+J6MBpSt+RMZjqWafF5yMCVchKfNV2MMSsWAyGv61UuHN1HGfArx9p+JYNKLdMHnJV24tjxE8f
 f1NUPhx5lOMii8qjuM/udCNhgU1jaWD/lsBu46cg=

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
Do tst.substr.d and tst.index.d need updated Copyright notices?

On 1/16/26 18:11, Kris Van Hees wrote:
> Tthese tests generated a bash or perl script as output, but given that
> the associated .r files are not meant ot be executable, do not emit a
> that looks like a script is not executable.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/funcs/substr/tst.substr.d | 2 +-
>   test/unittest/funcs/substr/tst.substr.r | 2 --
>   test/unittest/funcs/tst.basename.d      | 4 +---
>   test/unittest/funcs/tst.basename.r      | 2 --
>   test/unittest/funcs/tst.index.d         | 2 +-
>   test/unittest/funcs/tst.index.r         | 2 --
>   6 files changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/test/unittest/funcs/substr/tst.substr.d b/test/unittest/funcs/substr/tst.substr.d
> index 8da15c30..4dcef73b 100644
> --- a/test/unittest/funcs/substr/tst.substr.d
> +++ b/test/unittest/funcs/substr/tst.substr.d
> @@ -153,7 +153,7 @@ BEGIN
>   
>   	end = i;
>   	i = 0;
> -	printf("#!/usr/bin/perl\n\nBEGIN {\n");
> +	printf("BEGIN {\n");
>   
>   }
>   
> diff --git a/test/unittest/funcs/substr/tst.substr.r b/test/unittest/funcs/substr/tst.substr.r
> index 94d94e74..285b5c19 100644
> --- a/test/unittest/funcs/substr/tst.substr.r
> +++ b/test/unittest/funcs/substr/tst.substr.r
> @@ -1,5 +1,3 @@
> -#!/usr/bin/perl
> -
>   BEGIN {
>   	if (substr("foobarbazbop", 3) ne "barbazbop") {
>   		printf("perl => substr(\"foobarbazbop\", 3) = \"%s\"\n",
> diff --git a/test/unittest/funcs/tst.basename.d b/test/unittest/funcs/tst.basename.d
> index 86d80873..2b3d098a 100644
> --- a/test/unittest/funcs/tst.basename.d
> +++ b/test/unittest/funcs/tst.basename.d
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -38,8 +38,6 @@ BEGIN
>   
>   	end = i;
>   	i = 0;
> -
> -	printf("#!/bin/bash\n\n");
>   }
>   
>   syscall::ioctl:entry
> diff --git a/test/unittest/funcs/tst.basename.r b/test/unittest/funcs/tst.basename.r
> index 4f3aa0cc..fb68c543 100644
> --- a/test/unittest/funcs/tst.basename.r
> +++ b/test/unittest/funcs/tst.basename.r
> @@ -1,5 +1,3 @@
> -#!/bin/bash
> -
>   if [ `basename "/foo/bar/baz"` != "baz" ]; then
>   	echo "basename(\"/foo/bar/baz\") is \"baz\"; expected \"`basename "/foo/bar/baz"`"\"
>   fi
> diff --git a/test/unittest/funcs/tst.index.d b/test/unittest/funcs/tst.index.d
> index aab920eb..a918c386 100644
> --- a/test/unittest/funcs/tst.index.d
> +++ b/test/unittest/funcs/tst.index.d
> @@ -60,7 +60,7 @@ BEGIN
>   	i++;
>   
>   	end = j = k = 0;
> -	printf("#!/usr/bin/perl\n\nBEGIN {\n");
> +	printf("BEGIN {\n");
>   }
>   
>   tick-1ms
> diff --git a/test/unittest/funcs/tst.index.r b/test/unittest/funcs/tst.index.r
> index 40f360fe..4eaa081c 100644
> --- a/test/unittest/funcs/tst.index.r
> +++ b/test/unittest/funcs/tst.index.r
> @@ -1,5 +1,3 @@
> -#!/usr/bin/perl
> -
>   BEGIN {
>   	if (index("foobarbaz", "barbaz") != 3) {
>   		printf("perl => index(\"foobarbaz\", \"barbaz\") = %d\n",
