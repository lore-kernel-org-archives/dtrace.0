Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C6315794
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758562773; cv=fail; b=LYm/+XVw/tA5DD+0wgwiP5eHDTY+sidiEHyett9WOyPN4/CNhiS6PuUNyV+kFz/KQTjaYV6oj1Zg8DspfHnz/ykWxXXXylAuZf2INkzhvJFX8Zn+6wVaRtAecuQf7p6eS2TvuPKZ2vCGV+F/uG0beiOntGhf4Mbjib/z0u9wlTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758562773; c=relaxed/simple;
	bh=QVAqscIPZiaMdvuVBDCGLv7gwKV/VZr6WdPZBWoKoz4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DfzxYW4qer+E35PsIDPLr0vTCRq6PEz+ibiVUCqEDN0bCQ4+GxsmMG9h5KKyZFlrrrkMEzeydDgD5wHBY8Dv/g5gCn1qwvUQknY6LuNeb3eHCdHkbboV8hcwfjon+VtjfuHvLdcsIoltnwT0W0BhqVq3sDZMajU8e2Mr3nQU6Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q/toXb+0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZJWvtCgX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q/toXb+0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZJWvtCgX"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHNEii027594
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 17:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gqnVOwsyBlZugVNRX8f85bfQeKDp8dGdDyyOXm8Va5U=; b=
	q/toXb+0wvwalpsqYNnq97ksr725mnn/LgDV+D+slzunzW9ENczmmUHaxaA+7x9g
	iYedqWSB2+fdQW1S5/LXBsFLgcd3/ItLG4UZKLgqFJ3FfKBwlbzLNfaZWFdiCsuq
	Gvkhwx+J271L4SXY21iEUj0/BTQ7ilm61H8BzaDUyIBSfoMuZ9WAIa5RnYW2puml
	h1wBVRpmtm03Resxj3JRKMf325QBMaE0dioCL6EzrBZxAdaa6mgUS1ZPy7ovtSJM
	H8ZXFbdSfA1OVpgzWBMVD9RQJvy3f7WDLtqnCHnWbogahfMGDqF9NSIajPYSMq72
	DIxRZTCdjvNnwclZ4q8MEg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499k6au0h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 17:39:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGGCnI034416
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 17:39:29 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49a6nhk77v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 17:39:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8JNdTEjzX8/TNnJCcTy8CrLGH1rR81YQD2o1hoT/1WSjdOZBhPqZ5UDA3V0lPD/2ZL3uya2MYtkMAdb22F7gf86dJLMaR9g1PAGoc5dRxzRuY85Cs2SHpUDdjAjBTc/CfZS6QWdz/Ed1rutYTVZaB6Oe60J+Iyrpp+oKk3mV3LHaSSTd46xuHmdoVM8Ngvh9vlJUCww0P1OwZX+7UUU+NRWhqyXDR8WWuoDInb5EKZaFZyS6cowMsp3PXEKyHxKd3MbD8W3suHav3KKX1mbkkAE25rzKiWE9YOXImbV9+vqMA4nzgk2bvNYrJabAZrbe5ufsq3Rqx5Slf8xK/cthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqnVOwsyBlZugVNRX8f85bfQeKDp8dGdDyyOXm8Va5U=;
 b=dU84hHY7L8VLlhOpDvdeeGXjTCpaHiBguQDKtqstwutXKkqg3B2rTRMQv6rNcZ2MNByOyL4UgzKFEpjzvw9obCfZMJWB9WoAkDU7CtddSEEoWJG7w27nJQPYe5tLLeCJ6hVE/9roLKFHfaocFJyh3ZkSnBhiadazkyswAsSGZ/fyZHa+/NorrXU0w7snCDpQPIMUj0CQ4nifQirz6bXHTl9hmymHTrNLKn+JbmlBKuETvwYrHlrvoRRU9ZHDmBEi3WQuDG3VWOdguffERDbaxQ1CjBiq/bUxFgTINn2kF9MWFAXt1FJKoToLiE75kOXKU9muG0oR87A4QVn2hNwN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqnVOwsyBlZugVNRX8f85bfQeKDp8dGdDyyOXm8Va5U=;
 b=ZJWvtCgX0sWaJJiSiH0ppXHx4LQPxF6ijJGDeleR19u8XbNA8+neVfkkmqWcEzBvutX7VoHSo9gl7eCHWZ7ajYCC3YBzLR8j2XdQAqdKJ/DNVPdRqAT8drYz9VCGMxxmWf9XMWtT77zNzeXIVISNITrexhCr1lXFJpA9WiRwpC8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH4PR10MB8004.namprd10.prod.outlook.com (2603:10b6:610:242::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 17:39:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 17:39:19 +0000
Message-ID: <12649754-22d7-09d6-6e21-6807ce30d30f@oracle.com>
Date: Mon, 22 Sep 2025 13:39:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] WIP doc: Add IP provider documentation
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250918195922.2155-1-eugene.loh@oracle.com>
 <a24c2629-173c-4357-b643-342ecc21a212@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <a24c2629-173c-4357-b643-342ecc21a212@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH4PR10MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ba8812-c1fd-48d3-de4f-08ddf9fef52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjJ6dzlGeHpxMzE0dG02aWtxNnZheUs2NU9NY0JwRzdqeVJCRm41MEJSb1Vy?=
 =?utf-8?B?Tjg3TDNJNHpveU12b3F0S1VqWXVkSXVBeks4TC9DWWJCcDF6aUF1MTJPSklZ?=
 =?utf-8?B?Q1AvWllMUHc4SzdVMTFPZXpMUlhQR1BUVGh0YXVCbjZTaktaN0lodG8zZllZ?=
 =?utf-8?B?aUV5cnlCQlRuT0ZvS25CSmlrYjZGbTZQVkJLZlpKbGs1WDNUb0JqdEdZQmpS?=
 =?utf-8?B?MzA1a2RMZ0hEY003dmh4bFl4S21VY3ZHM0NrR1RNUnVSbG5TaWMvMmFSMmJW?=
 =?utf-8?B?V3RYNk9UNnNlQnFFL0d1M3htaXptbHhjSmt5MlIyUVNrakwxMzJEeDFib010?=
 =?utf-8?B?TXdOQTczT1h5ZWthU3dRN1I3Smh3VVRXYnJEMGxzZlAyYTFvbWdyS3N1MWJT?=
 =?utf-8?B?dEY2UnczeHVpY2M3YWdYWjJXUkdHUGhsdlFOdGdMVXdaajMranJYSnNTZFZC?=
 =?utf-8?B?SVV6Wk1Dc09JLzhGVUFDOXR5MmowOUV2RWUrY3luVVA1cUVwT1p5dWtkTDkz?=
 =?utf-8?B?WjNqQ2ZEb3JTUVZUL1o1WGlQWnNhM05yMSthUFloQmNVSHorQy9XTmc5NGNR?=
 =?utf-8?B?NFcxTFY3bUJxWjdMVFJ2OHVrY09YR1J6SHpaQzhVQVZDSjFqaFl3VWZaVHpk?=
 =?utf-8?B?UXZwRHkyeHovbks5WXhmbWgwQXNGMXRBNXRncWlNcHMwSDlHY0R1dEd1S3Ju?=
 =?utf-8?B?aW4ySnFuSFZ2WDE4WUs5S3JNS2FZRDhmVWYxdmdDM0NXNXR6aEtTUjlUb1dD?=
 =?utf-8?B?bU5zSGhaYk84RThlOFFpenhHNmVpQjE0cWlVbkNsdDRxWUxLYWEwekcwSnZE?=
 =?utf-8?B?Qmt0Mnd3RVZoWjFqNU84cS9nemhvL2lVZ0JWNjc4NWRHRzN5dUY4RnJoUmJh?=
 =?utf-8?B?MllBSnFJTWk0bnl0Y2NqYTlPS3pFL0ZXeVMwWGtJRzFJSURMMjNWc1h4LzlV?=
 =?utf-8?B?cUNlWFlPL1Z4VzlPdzZMQ0RGcFBHL0VzTFRDUHVTZkVoalQwU3lTVzF5MjIy?=
 =?utf-8?B?N2ZhSnJhOGxwd1NiWUNkeXpWazVYTDJJVlRhcTNic2gwUUVNcStINC9ZSGFZ?=
 =?utf-8?B?U2hKVkUwK3h5aDh1N3plUS84ZmUvSDJtN1h0enZXR25CU1F6QmpKd2J2TEV0?=
 =?utf-8?B?eXdJb09FcDhpWWNJWEZIVU5GSE8yYzhWcmVKNG93T1NVd2hZeS9FUytHc1RP?=
 =?utf-8?B?WFJaWTZNN0w3Z29iWGJzUmRrTWZnQnV6NVYzRHpkUGx4OTlMMm85Q25XT282?=
 =?utf-8?B?bjlSOTlpdEFyT3F1eGZYWmJqSWMwb3NwcWN5YndMbmREcmJid21aSnIvSUtP?=
 =?utf-8?B?QTNYMzRoTnU3WUovL2pDbFU2bWh0WUpBU2hHRmVOVjlzNlNGL1F5VmFuQkNi?=
 =?utf-8?B?dXFQeEkwejVNRi9KdVk2QmNmbGN1UGtXeStCdThvZmVXdE5LVFNDb0ZPUnhZ?=
 =?utf-8?B?Yml5RWgvNVFRQk03OGpKSUhzZ1FUZ2pGVGlTc1NGTXZ6a2lxZlFCbittZDRz?=
 =?utf-8?B?UWY3Uk5pcityRUM2bUhXc2ExZW9FbjR3cERKV3JHSm4wL3BmU2NSbGp0WDJZ?=
 =?utf-8?B?aVN4VHFtamc5QUdKZmd6WFBDVHlGRXd4YkxyN1VmWFhvcWdyNlV1WXRBK055?=
 =?utf-8?B?dVJ6S2FPV0xFWkJ6SXMvQkJIcUV2bGdVWkNrRHh1ZTVTYThGUTdQN2NJSXht?=
 =?utf-8?B?WHBNZStMRzFrYnJKT1FWSEhINWtYWUxUWTdqdUw1eFhVeTk1MW1UUEtFbnl3?=
 =?utf-8?B?eXZUUFZQNGI5S1dIYktHUTdZVExtRXRGL0lTV21NSlpSN29Yd28xRGNjY0p0?=
 =?utf-8?B?TjVSQ01GZUlVWWVVM0hpN2JyNDFlOGV0TjNXUEw5NWJmU1lJbHZQTWlQTGlB?=
 =?utf-8?B?MHR4QUJyNkJQaDIraVJzRTZ6STJFRnlQbjJyaVBHRUdORVVxdUNjS3ZGY0tv?=
 =?utf-8?Q?0Zt2mvvrgKA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nmo1aW5DbEh5QUZ2WGdER2ZoQVAvcXp5SmNJOFlHSGdKRWFwbmxJaGFOSjho?=
 =?utf-8?B?SzExbFNabDZNekF4a2FjQ2RONWF5RXBWSnZEVDJsM2J5V1V0NmcwMGhIM1Ra?=
 =?utf-8?B?dmNuYVhOeXhZM1NvbENQUnlPcHNZNjU5VHNtVHB6UXdhRy9sc3VqVEVSRW1W?=
 =?utf-8?B?c1R4eUZlQjgwdlk4bmpORCtTZ1lGWjBPMldCakV4a2c3TDFuWlgveXNMUUZn?=
 =?utf-8?B?bWFBMnZWZmt6SHFCeG9wRnFSTWtHaWVNOCtYeXI5a1RkMHdNQlhzTXozWFFy?=
 =?utf-8?B?SnNjVVlic3lhbUYwNlhrZTJ6YjMzOEQ5R2VlNTlXS2E2TVhTOXZndlFXOVhH?=
 =?utf-8?B?a0lWVWdXcFV1RjZpMjJDTnJkYzZBSlRTak91d3VOM2VVTFZNcFgvMmlibm5j?=
 =?utf-8?B?K0w5Y1h0OUtadFNXS1RnaEwvd1dsSEw1Wm1rVzJJaVUvT2dxck45eXJFZXA0?=
 =?utf-8?B?cFhrNmhGTWl3dGsxY0ZiR0djMDdxdUpkcHB6aEZjcURaWC9mYXp0RFJZRUEz?=
 =?utf-8?B?QWluWEFFajBYR1VOL01yb3pOa3l3aFlLWkZ1MUhvVmdaVCsvT0d4Uk9pL2s3?=
 =?utf-8?B?M09Cektia2tFcWMwU2g1bTl4anJkcTlXUHJaQW9kS1hkTHNMTUFmNVBaV2hV?=
 =?utf-8?B?Vjd4ald1MFk3eGp0dXVVTURRN2wybW9tQkVlN1FPM3FPSXlVbUZQTlhmeHQx?=
 =?utf-8?B?bW8rWGNBeXU0LzFmNTZWMndTN0VqR2g4ai9xL3oyajBWTVJ2UWRqU3ZjSVl2?=
 =?utf-8?B?V1ZKczEyZTlRNytwV0M3S3kzSVFVZS9qUEgwVm9wU21LY1B6OC9UV3ZjUVoz?=
 =?utf-8?B?ZkUvRG5zMXR1UmJCcWFVL1VkNi8wS2lucjhibXJWeTNaaDZsMVU1MlZicjBQ?=
 =?utf-8?B?YmZFMktwaUw5NzZOVWpGS2Q1dFdkY3lRYWcydURuTUdNMUZzcWRmSjlkZTRW?=
 =?utf-8?B?S24rVFppQlFqa3RkNzQxa1ozZ1VrSTl2ZFRZMGtRQ1lOMUpDSWp0MUZhNHRG?=
 =?utf-8?B?ODkyd3BxZWZJR3hxanc1ZE9CeUsrTlh3YkJOdXFENTZzenFzYXFkRGRHTGV2?=
 =?utf-8?B?RXhwUzB2TkZkQUVHWm5JWXVDSi9FNUtDNlEyTHIxRVIzL244QW1RSlRYNnFv?=
 =?utf-8?B?cUpjd3VkdnF4K2Y1YndkZURnZ1Nxb1NGM3llSDJTczJGMVpqTnk3TVRBNWVl?=
 =?utf-8?B?TVZ0aEZGNmRyOEJHbG54VENnVHRBVi9KVEpadjhaamdoUEQxbHI4UGdtRkJB?=
 =?utf-8?B?T2cxUGRzSVVwVVVZVWJyTHFtSHhreHdwWnlTRFpFWFI0b0hhbWpqczhZMnVE?=
 =?utf-8?B?Wk9JRGV0U2xnTTJiSVNxS01kQUgyVFlqUW1SZDZBVGtTSjBZcURmeCs4ako0?=
 =?utf-8?B?bjVRTWxCc09tbUpRVjFYblVOR0dYVHRKU2FWWWM1amVKbStnVXZYVU9TcUFw?=
 =?utf-8?B?V3VucDB2a01UVmFXMTBXUDZqQkhzRE9abGFTMDBmcmJTQ0E5TEc2bW16M3A3?=
 =?utf-8?B?MWlVRHh4T2VRWnlmUmRMcXBpWnUyQStFaWhVdmtLekpRNlJkcUFKa3lvU1ZS?=
 =?utf-8?B?bmVYejdvbFNnNWM5QU8rQ294ajdCNzZZVEltMkQrUWNzd0Y3U0tOZ09NOXhF?=
 =?utf-8?B?NkNBKzYveXZvM2JpUzB5TXY0c0Z4UGIrcjZYSEZ3bjZxdnl6azlkcWVyWnpw?=
 =?utf-8?B?VmVQQ09IQU8wZERiUHk2OTlWODJCN2pmVmRicjJ6SXRGUUkydjI4Qzc3M0d4?=
 =?utf-8?B?cmdzamFzSkV6TGxqTVlwa0hBQnFWTzR1cFRjNlFhd1E4K014NHordkVNbHJN?=
 =?utf-8?B?dUpMdmM3U1Fya2pQbHh0TGlCZFc0b08wUlFaY0JIaDF0NWI1eHUrWXhoRE5B?=
 =?utf-8?B?ajVSUGZsTzZpS0Z0bmNXUmZBVlk5RXVRNGdRTTAxb3l5dXYvbndHTitZK1d2?=
 =?utf-8?B?SU9ib084MmQ3VzBhbHNmWFpqZVN0L2hWS00vbE1tNzczSnlJQmkvdlJwTFc2?=
 =?utf-8?B?S0tnY2Nkc0xmOEdNeFRvTEZPbE5BUTBWcDNaY3BlUWNvdzNUTEcvSWx4QVgw?=
 =?utf-8?B?ODJMNzJ0cVdyWnUyOE4vTlY1eWg0VnNFem45VEt2WWlFOUhPd2ZYdVg4aTU1?=
 =?utf-8?Q?gvNDCG9639SL6iHLU+z+NaG+t?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6D/dD2mPrhPBTyW5nLfWmxfAk7mtpM8HXblahWtG8PT7M60Tx+zcWRnKtW6Riiyo7N89IMjdUK33NE6BJhGrGdwKqjiZOn7rLkbj22H9bmbxBWw22Hz5v7rXkbXRzZSm8XeBBTPlkVbxYRrhidAyyJspSo0gM7mR6z9EJXSfWkMLFZfwMkXdmAHpLb5l4efqZ/stXOsT8f5P+YzS6VszGPIw89n27fbEMhRrNICxnzx2rB9eHvJx3MCs6CgGEq6ufSFhIXbSjbWi5eFlw9ONzB/0cG+tde1Qog9Qouv7l2SibgJWC/k52y2yKgSfIACudHtftvL1ly/zHXnyqRiGvxat7xS1/khprvIw9op8e5wXf6v/jzNrE5JaFv6ULTMA3eEMyLmke64Bss+TtwwcpELqibFJYYenp6/5g6U+jhjUJfRtfDJS/hiXQRS5Yvy8vh350UHB0Ts4s92dFUFfm+p+zu4C/kMKvp4Hmaz6SkfE8n/FCzG9QJjotj/EtPFEWdh71EWSgwPVOrxaQwP4FiepAtDhOhSMR17iWJr3VsgyzCUF+RqAp8MmC1CtsDMp7eqeY7tpZpXOnkubnLmSbdeBs1gHp2R2ad7mUMgTXfI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ba8812-c1fd-48d3-de4f-08ddf9fef52f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 17:39:19.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rH8eG/VHZ2bknoOQJg7Vk6yvtFgn+H+paglIWi9byb5NnEcFqc2IjXCBHvhUX9w3j//vNV4IXnYQH7Bgzqaz0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509220173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNyBTYWx0ZWRfX43vzhG7yXvae
 oyAHyNenw7WTjzdZeV8tGmIObcO345Cjd9PHW7QMsD83AJHgnW1nEri2rvABwz+GqQGsmr2uQpd
 WKy4eB7EavAEdKSd1eQp0vVSy8/kBqehVzlcE5tTng/4+cIsxAvQPVF15VPLvEotC5W9bgajGu+
 uGdFjNBvdr7CXep6z6j628Rbjz/YWexx/Y2G2cicVqGzq9WiOKCFSm752dl+hIMmdXqMCIBOwXZ
 BocP5eC/GhMeXmDlx/SfI5Ollwi/iSfQLTx2oXd/jIbUBq9H/2zfHsykCSNpO5K/c/q44zkxb6H
 XNbVCZsGtr3yk/KULOxVOLJ0+quPdaQheePjkFEJslM5Ua0lz9FQOcqlRsmljpIJIBjbr4qhfzw
 nQMnvEnXPAixvpsoXznlM9XoaODTdA==
