Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677DC30FF12
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277982; cv=fail; b=MSmjFvfqR4H8frdlo3r4PqbklzvJfhXapMCYutbKAV/tdEKa9Pgr6tepAQWi9GSB/1pET2IfII6B3l5gBdB7ICbDgPUwmPz43sDPeEq24AkuhlJE7WWcWGfDxZ/GPo/YbWwmhQO7ZTmhL2R57rV9n634FX20Z67+be1zgKqdpfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277982; c=relaxed/simple;
	bh=w3u6pcifuv4I29rtrymVLgDb4st7DCDaVgPp8R8KBnA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nlP8SfEzPY9fbyfVw7hQqg2jE0NiaVXKnNWBYNBAHSUM6cirB9Kv3+c/94fY+zuGGf4g7Vjd5nfzYCojqodStttAZ3gUkLJhsZC8mjSs8Ta6oJKemxYHQ0LJCMC9vJvfE3CjOQwEFtZjmuRnQr6Zk1hpnBYuJfA4wlJj7fEsGDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E2tc2nM3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NskYDrmV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E2tc2nM3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NskYDrmV"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDN4JX009183
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1s/Dx/Q+W8fETeiTNMlUlOejnX7w6RubBxFJtI+xKnA=; b=
	E2tc2nM3tJ9bkcAYB26cKneVfXOb2R4sywfw6VhdAGZbqkKM68t4q+v3Fb276OjU
	9haHxM5gWQy/yNLj68xtzujphrh+LJ5xXETt6ZrOQxjVyTQJNR9M/rhn8K54hjNl
	VLV/GE1al/2W8+cohi20T8aSmYzz3ySKTEW1cYReW9QNIiApnA/9wVW3Wz65h8BB
	8K2o7UNB5p4zdre2aZxx2iBspdI6ifb699tRRl/cbTjeXp1/kX6qCe5k42XvrjgH
	yyJ3krzThF2ory+lihgy5jUueqL8Fvafp7lfwK0vAQy3QUyPyUqGAutmg8f7f30G
	lrIY1FCXbt+v2dXHxOhWdQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcfcfe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:12:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FFnvjO030183
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:12:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvse6v27-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 17:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALgtd54e0mKijVn6Dq2HBoh0pHSi/PEJ+YBrZJYWWgoYuvlARrVWVLJLK0R7q5V7mjUzNPwoOP7z4X5Qh+Exk8iAzIwf5Ly/wXFRcvsDGIZGg64f5rtgFqrJ8Snu2Rt1avAV0Lde1tHcvXIhKfF3LWDVepyBdR1d343g0nBbDy0gAu1c7xIc06YxexkMEuhMwCQ+U1PU3XpzKPGR6icGWwrIUc+aZ0Mg3OKs75jQGL3y/f73tGAxGzGrqxi51xa3mMgsVc3SZgRTF5ut6Wghjuj0eEmVvUwgb6R3/9XGP3eMS4ofGh1f33hCSr/wQdTRTAzngTykO3k4FVzqtS+Flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s/Dx/Q+W8fETeiTNMlUlOejnX7w6RubBxFJtI+xKnA=;
 b=Nvvu9OSNY1meMiZV+WbgT9WLeRahn98ZU3MDOI+wOKoTpp25lHrIn7JaQt2dEbZZCSykkr7MP4M99bKq1VHhHmP3Ii35gpGcGPjhGDwArKiaPioqpCbOIT2ruG6Dcr0b969qgp+88icfPXPTqkCOn0rnLb/kO5or6U5cQJ/LHvj9ls4zHN4Rd1sF+6SCKCrHoJGhh9Xn7oqX4xK7DbmPggavLVYhODhAqApu0ZPlPOM4jVZIjIqsEOAs4028X1ulIDp7XUbKJoaZ8tBgl+iWzwrt2eirlkJpJIu/lVKLow/3ESL1N+qYmuLahcqSajvy/G56/G9fMYuFuxvy9uRQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s/Dx/Q+W8fETeiTNMlUlOejnX7w6RubBxFJtI+xKnA=;
 b=NskYDrmVc++72r8TUJogXBpEv9a7fYsTmhbFJ3nvaUDkJXqSMzdXRm2C/XjbRrw7A3X7y/HKe7v2CDCEZlk415zWvEqugOKgvh9bZGaAeaYDJA4yN0xfQOuDP6PAtKw/U5lOnUoMFaoB5VP9n1TkBzDG+SZ9Q/HSRN7OpGX7H+Q=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4559.namprd10.prod.outlook.com (2603:10b6:a03:2d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 17:12:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 17:12:54 +0000
Message-ID: <ec52d25f-c029-3afd-f03b-062f44b1bcb5@oracle.com>
Date: Fri, 15 Aug 2025 13:12:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] Possible uninitialized 'last' variable in
 usdt_copyin_data()
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250812224606.16606-1-eugene.loh@oracle.com>
 <aJ9ReKhdRvtPBhuC@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aJ9ReKhdRvtPBhuC@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e555066-b7bd-459e-da54-08dddc1ef93f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHhWQk10RkUvTVhHWmJpUHUwVFlwb2hVRjVBem1LdUd1R0dxaHVEcGM1bG5l?=
 =?utf-8?B?SnJwS1pCYjB4aFRjVGVXRUcxN1ZhN0pCZFpuQUJkTlFRb0w2THVhOTQ0Z2Ir?=
 =?utf-8?B?dWhpNWRQYzd6WGVKSUxrc28vVTBJUmNydkxnSzQ3ZEZkTXZaTWlpQVdFdUxm?=
 =?utf-8?B?dzRiZTUwcW54ejRoT0lUaXk3S1Q4SjdKY0hwZGlVZzBidDdSYS9IZTcwbzJa?=
 =?utf-8?B?czYzdDIxa3FMbGh2N2l2T0FrMWhtQitqQWNUY0pMZHdhTEZVNnJnWnhwSXhx?=
 =?utf-8?B?SXJ4L0RGSW5QcE1zbUdZanZEemxKRURtcEJXZ0w2QTNZY2tDa1AwVWs0eEtm?=
 =?utf-8?B?cXN6SENWaU5mU2VadHdnYVV5YjZBcmFXRkNmR0g2c1F5TnZQME1JWk0vWk82?=
 =?utf-8?B?a0R0T1JkaEF0ZjMzTkVFUDdXMVJCTkRwQ2hjUHIxK25YVm1VejV5by93YWNo?=
 =?utf-8?B?WVpacXdjS2w0cEtXalRTek9wN3AxYXBHOHo2YkJkd2R1aHZETU5JUFoxWkxL?=
 =?utf-8?B?NEIyRXlaNVZpRXdXTVFHb1JIazVtU3J3WGRYN3g2eWVjL0tmNGpCTnVJRE5F?=
 =?utf-8?B?M2VNQkU4ZkpnQ1lvRFNKZjdDeXhvMGc4N3YzQytvM3lYd3VnQmRMczR1VENI?=
 =?utf-8?B?NjJackFhN3ZqVEJ3bU5HbVZaRUkvNXFCTkdkMmY3NzB5aVVVYlFUemtINjRR?=
 =?utf-8?B?SHdabHdXQ1hqNXVnaldGSmYwTzFjV3N4eEQ0NTM2TGc2S1ZOUTQ4ak81MHY4?=
 =?utf-8?B?YTErUUtIOXAyazh6LzZuS2VZRHhHUm1yMFYwbFhQNEZJdHlYNE83S2gwSEhU?=
 =?utf-8?B?SjJTNmV1V3pXMUxpV1lsd3NGM0pXL3B4ZzJIc25ycTlyZ1RyV2FkMUxUK3ZI?=
 =?utf-8?B?TXpYbFFIWm5RbDhRQU90THBHYWU0dzJzdmFjTkUyNDQrRTBkN3FQRGJDUjk1?=
 =?utf-8?B?NC9XNzlnRms3Q2s0dmozZTRQc1kzeUlKUDZqSjRRSEpEREJYaFAzdyt2d1Zm?=
 =?utf-8?B?cUk5NUQ3NVc1M3ZyR0NqZUV2bWZLbzNweXZGTGhtNStUMHlsOFVNd2p0Z3lh?=
 =?utf-8?B?NExZWlI1WUQ1aDQ1OVppSUdxd3ROemgxMGIyVkVwMnk2UmRzcGRMbEV2WHF1?=
 =?utf-8?B?R0IvbkdvYm5xSURETlYraythV3lPMnNqb25CWDlZYlpORnZHZFhlYlhJd0tZ?=
 =?utf-8?B?cU9hcm4zb2pMVGhpUnlpTXRXTUVxUDAxZVM1NGRDMW5PWkxaZktaVVdwZ05z?=
 =?utf-8?B?SjllT3IzNXBUUk5WZDhncEJ4WlI1S3lpUnphZ25BaldZQ3N6U1ZxMG9nV2Zs?=
 =?utf-8?B?WWNTRkxwcnJpYTN6cXZsaDczK3VEaHk2S1A2NmhUczIvRFdzS0UydWJWOTBL?=
 =?utf-8?B?SXpCS1VIMlJqL01LMW00MWJGK2tmRGxzblE2ejVoemtmcHo2NGRFeVJwTDBh?=
 =?utf-8?B?T3BaY2IxVGd4Y1htZ3ViV2s2aEpnZzBOSFI2VFhOSjB3R2ZQU3hxUmw2RytU?=
 =?utf-8?B?L3prVjkrMlFLSFk5V3RtaC9WR0dUU09Ld0VxR2dIbWx2MVVmek11ckRza01S?=
 =?utf-8?B?SkIrdksrejZ0TmZuK2dPSDcxbWhwa0hwbWFwd3JCUjV2Und4L1Zrb2t5WmY1?=
 =?utf-8?B?dW5MbVBsWExLRHRSc0NrclFFZitqOHJLZzlaclBWSXc1V3JrN1VBS0d5d0lN?=
 =?utf-8?B?bnVJalNUeXlPdHp1cXMyZGszOS9WWlpxYVIrbU0ybmgrOWN3eDlQZ1FabWRL?=
 =?utf-8?B?YzlCckVyVmcrYU1RTk5TNjREZmlnWTNQTkx2SzNCcGxWMEZiN1hWaHhFNlFp?=
 =?utf-8?B?OW53eGZkWjIvRDVoZGRUMHEzNVQ1aElKb0Z1endQR3JWbjRKODVrM2ZrMEx2?=
 =?utf-8?B?Y3dBL2svWUkzZ3Z1RG95OUtlakgyK0VlUDVvRTgrdEU4YjdBK3BVWkdlY1E2?=
 =?utf-8?Q?A8ILYxvLNQo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUMvallZWDE4M25pMU1nMzJvZGc3UjlLSDhPSjZkTWJSemdKb2twL1RzNmRq?=
 =?utf-8?B?OWZHSWozL2tSNVRaanF0STRZbHVvZTU4dGhtaDY2cWptN3lrcU5TVUczRlVj?=
 =?utf-8?B?L0VsSS8xRm9JcHoxOWk5cXllT0VKWHY2RURvRzJGNTZBNHdMbWxLbHdvRW5H?=
 =?utf-8?B?Z3hoTU9FVjRpS2ljeU5YRVNBQThkaWkyUkJPWTlXT1k2djlUQXMxTUFaa1JE?=
 =?utf-8?B?emozZkYzV0J0dC83UGkvSlROeW5QR0VwbXE4VmZGSndKOHU1b1ZtTUJTRG5s?=
 =?utf-8?B?cGJFSG1ERkZuYVNWWTRwSFIxRTUzYWtUalc3OVRvbGtxOCs4SWlkRm9rM1pT?=
 =?utf-8?B?ZE0vanlIVEhSYkxFL1BDdElGd2NER0V4RmUzV1owRG1DbjBxL3k3b2x1aXVJ?=
 =?utf-8?B?NmgzTm9pVnVodzlhRTFsNUlWMDE1M3pPNGxGM2NqZzIycXhzU2FvRCsrMWhq?=
 =?utf-8?B?Ny9tTytVWm1HOEd6TGV2VEh6Z2wvc2xDWEdTVUV5TzZFclhHRTZxaEE0elNh?=
 =?utf-8?B?Q21Bd1RNUW9oZG5oZnJoVlZZSm9pYkxsaWR3Y2hEcXV0OGsxdklVaEwrcStr?=
 =?utf-8?B?dDZJMUZvMFdMK0ttc0VwWHAxZVh4Y0hkaDZWcnZjUEQ5R2RtUXZFQVJ1Zi8r?=
 =?utf-8?B?VFRWaEUrbWlXN0ZrTGozL3hxVUMvMjVVYTYwcUdCVnB3anc1TVJLYUlDdU1C?=
 =?utf-8?B?MmVlRmN3RXpKYldvZ1BualQrdkZwRnRVcmJmRHJxNmtFUnRPdHdKS3pPNEl1?=
 =?utf-8?B?RW5KQUtIdlphanFRMlZlUGZQMjhzUEN4NlpOd1lZTktBVXI1Zk91S1pVME5o?=
 =?utf-8?B?NzNtK3VPUUx4TXVQOUpkc3VDODZjaFVQZCs5NS9MbWwyVEplaG04aTYwRVFl?=
 =?utf-8?B?Qk11MUxta240WU40NTQrTms2Y1VubGtaRVUrM0o0a3JGdC9UUmxnc3l5MlRa?=
 =?utf-8?B?NzVuOFNSUjYxbytGS1VIM1RUK1Y3eVBVZjU4VDRqS2JUaEhKYm1zeWdvM2FN?=
 =?utf-8?B?b29XdlJ5cTZSbzEyYWxWTFRVV2pTSFNHMnl5RElBUHl2eHBNTUhHVlh1cEFV?=
 =?utf-8?B?L2pURlVhQlhBTkYxUS9yMmlrVFJGUnUvYXB6aDZWckF6RXh3TVRDbnZYbUg4?=
 =?utf-8?B?TmFiYkZRaGREYnJWUHF2SU9FZ2VERDZCN3pHc0dBYkpCOXp4dVM2ZEorYWVs?=
 =?utf-8?B?YVVVZ2tiOWxvTi9XMVludjVlRENJY2R6NXVGT0VmbHNCcWZGMGFJTjgvZkNl?=
 =?utf-8?B?QlhzN29rMWFDS0gzTG5keVZlbG5ic2VKbjdLdUVDQ0QzdXJaNzdPck5KeFZM?=
 =?utf-8?B?VkhZakEwNmVwTDdZVjgwSUxXMEd0Zjd4Z3NDdmZpcHAyc2JUbVI0aEc0SjJr?=
 =?utf-8?B?UzdiSzhFNjlsUUpFTVJ1Q3dIcDRhSzRjbU5kMFBWQS9kLy8vNjFXRTcrSnBy?=
 =?utf-8?B?TFZsdG1FczIwenRLRGoxNkNVZXBHaTliZVE1TlM2YUs0TkxmK3A1a3Nyd0du?=
 =?utf-8?B?Z0VBY0FXWU0yYXVncnZhUDZKWXF1T0llekYxbXNtb0lkeGlLZHp0Tjg0ZjBx?=
 =?utf-8?B?Y2k5cjlYblYrMWtHbzNvWGNXVm5ZeHhSamp0WVVlMG9maUlzWE1DRnQ4TnNm?=
 =?utf-8?B?dzhUQWZyK2p6ZnhBZUt2a3hDU1ZYQlJraVoxcGErY3pPVDMvakdCOFVQZGM0?=
 =?utf-8?B?VnBJSFMxNlJOZG5xTGs3Q3dnanU3MVdPclYyN295cmdLYXZQYW5HR2dMMm5u?=
 =?utf-8?B?bUhnQ2RCZmo3SkRIVjlEaHZ0WnZzYWNCdVYvbkxodjJ1eWJ3V04wTHJocXk0?=
 =?utf-8?B?U28reE1tNTFhbUZNNy9JaUpBYUlGeWZjdmtKWnlDUDhJTjJmUHplbldvVFJN?=
 =?utf-8?B?OFNhTktTQUpMSGJUK0phUGlxWHlXdXlCelJNN1B1bWVpeU1aTUR2dnBLclFj?=
 =?utf-8?B?LzAzYktCYXJnVW5qdHpmRmNuUExRYVdWMDgvZU85Y0syUHBBQ0s4MlY4N20w?=
 =?utf-8?B?a3N5dWZ2eS9yWnBsUUZ5ZFFLRXp5U1ZZc01TWVpEU1V6YXdNZTJMT1c1TXI3?=
 =?utf-8?B?MmpGeVVKOEVlKzE1QmZ5TmF3T25nUDMzcyt6NHRaV0xtbFh3dXVoNXpOd2Vn?=
 =?utf-8?Q?h2tvpxm7Lp+36I9Vm+yx4sECo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VFDGBxn7ZxIyLbvrSOmOW1zHUVITvgAuTQIkAWt71WSxiMEdqjgOTlTt8orwBtDcDlaVVZy0fZ/EC8v3k74hCeMquO5nvN+SiwXm/lOwHKD00MEQC07ZI4Bf6mNexJU03I6IrpOKDM1Ue6uSYjl41IkJcjUWq4U3s0bnPXjwdxEI4OJcS/WFJDbLi3Ik3fXD2jGS5+jW9x96DXtCJ9MeT7/Om9XcPsXa4/lAV3AYPIALqFB8Vf7RzjA8lid/0eznfrAIkNYWbQ1k+s9Lyi7ID5prS0kX47JlgVynnHbRe92ZE5MWgiAibU8CyVyk+7VIfCmmxqyYVrbgi+UDMbq4hcjD5LqdK2qKZuDzQ1oKFdx+uIzJY9Z7NvI3pFKPKybAluFrDnZgDh2QkIWUbZtpqzGlIfrpByk2FY3jDbS/5D2k7sAESgaH8i+elqB1b7o9wpUdOMy6PDQjjbEgUuJY7usPYyOyBZPOsWPlGqQuB7+CtK+uwgIFQ0UcM20ffYGavTpNNPIIsL3KepZd5GGbxt1ELdzpFu9aIbzZnojrRQNNLUgF+2wFyA4e7jFCGmW6QSKujUYw4/11+U2Ex2bQyXqT5NoA2llN9skrptgvVVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e555066-b7bd-459e-da54-08dddc1ef93f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 17:12:54.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrUBxibQbdtu8Xvv6dk8MO1BQWtiXSu59gOYY2bUJvP1nH6sH8jqtvcPJ6wRNveM1EJLQUB0qrHGFFEd+jDLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508150142
