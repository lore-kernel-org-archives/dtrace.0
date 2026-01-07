Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B7420ED
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 01:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767748822; cv=fail; b=ter7qMCLOoOAFjZ1X2RUmYkCmkoJQa03DV/Olq42d8wlpAps589dyTY1tcBlpZ1CNNkKDokCB7euqANRzHq9H/8gbuReRjGy2Z61Tt69ivfsoWd3Woy/t60MafAMyUBnR7pOLfVEpX3U3WD1iilMjXRPdq87M9vAs9VDT5NoWmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767748822; c=relaxed/simple;
	bh=fHH4oW6lltAe8xK0jD2Kiwnx83FP9e5JGR6ux0bunGU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SJLYKLBUlS1eKO1exn8V5p8Kzrb0L0OstNcxXmi7yvVT0v+QBbze6E4Gn5vBJxux39IhqHSbYSLgjGac/hQgFxzxvjPp9gWnCqyMcyV5o5Hzdbr5H2w4KBOtGrTAJocOUfqPYXcXiFb3TaQygOBBkRMlVuZu2sqCz0ADa24EjP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D7Y+7GPg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MExf+H6p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D7Y+7GPg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MExf+H6p"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6070ZE1B863022
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 01:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=kkhmgNjK+cStVxcQy6QhuRVtTXj1DSmICcPDz7isNK8=; b=
	D7Y+7GPgahhZsMLGllmReNSRCPFhsFtlZt/5gZqoxr9ht3QNOMAHp3zFuYUfb9G7
	839UuWsi1CaPqNRANmSYD/eweMjcI0JhuE99xKNixdV5TRRirmPE9ZUmvBZjoW2H
	KgOW0lBJopG1w/G073JdWAmxE4RTTdTYeDE2FaWxFlFAn4q6vXH0yACjcS5TXzzq
	dOo9TGau+nhDe83zofxPoFlaJKoSpap76zaGLqZdV5QDjnWJ1HPWUkz8ipOw+PcK
	NzYkRqdAsGLsRljKM7B7Jd/xwACSAyLnIjBYw8GJtmuxVUZPBMntO/W0DLoVbviW
	VGT/i3NoiLoT2n7YAkAriQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhd2xr169-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 01:20:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6070eRqE027432
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 01:20:18 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj914sc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 01:20:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhc70OTahU8nXW0frnwxxkEU9olHpjE47q6VGDuIwJecY/19iGvaNLeCvuZ/0oAO7b/tbLZrge2P34HWMicbrM3z7TaEmQXWG77Vc3d1huEQdlX0RdDk5v8pNfhdCNFQ6MGpwuED001nL0Q0VVjzCr18aHurf1CWIUdxQI85hdrrC2cI1yufftB713CFqjjqUlaa9Uo9VF5+LkXvdPtjxlVU+RG3XlurF82zvbtmVCvKsjXsOQZN3gUhlO6NESyRTocsfQbMmbEqiFa+RZ5dfKf6iWSfGvpyEgy0QuD6IuwjAH2e+77uSH4nHPQgdVUsFHsVWAJN+tlrzwVdAV7meA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkhmgNjK+cStVxcQy6QhuRVtTXj1DSmICcPDz7isNK8=;
 b=olT9+C7fqNHdbFOWjZYX1+GAgKaafa7qz+Fh8FweDrg4sDMQVxub7yRp5Ups5sNznEI+BynDj9rUWArsxk8hIajYYK4vTpgWemypSnUSQwx721ZP+xgaqWEyd/uc8VQG4Q2IumVbywYw4mcXW5CbyKOg8qzIJ6s09t9KNBjtpzL4pq5ySpDAbGmwbG3GhC3amXWA6NUnIf6gbBvWruxyKU7Hj3BUo2PJYrIeJI8hZbx+T0SWZ/CWQQPZXh9M4i2KH3LhVf4/gi7bHFqf2CupX/MVsVfzxZ0j9OmaCa4ZDQAcT8KVNwjjUo9UiFvx0U+vkyh4Gen58rl/v0jmzK5SAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkhmgNjK+cStVxcQy6QhuRVtTXj1DSmICcPDz7isNK8=;
 b=MExf+H6pxBGwattTAWva0Tue7IKp/V5dS/zu1+zKeNIId5bNyBGcRygrTmOtdG6EfyqNiPc72ugVZLnSG3+m+DFHXBd36Ob93fMxDUKG/+vkBBUsGqsK0GEFtuc5ZWU90xDGGvmF9BvtQImD0E7/GDv5YpEn5YDP7urIAF24Pis=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7221.namprd10.prod.outlook.com (2603:10b6:8:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 01:20:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 01:20:13 +0000
Message-ID: <c2a055f2-ab8d-7d8a-5038-354708cdb19a@oracle.com>
Date: Tue, 6 Jan 2026 20:20:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e872e514-608f-9e06-d05d-146284b27fca@oracle.com>
 <aVyjs1kIbPaulblX@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aVyjs1kIbPaulblX@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 942c684c-d411-42b5-11c6-08de4d8ae7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SE1ncUJsWHFVZFFEa2ROYlZNRTlobkpPMXBIRDVHUHNOU1RCRnBXZlBsS0or?=
 =?utf-8?B?Nnd4dkh6N1orNzIxbHFtbG9JM04wMk9vVGxHaHJqOUpEdWxGY1YzaG5yOGhJ?=
 =?utf-8?B?MCtxdFVRL1dITm9LUzZwUElWTktBd2RYWDNjTDcxUFN2MFpOUzNnMy9mZ0tp?=
 =?utf-8?B?Z0ZKdDhFRmJSU1d5aUYwbzNPZnNJLzU1eGRQRVdkLzg5WDBjeDU4dWVDR3hQ?=
 =?utf-8?B?bjZCc0dXVy9vSy9lY1BxRmhqaVMvWVlJcCs1TUEvdEFOTzJRc2R6T3pSTmts?=
 =?utf-8?B?SDBaSkRjRjVuMUJsb3JkOVozR1cwTlJySWVoMDNRdkpiNWkwdHhHNml5RkI5?=
 =?utf-8?B?QytJZkVITTViWWhOUm5vMllWWEVjOFZIbHRnSUMrMCtwSUtYREI1dkQvRlpK?=
 =?utf-8?B?QWpDVWp1OEgyRFovTGF2bUpDV3F3L2tWK1dJVmVTbDcveGxtOUZTUDErYk83?=
 =?utf-8?B?QnBnUFpvTU5hRlU2NHdCMnRYN2krZGNGRE0yeFlubGFGWDZyd211SkxWNFNu?=
 =?utf-8?B?MEdJQjFad09GemNLWUVDQVdoZHJJUGhBYVFRU0hpM0NZdEN3emxhN2tNaWZQ?=
 =?utf-8?B?QzZmd3dQRzBaeTg5dExXUDd3SU1aTEE0YlVHc2hNWDg2R1NCU1FUT0xKTzNY?=
 =?utf-8?B?TktoMno1VFUxU1RWTS9uNTNmR3ZrVUVRa0RhL3BlcGJVTWlaMTh4QVVIWXRp?=
 =?utf-8?B?LzByS3NtZHFmaG9laWorZ1NNRzBvVFVEdCtvdTU4YXcwVGU0NVBWQkNsb3B4?=
 =?utf-8?B?ZjlsSS9tZk1LaHROQk44YjBNWkk2bklTS2xHdW9hQ3Z6ZUNESjhsM3BFMnhG?=
 =?utf-8?B?ZzB0cUtvMDl2d2RSei9tYk9BYVk2VTcvRnlqWmJyT2IrUlArWFhuNGRMVzdq?=
 =?utf-8?B?YVZyRC9Zd25LcXBrWmpHNThrc0R5ajN1eEphTDlrUlI2NzNTSXEzaVhRNmhW?=
 =?utf-8?B?SXBvV1Y1cngvWTJrQ1p3c3ZKM0U5THdxbWN4ZnZkU1R2OWVRMFhnUDV3VUpi?=
 =?utf-8?B?ZVVUeGxNV3RwS3R0d1BERW5GcHppWXZPcUt2b3pINmRGOHp5YzFDaDNMVTBs?=
 =?utf-8?B?b3lSeDZOTmwrSzdweDZqUTJlTnNGOXExQytrVk5HaUJPYThiUy9jY2NjbjEr?=
 =?utf-8?B?QW1OaWU3R3I3YWp1REFKYys4MHlFdXFnNGRTMHJSZW56TllZcUlVOVNYZW85?=
 =?utf-8?B?YkVNelRKaTV2dG4zbXRyVUJoUVkwV2Ywa3hLTnVhSjFSYzlOeFA3TWtQZlls?=
 =?utf-8?B?UjBhWVZNQk1Sa2p2Q0lad3hpNzBlTUYwbU1NNHVELzdDVVpaMGxDaTJ6aTAr?=
 =?utf-8?B?NytIWHlBYWlXYUNTSmJUc2g5aTJ0RTB3YUNRN1I3TzR3ZDVKb3J6NUJ3aUcx?=
 =?utf-8?B?bEhIZDdPRDltYWtudGJOMTNZYWJ3cFJhUUswVTlYbENFRUd1bDRpL2x0WVNV?=
 =?utf-8?B?dEhjYkRtaE1DcUQ3a3FYb1J6L2VpZVRDZVhHRnVFeHNwQXVGSlVRdnVOUDFJ?=
 =?utf-8?B?Zkh5cFdEUm8vdGxLY1lMNWlGdEorakhjU1d5blhvTTRpZnpoanVYMFphQ0Ni?=
 =?utf-8?B?NWQ0aWdzVHUzbkJ5OXhkVEVHdXdjVjZLdHljaTRyak9mTVdRNzg4cldZcHh2?=
 =?utf-8?B?L3VkQ01jQTNFMWwyWXNadXZjVFhONFZKaEJjTUJHV1VyNWFremlBaXRGSzE5?=
 =?utf-8?B?SEJjUFJ6Y1E0WjNubThrVmxXeFo2MnZTMjhiaG9MNzB0K1JnYWo1SHhieGQ2?=
 =?utf-8?B?a1VYazBBQVRHd05ReGtoNFNXZkV0Z1JxdFZJTnZnOEV0bjJiS0hEb3ZocEtH?=
 =?utf-8?B?aFdhQ2FJRkZOK0VPRDM2MXA3K1Q1SERRR1BHMWlrNlEvTk9yZ3J5WE92Q2gz?=
 =?utf-8?B?c0Z2OHYzOGYrb1lKaTVUWTlKMlZyZ0JoczVSZjV4SFRaZy9ydmFMN3RiWm5k?=
 =?utf-8?Q?n5KbHuj2JHgFTQ41YX0J2VqFhjpWiuXf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTh4Y0t1b2FJdUJ4ZFBvTkJzT1hlN3VsR0NFc29DR2thU2oxK0s3OEMvZUFa?=
 =?utf-8?B?cFpTV2R4ZThNaUpSYUFuZUNVVFMydmdlb3FacGJRWS90azlEeGxjeXpkekNW?=
 =?utf-8?B?OUN2aGdHNVd3V05UMXhBUlcyMmNzcVJLdU5PZk1xQ3BaSDJiRE1iZGNPZWV5?=
 =?utf-8?B?UjgrOEEzRmlPcVpyQlQweTRvZmsraFpNS0c1MVRETXhYVTdoNTgwQUI3c0ZO?=
 =?utf-8?B?bksyREF3dlQvVmt1aDJqNDBPNXFWNjJEVWRUR21HaUtkcXcyWHViUk5BNVZr?=
 =?utf-8?B?NE9ESFdleWFURVVUWnVtTzlBWkUyQlRRNVFMTnJ0TkhLREhkRkhDN0JNZXBL?=
 =?utf-8?B?U3NWVDdwQll4ekJBWG1sTk9jYmIwaHZMaEw0UUJJb2VxUTdjMnJtdjNSY0xR?=
 =?utf-8?B?bm1uMnFCanFWRjhMV2JpVkdHOWVNZmNzcDhPQ2ZLVDRyYU9ha0V1WEE3eUdn?=
 =?utf-8?B?ZHBITjR2V3F6b2FheDNPM0pxY093ZXpEa28zaEYwTkI5QTY1Z1FVaE1veDVY?=
 =?utf-8?B?ektKQXpZSGtJQyt0OVJVUm5DS05EdFJUOHZrakhJeUp5TStNOXVrMGxUWTdh?=
 =?utf-8?B?aUxiKzIxMFhTb3phM0JHMlFEaHFpdWZzZXpHTTZSdnk4Qy9wU01yV2g1WDJv?=
 =?utf-8?B?TGx5RXY2RTRVdG5UVVFlOGw2TmNZVkIwV3MyZ1V4OWlOMnZSd0tySzFCMnlZ?=
 =?utf-8?B?WTVpMWpMcmp1NHFIZ3dIUXJ5cUtKTkpzWjYzS1liS29qa1NncFE3c0QwQzZC?=
 =?utf-8?B?V051MWh6bHBYMk5OK21nSC9kM3lDdFV4VUZCcGlCK1RLQVpIY2ZkNmVmSG5k?=
 =?utf-8?B?OVZwUnp4c09RSDJld3dYb2M2NzEvSnBzZTFSVTFWWjQ3am8rTzk0M2Jxakpn?=
 =?utf-8?B?VUhSc3lTWEluMzJ6b1hZWkhsaEVXc2NZSDNNZmI4cHg4REozNDRSQWxiS3pJ?=
 =?utf-8?B?UVU0Zituam1iUnZub05wS3ppZnpjWm1kY1p5Q1dISVVyZkIwRXcvdDFSSVY1?=
 =?utf-8?B?S0Z3K09JdWNHMDk1OWpHcUh2bHNiZFVYVTBoeXdKN3IvcjFwSXFGUWhuaENI?=
 =?utf-8?B?UDdXa0Y3UlRyV0hZZ0lGQjJzR1VKYWd0WnRCZVFkS25rdG0zVjU1SDhkUDU5?=
 =?utf-8?B?UU9nREdQMzFvY3g5YVdGN1ZUOFM1aGMyeFlIRlJXM2Z2NnU3QXNQV3Z1b1lq?=
 =?utf-8?B?RXBoODFwSlNHeVBHMVErNUpXUjhIcFR4VFFiN1pGVDZBbCtUWEFPWkNSSm5T?=
 =?utf-8?B?UVkyTVR4T0JkOEUrWjFGTXliUEpSU3hLSDNRd1dwOG5sOEhnUUUvQmpWaFdS?=
 =?utf-8?B?eUQ1MzBSRm9qakFYZHpyazkxMk42L1BrNVh6d1JhLzFUODNPQVh6c3h1M1Yr?=
 =?utf-8?B?Ni85WEJzZ045VnBObUxBcjZRRGg3eHErd011V0lHcmNyMUR3a1RVdFVNSG1X?=
 =?utf-8?B?ZGovUFVQMEpaRmtHaHdzdDdXVGFHblV6cFAzWHYrcTRkb2ZuOGNlMVUwRkhq?=
 =?utf-8?B?UVo2TzRHRzFKcVNRNXpoTVBGb3VwUzVUU2MrS2NNOTJPSlM1STI4cmlDN1NE?=
 =?utf-8?B?SnJsTlNabXNuVTcwQ2p6b1BYY1JFQ21UTHo0a3Z5UWhIQUdiYnl4aXcxZlBo?=
 =?utf-8?B?T3B0QW9pa3hIQ2l3dW9DUC8wTS9Cc0xYS3pwMUNTanp6UFBpdDIrQTlSL1ZI?=
 =?utf-8?B?dnBEZlpPNnRGRTl6NGVWdmhQeTZYZUJmTkM5b2tUZDVYcDN2LzdjZWxLWk5k?=
 =?utf-8?B?YVkybGNScGVkNEVzRnBvL05JcVhkcGR6UzkxRHlHTTRKNkdTVFlsdCttQ1lW?=
 =?utf-8?B?Q3Urelk3cHV4Y3lsNHBrUUNXelBIMG8yKzdlaHBMK09YdGxUa1NGc1FMRzhN?=
 =?utf-8?B?K1gyNHZxV2E0cU1tcWhTejhWOFoybUd1S1ltTjNxNUVNclkyanNnektpZEtI?=
 =?utf-8?B?cEFjbjRsSytZYlMyUjViSmIvUklrb08vSy9XUmR3a0RGNG94djl3aVlLZE8y?=
 =?utf-8?B?VCtQR1U1SEkvbGpIRitKRFM5aHhJbXd3RmwycTV0QkdqV1RWbDd0ZTJZVnlx?=
 =?utf-8?B?MnRjWGE4eVBVQXJpdENTWTFrems5Ny9PM0YzUFI1QXJvRklHQUwrV2hSU2M3?=
 =?utf-8?B?RkZwS2tva0hhN01ZK2I2N2MrWDdCVW84VGg5blZZTzhXUmwwVXN1blNPS3V5?=
 =?utf-8?B?WG9xZWsyUUhKVEpVaU00OGlMNGxmNXA2S1BIVFkyTmFBaVFRV09uTjhqRXZj?=
 =?utf-8?B?dERkcGFpZDgwQ25Pc3M0UE1ONkRZOVdCeG5vMWRRQ3BSQlZRR0NDZHZSRkg5?=
 =?utf-8?B?VnJiL3YxRjBkQmdsV05YY3BPZno0R3BJbWZFZmtpYWtuYWRRaWJUUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QT+C7jlmOgB4uBy/ELdrIEH8CGRmujV9Omz4RHnBHuwKEXB11NIJp2Em1BGe3uEbMB0RHvpGtFXvKnEjDHsCoxC4PIIVT0m9dM4XXLI3naIpBDCY5gpWL/eHfAYSSmBi9aeuZGsAPJ8NwKsWcbKZCODv7Vo1jdPGl5I5rTyILv8L1F6FfwuHMx0XaXcdB5vx8aZQBlrCSYcxAqsbyAwqxvVjIhH8XTyp4Iz4yf+k5hMc/3Ydq0ofQbn3wdVq0M/G4oARFr69508CUcxNHZiw1+RJ8+/FP1WbzCiwiUYfjbqLhT20xmXyW7fhWVxWjt02haHQ9v3DoDr4v8T9QdJCXDFXJGoBTHfELRP9n59hJCfHB8p0J1seEwJF+6hEWjiRwQzF9FVic/Qz+OJv59XaavD0hEy1pi7ySxIStu6x3L0yg3pvb3F1kfgMTSs+G6KVXFi2UbKzAQSghVq2wQfTM4PGohLF1CjlzPGOEIk/1g55CRymYB3p6fpUPgR49b80DUJ77u43dEo3a28UP1ho09T2fEyls66FdeWEpIaOivbcfyTx9FM6jegWdAncBMUlEPRnYsPoPLPAQZNoCAltn2wWeQyWS2SLZtCQZjVIhDQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942c684c-d411-42b5-11c6-08de4d8ae7f3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:20:12.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywALeP+VN7fby9VBoOJ0LlDJYGZQb8OFKmaJovL4XA1HiAjYge2j45POlG8gv/xJRz/JR4Evd+qQpb7EaOLzCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7221
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070009
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAwOSBTYWx0ZWRfX/TweYtcFgZYu
 3FC23hW5azqMWch43m4as/14CkqLNlugnZ4v03VJUVNnpbLHem85LZEM442AB1ZGfD+dXT+cbrg
 Y67XgDrcPoH4TJRT5iXjB2F02uUD7jMmsRzaXtZltMa96tcnk5eGJhk4E+1yh8n+VgP1O0Zs84c
 Pd3DIS8qDS02cVZ/Mi/fR4sv9ButHarqHxrfwEQ0V38IYBXbxaG36Y8jPTzYcv4qmq9ZnIr3RNM
 E9SEm4/mgEKIJRLATh1wjAsNxd4qkhLPZrHzNGKv4rviRUHBD95vRdc8IWEpB+wAurYMBxEZubs
 9XwDW98uFp3+bpJ9IEE1AAhKj4HRYu+g6PtoZz9oeeO4kZKyiBu9PaXifZ5IhoufivMwj0UoRey
 4qV+9Uz5pLxC5s8eIg/kKZRtshV+7MbaM/sRcZMKMCZeiBJOvaSRUJ34zv47mZoGG8s5iw+KBUk
 MEDI67ccdV7bK/h4yEQ==
X-Proofpoint-GUID: _q_3JqFavnGSrOliRiN1Hb2p7wLUqFc6
X-Authority-Analysis: v=2.4 cv=Hc0ZjyE8 c=1 sm=1 tr=0 ts=695db4d3 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_p0UplG2nxKnmxZGRXMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _q_3JqFavnGSrOliRiN1Hb2p7wLUqFc6

On 1/6/26 00:54, Kris Van Hees wrote:

> On Mon, Jan 05, 2026 at 11:50:53PM -0500, Eugene Loh wrote:
>> The patch otherwise reads right to me.  The tests, however, are not happy.
>> The following tests fail intermittently:
>>
>>      test/demo/script/interp.d
>>      test/demo/script/tracewrite.d
>>      test/unittest/lockstat/tst.lockstat-summary.d
>>      test/unittest/scripting/tst.arg0.d
>>      test/unittest/scripting/tst.basic.d
>>      test/unittest/scripting/tst.trace.d
>>
>> These tests fail consistently:
>>      test/unittest/scripting/tst.assign.d
>>      test/unittest/scripting/tst.pgid.d
>>      test/unittest/scripting/tst.pid.d
>> The problem for these tests is
>>      -#!/usr/sbin/dtrace -qs
>>      +#!dtrace -qs
>> Since these files used to be invoked as scripts, the -q was ignored.  The .r
>> files relied on that.  So the interpreter files should drop the -q.  That
>> does not fix them entirely;  it simply makes their failures intermittent.
> Yes, I caught (I think) all of the opposite cases where I added a pragma to
> ensure that the -q behaviour was retained, but I don't think I considered the
> case where the script was not invoked using the #! and that therefore the -q
> was not actually effective.
>
>> I'll look more at the intermittent failures, but there may be more than one
>> thing going on there.  (lockstat-summary looks different)
> Thanks.

The intermittent failures were weird, but that lockstat-summary.d should 
also fail is just plain insane.  The problem actually appears to be with 
a different patch.  So, I'm withdrawing the "intermittent failure" 
complaint about this patch, which should be ready for a final version.  
Elsewhere, I'll report on what's really going on.
