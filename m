Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD42882D7
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738040; cv=fail; b=JS049y4oMa8kPPQUhXGOuxISGNRm8w/z0KgxjOQzW3MsFb2QZIQvDZGD7RnNu2oKbQzREXi12qV9tljgxl0judT+Z5Jsp76Gw05ZvJqj9/5NxIOGg6I+Ycx8PQspuFT8//gTYbJMpMyKuZs6kYIM6zrqaPEzINIOeammWVs/HHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738040; c=relaxed/simple;
	bh=ohYe3Oz0Au5fPkB5pQ4Qq0Z3rXPVEGbe7dy52uFIfqg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=soywLVCPcke0w4roaEkLGFcMkTejOzi8C7IqiZkediT9uQ0KIkvFgLav5sCtFPf1vmTd2lEHw2fXZA0jDZuXeiwt/NZ6SdUp5lsBwshPhaVkQnazPHN9ZEYsl72UUKi+epZQU14zdlklAM/jxjcpF+P3UlwWHPkd1v0rTBuefGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JoET8ENN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bI0nFMKb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JoET8ENN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bI0nFMKb"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625J3LOu1495531
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=D8i/nsp2sQyvjS/Ld9IxS6rRDx5DnBhZPKaLETNM9OI=; b=
	JoET8ENNZYvBTmOxE8r1odF0uvrcjVl5ldCEJfvgmzltr7S/za7paJh1shbfHu73
	eYjWGoncxjvliWbW6TxSPOlNulz5fSSIgLo1stjJbYgzgof4KDzAag6VYbBc1foT
	oyiT0LMW165hFiHiQpaAsyLr0rF+Y2a+Nq0jYtAPbebIPDEMbnRLC3jVC0OPZc7G
	zEkPRoDTTPC4ApW9jiLBKExsKY3KR8fYmsVgSlrx6CSVw5o6JFvDM1z5NDJ/9qTh
	8T/opLnA3S/0uzcGcBkpqYUPh9TR+oegbSIKeVoggr4Bfz1/BBS+b5UmXgfgTSFj
	r//rInAYoFeGr9CjZSw8Kw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cqfnbr0h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:13:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 625I9B0B001511
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:13:57 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpthyfk8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evwjco8IAqPcF+5rR3lFKjtb8vgmFQ9HZ+Ron6AF96/Jckqj8f7vWUp7IuyWoRk3Fv0pdcrnUmyXwMUuQwEiKxsIcKZZSt6YrUrvSSwj1gmgY4pAK5jtZkXyoXV4G69SCz//6U7eaJRm80QKgFXub7JGnxuHE9NyIPzBx6J86Oyn+12HGn509W5wH2+PZiwPKBRRoszoQy708JLyjAhDcxWt9lNRyjQx+9XxCc1GK7cTAKzQnyqCP0o5wdi4Ytx27+0cbe1W47H1D9RcQJF9I+ICyqk12C05l9OFuNNn6eXC6xRqsuddU8N0VjXRcl89CwM+9GRixlHNoIV0k8tOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8i/nsp2sQyvjS/Ld9IxS6rRDx5DnBhZPKaLETNM9OI=;
 b=zWvffZ8cLqFG4ybUIzm6FRvpPDSdCjJqn10AXczyvo82fupcxHq/UugTypTJ9JW/QDXYGeJDencqsrkTKBjbKOIRDOVj8X+nMVSEvHqLGAsoqXtmoUJIIKepiImscYOHO2FJKeTlj792+hiSsXi8EgGk8Z5GrzT1xMaxNmWEyZ+0CmXvKpOcGw16PsCQFhh2T5yJwTRrXWDHLEomuP5CyI30YyYW+fHgebSYR4PJ3x9D4a3k/JJi+wal8viN9QzOoDDmluT2K70N0/2m9CfMm5eJ/PrxwvAd5/stKLfB67Z2RPbeibsuuZYdRT9ZVD5FgkNLwHeXPdka4NrL1cJb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8i/nsp2sQyvjS/Ld9IxS6rRDx5DnBhZPKaLETNM9OI=;
 b=bI0nFMKbA05KdjcBxwb0WzJBYdbs84en75KskeluNaHTBYYCwRz8NGUqyjP8gYfxxF/CbT/4cXJiB02e9HpEeCpkW98kHaftrbAXtozi/MamoiuoXVkCger++9/v0CkaHCtr9lDhqbzwhoTH8XOsD+1vjvKdWodhWpZNjCrkdQE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB6592.namprd10.prod.outlook.com (2603:10b6:806:2be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:13:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 19:13:53 +0000
Message-ID: <3d9582b1-0821-7611-bd82-7a2ece8b846a@oracle.com>
Date: Thu, 5 Mar 2026 14:13:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] license: add overlooked license statement
 in bpf/GNUmakefile
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522FD4259C76530607605CDC27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522FD4259C76530607605CDC27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR22CA0058.namprd22.prod.outlook.com
 (2603:10b6:930:1d::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ce57fa-2862-4382-c589-08de7aeb573a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	ZiNl+JkpUarVwq1B0IBroy6qdYncdlHrGJahqH+jB6aMxkDkLlpsRSA2gke+IH8tJh30vKoSy7tuSiWbKkMRsoIRmWU6eSj0Js0P5PciwamO4Wt433SHxnZSdartVGR5Xz8r3B0VJX5kFIQdU17F4dU8NkH37nS2qVZRdWNp9VZHGbtRBgX5WxqaOOeLkS15p5aWchpQW0Gx4P0n//RZDcNOVXE/rFVJhoCdZUTbI29EDCB8njP1OOY9TSqMI6Zr9MYQfdV/jPKVIs5Crw5WkoLOiZBIZoqRUt7/jJM3IzGH6ZklBWfYgaMGf8OYelDYMrAKaieaOxaoppg6pAuVzF4VqmHU7QdCswRblhZF4cGxOSg4dJgztaDpwkglNFfE6oyCDFpjxPJNby4I1Wh4vcBXXSr0fl5SYJP+S2HMYnxcbthNGZqrg6CzhLqL/L7KKyT43VOZOAyyfNqvmOTHCIjTFtgk8+M7zf2WEPeJAa9qfNFsub1xFReMUdfjxDFokEWz9Z4EzxA2BTmSvvfQF6c8qnoMCvDeL/5b1jlLKaaFK1LVPQ4XDPcH8lsMrmCe6bYhasLgeB1jy6K58ug5pOf3NPxi8Q2EhmPUKiAePJQlEOE0NtTvEodvlJT855HkL+CxTtwSZ0m2x/lgYfm7rSZFUzJ+piEHHJW9nT/G+IYHGyB3FjelWbReU4HhnGlV9KPIRNJxbdAVO1w24Xm1xPm3P8i7krsc6+ofHOEJf1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkIrN253S2lSQTNDNGtGNVAyNEt6dnp5cTFtNVV1SlRWbU9paW1MQ1Z1VklK?=
 =?utf-8?B?VGdSWWVMQ0RzMkZKZ0tUMUdnYzlCNGpNUWRxcWtTQk9KN3ZCd2x4akdOV1NX?=
 =?utf-8?B?cm1YczlzYWJPY0lyTWpXNU1qRVdEbFpIM3JNVkNFNTViQ1gzc3ZvZG1tUnpk?=
 =?utf-8?B?Nm1JN2RWUytJVDUzWUMzYW9GQjcvckd2Y1JTeGZIOXZFSDV4NWIyb0JMMmJN?=
 =?utf-8?B?SUdycjZzT0lNNzdPbDVOUDRQZm1iSTlnMXdvUk1zeGh6YjBEbS83b1l5eWFU?=
 =?utf-8?B?V054TTNBbVBhN0J6ZkxSdFZ4Vi9Ic3RiY1h6SHJmVHV4WTV3SkRsRkJUSEtG?=
 =?utf-8?B?SmU2UWNBWXc2eDI0ZndJSVFRemdzQWJNVE5JSkZCMDZDWjlBWnhKRmIwaWFM?=
 =?utf-8?B?aW9OMDdTd2xlcDVYcEREem4ySHB6ZEVwVCtXT0Q0VjY5YTdiM0NUb0lYU003?=
 =?utf-8?B?VkNMNmp1OWdNdlhKN09sQ2hzaXVLQkVLQ01RWVFOMERxbFFWeFFoU1RNSHhH?=
 =?utf-8?B?bHY0SUVUc0VhMTR5azE3eVhMYjZ1czdqRlJGR2toMTQ4WE1hcjdpbFJvMjMv?=
 =?utf-8?B?QU96Tkt2SlBEMm1lUGZlL1dnUExvRnZHSnA5Q2JXR0tJYmZYbDlCaDZjUXNh?=
 =?utf-8?B?a2s4em5sSDBJWENQc2NudG1tSWV0dHlzVFZsbGNtS1VxUmVIU3IvUUtGdkJG?=
 =?utf-8?B?akswR2ljdXZLNy9IRWhITTRuSVc0WUNXMkZ1ei96WW9WUlpPVWdYWHpibHJi?=
 =?utf-8?B?aGRRRXVzS2pVdFF5N015UEJIbFlOMC9YNEMzNG5FQURrY2Y4YkE4ZVFERGJZ?=
 =?utf-8?B?cjUwcDE3MUFFVEJhQTIyMUR1RUJkc3RxZThsSUs4UndWNEpOK3hUd0dFSHNm?=
 =?utf-8?B?WlZNcE5ETm5yV1cvR2J4VVVwQ25RQm9YQmVadzFMQXlnRS8yYkY1bnpEV2Q2?=
 =?utf-8?B?S1pKd3czSFI5b1RGUlJYUWRnRkRybGtYSC9ScEVWdm9XRXF4cHIweEZ6dXE4?=
 =?utf-8?B?eWNVNW8rUHB2R1o2c3VxYjhRS1kxTkFTaFFUUUc4YTBjOFAyaVZ3cUtJeFlV?=
 =?utf-8?B?WDFXai9ta1psam01cTJGU3pXWUZSbjBNR1RrQVNuVWxFYUROTFBja3dxV0Fq?=
 =?utf-8?B?SGVkczVqbzdReWJOTXk2R1NSUUZoaXB6V0xBQSswNmYwT1hNQktVbDYvcDlV?=
 =?utf-8?B?dVRVZENPRFQ2cjl3ckhzMmVnb1N0ZVM2SlBZZjFQeVlsanl2SVhaTTB4aGpa?=
 =?utf-8?B?UDlra3RZQ01hMlVjS0xqYWcvcWNia1RBeTQ1d0w3YmRDc2tGc05SQTRmUmpH?=
 =?utf-8?B?NW9ML1ZjVExjb2V6ZmcwcWh3RGtFdmIvZ083L3ViaVBxN1RLbTM2eWhLb0hu?=
 =?utf-8?B?OThiWncrZmFIZzc5ZG9sZ1NEa1drUEs1Vkpienc2UTh5Ykc4NndmeU45NHJj?=
 =?utf-8?B?RGlIdTVOUWRsNGhRTmRRdis0NllXNkhCMGkwdFh5UVJtSkthUjJ5N3pCSE9r?=
 =?utf-8?B?M3ppeFQrS0R5dFhTV05XaTBNdlR4cU9zNC9yc2czaGZHSFBBdzVpcDQ4bU83?=
 =?utf-8?B?aWFaUm1QTE05dmVrZ0xqTjBGYkpFTGdHMG1ld3NOUk0yRkI4dlEwTHFOY1Ba?=
 =?utf-8?B?SVJveHcxU0NOcDlTZ0Y2L2hCck15TUdzeEpwMDB0Q05lSHJiZE9oaEExeUZF?=
 =?utf-8?B?cHY3Sm53aDBrWWZ2QXAxMndMdmw0SDArUU1HOTJkYmZscHJaQ0ZjS1pDVVFl?=
 =?utf-8?B?eFNjc3J1dXBrWis0eWhNSTVlcjFlVUY2OW1vWjhhK2NwQlBFYlBMdmt6UjlV?=
 =?utf-8?B?ck9UR2NBM3V2QWswYlJta1Y2endDZXUyOG5pVUZZUDVNaEFpSUhjUzIweU0v?=
 =?utf-8?B?SHBBR0ZTSGJFOFo4TFdad0VLMVQxU1RSekZtZWxnSXJYN2FDVUU5WEdrTmEx?=
 =?utf-8?B?dER2NTJqZ1o4VDUycGFCRnJNRWxQVGdjM3Z5M3dtaHV2Uk1ETjl3MkYxNkZv?=
 =?utf-8?B?bmo2S2VvdmJkSUI4Ykgrb2JtTnEvMCtKcytWTndCWnUxZGloQW1QeW5BR3hj?=
 =?utf-8?B?Z2JIb3BrLy9OOFBhbjlGV1BvR1UwYmNNd0V4ZGpmdEtYZGN0V0xuWFF1WkdV?=
 =?utf-8?B?NVNjM2tjTG05dTJXSytqTEVQVDVrb242MTZwUFJDb0RtR3BWTFB5NkpsQjV4?=
 =?utf-8?B?UWNUblJrMHdEOXNhRGg3N3B1ZUFzQVVqYm9UeVRsWHFHSW05c3hOVzlhK2tH?=
 =?utf-8?B?a1FpNDIxT09EcER1dXphOHVveWFtbGFDK0RUOXU4U3VyUW5JSnpuVTZYNnRk?=
 =?utf-8?B?blBncFFWc3U2czV1WjVIYzZZc0ZacWduL0dSUTBqMkkxZHdwUFlTQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SjD13kzTAvIZFrecdQGKWnjM5/x2gQd1MWwMKKdKR3BjkiaJ5kNHrBJR2aIa5Si17MyC5zzJWT6EHK21pHUT8LUUt4FTqI0kyuwCbID9MxU4NPm5nGW4+5U9ybpyxRxKlHuHhzIdMKeYlEK7Wtz1t7+RWT1mVcbTpRlcTlmOQi3YJjKbJ0XMK/56XMLhYwrP/pq3+nZK9k/0YuShqgs5FBjhoiymqZdtjwR1AO8GKT0Uzsa3kTpJiVGeDNTley7y9AVi74m2I66BCDu1HBFbtFd8wyCZnP50LTv9aRP6J2y5vOpzVwt88oZS3KlYGCbm0Jj0+9E6DcJhU7yWrIr5VG50B+rcH5W96acTbPCXv8yFL0DVjRKbyWX7x4NCGgo0HD+N4iDBxUsExsddCk3IYXqAsaJPS00Zp82c/LXsUM3bJjsT+8HKtuR8Q01tTRxcdawI+r4m6P/ac+F6Rqs7C5MKCdALDtyWBu2yqiOA/rdkg7mCG9BXptF5t7mVQruMP2HddpkzZWzytr4b699JdPzT1zxN+Cdv6R9UH9JRXBH8F9VD6Dn9jHOXz4M5E03aRQ81uwghMONgSflh37R4WCrMgCP5Po0e7ASnOsUcYTI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ce57fa-2862-4382-c589-08de7aeb573a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:13:53.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWSwPa41Bw55/S8XApdvoP7rtcoxJ8F8TGnv73em1w+7OzXcmuW/A4YEgl7C8GPieYzTmvX1Epbg/lrzFSMlJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603050160
X-Proofpoint-GUID: S3yLVDKuLfFROPXW1WHsFLduOdqq9fKn
X-Authority-Analysis: v=2.4 cv=CdkFJbrl c=1 sm=1 tr=0 ts=69a9d5f6 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=o-RUtwAiAMg1WUuiRWEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: S3yLVDKuLfFROPXW1WHsFLduOdqq9fKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE1OSBTYWx0ZWRfX+wbEHaIhij0k
 hgwbshYdCuIjTrmcGJRD56IdxS2/W7HzFAwBb74yH1Y0Srunee470qhNjNHbXzch22dhDWnqymd
 gqNjxokpRMexcTwJZ2dTdWwxc5U+IPLwF1Tt+OO7EjzALe19rnV7dzfHWnndZmWqg5uMhxYNpVy
 75z4Byq4iWtoqRcSuxsrIK6pV4MNekTBUbAiu9cbYY0B+2vtw/PbY7sbLenIcu8YV0xkCrDmzLM
 Dr7DuB+6Yg/uG5MX79I3DP1eUCqffjXFJE/CRliYrDEm7Yxt0T4ZpAuGy0KsAceZ3T5FisLuXZD
 A9lwoBC57Q9bn1Nyilg+pV+4Y203apMrRjKk5qrXFQUuvHg4XG8fpu+iZCcrQuqVNAsw3nXBSvs
 FBrKsJ/EP9adHEczz9/QXyNsebAQWN4lUgqbuzJgg9Zld7DYOkUCsSO/tl8PfG5a0vcmvlhyRAl
 wCbKj4qDNn+i8ZBHq5gx7yAvZ7nKfZ5sPgCon9R0=

I'm confused by the end date used.  Why 2024 rather than 2020 (the last 
commit?) or 2026 (today's change)?

On 3/5/26 14:05, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/GNUmakefile | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/bpf/GNUmakefile b/bpf/GNUmakefile
> index 4a27e08b8..51ed7df6e 100644
> --- a/bpf/GNUmakefile
> +++ b/bpf/GNUmakefile
> @@ -1,3 +1,8 @@
> +# Oracle Linux DTrace.
> +# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
>   %:
>   	$(MAKE) -C .. $@
>   