X-Proofpoint-GUID: sPk7GtyhkOnkcTQFQPln8Kv2i2aXAHws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDE0MSBTYWx0ZWRfX356Ht1TcrgCv
 r/k/1SEiksLyJVG1vqppTdtkN/i+/ZE/8psZcrUGkCih5FlbiHXekffidz99RfbVbCgp8hZtCqe
 H5DYWIfP15O7GIr0f3u7gJLtE4FzaZwCBEmDtHb+eTeigX+5NWvXiWA2/2kC9/SrzJLNoly0gvd
 Lz3JEnyTZ1mJJ8uf9BLNUx7lBM/SaiMUfSO0+VpBBPeC55YPDETaZhsx70geu0Jl9gkUOQq8lZX
 hXW3xo3aOGALHZxTNt5uRJNjlGh+nx/5Y+6/icvy3NGl8mMgKOdreEj+evrpl/fGzzbFuITIgoR
 2Z9bEmUiEREFa4XmPm6L94X8z3op+DvqtdvTveTvfDd9AtttKrVmUpAoFgZmgVyTZXW16Lf+Udq
 ZpaGN6mNRBlbzDVPpldD2j4ad12VzqHtLRpYDBZVf4+HTPr8oso7VAlVBwaPYEe6imuWT4NO
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689f6a9a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=yDtm9wB0O63eIcFZpVQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: sPk7GtyhkOnkcTQFQPln8Kv2i2aXAHws