X-Proofpoint-GUID: LSDaGpnivSXan52V4rYRx5bYiq-Tjayd
X-Authority-Analysis: v=2.4 cv=E47Npbdl c=1 sm=1 tr=0 ts=68d189d2 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Hes3MtMJmzVAa33lFXkA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13614
X-Proofpoint-ORIG-GUID: LSDaGpnivSXan52V4rYRx5bYiq-Tjayd

On 9/22/25 09:48, Alan Maguire wrote:

> On 18/09/2025 20:59, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> I'm starting to add some provider documentation to the MD user guide:
>> ip, tcp, udp, and rawfbt.  This is my first cut at editing the MD UG
>> and I'm pretty unfamiliar with the ip provider (and tcp and udp).
>> So if you want to offer preliminary feedback, feel free.  Otherwise,
>> I'll do those providers and then go back and look the whole thing over
>> more carefully before posting for review.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> looks great! (one comment below about csinfo_t)
>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
>
>> diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
>> new file mode 100644
>> +### csinfo\_t {#dt_ref_ipcs_prov}
>> +
>> +The `csinfo_t` structure is an abstraction that describes connection state.
>> +Detailed information about this data structure can be found in
>> +`/usr/lib64/dtrace/*version*/ip.d` or
>> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
>> +The definition of `csinfo_t` is as follows:
>> +
>> +```nocopybutton
>> +typedef struct csinfo {
>> +	uintptr_t	cs_addr;
>> +	uint64_t	cs_cid;                    IS THIS SET?
> IIRC on Solaris it was basically just the pointer to the socket, which
> isn't really a great idea as a unique identifier as the socket pointers
> get recycled via slab allocation. We don't seem to have the field in the
> Linux csinfo judging by the content of ip.d.

I'm thinking there are two different issues.

Judging from ip.d, it seems that we do not set cs_cid.

Judging from net.d, it seems that we do have the field in csinfo.

>> +} csinfo_t;
>> +```