On 8/15/25 11:25, Kris Van Hees wrote:

> On Tue, Aug 12, 2025 at 06:46:05PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Some compilers warn:
>>
>> libcommon/usdt_parser.c: In function ???usdt_copyin_data???:
>> libcommon/usdt_parser.c:191:15: warning:
>>     ???last??? may be used uninitialized in this function [-Wmaybe-uninitialized]
>>      last->next = blk;
>>      ~~~~~~~~~~~^~~~~
>>
>> Change the "if" check to make it easier for compilers to recognize
>> that "last" will be initialized (and non-NULL even!).
> I disagree...  What compiler version reported this as a warning?  The warning
> shows a limitation of the compiler to see that last can actually never be
> used uninitialized.

OL8 with "yum update" then "make".  Looks like
gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-26.0.1)
Should I be using a different recipe?

At least in my opinion, the new code with this patch is simply cleaner.

> I don't think we should make changes like these to accomodate compielrs that
> are less advanced.  We generally expect systems to be updated to the most
> recent version of packages so that would include the compiler.
>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libcommon/usdt_parser.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
>> index 864198098..d8cb9b7ba 100644
>> --- a/libcommon/usdt_parser.c
>> +++ b/libcommon/usdt_parser.c
>> @@ -163,7 +163,7 @@ usdt_destroy_data(usdt_data_t *data)
>>   usdt_data_t *
>>   usdt_copyin_data(int in, int out, int *ok)
>>   {
>> -	usdt_data_t *first = NULL, *last;
>> +	usdt_data_t *first = NULL, *last = NULL;
>>   	size_t cnt;
>>   
>>   	*ok = 1;
>> @@ -185,7 +185,7 @@ usdt_copyin_data(int in, int out, int *ok)
>>   		if ((blk = usdt_copyin_block(in, out, ok)) == NULL)
>>   			goto err;
>>   
>> -		if (first == NULL)
>> +		if (last == NULL)
>>   			first = last = blk;
>>   		else {
>>   			last->next = blk;
>> -- 
>> 2.47.3
>>
