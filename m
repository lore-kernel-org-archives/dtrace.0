Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0A9169AD2
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761102225; cv=fail; b=ey3GOR1BjMDhbSDb6k2xD1h78cqycvdsmlU9QwjxpnTj2aRQROjTTmc3CmCIo78J1bBWNNkSC/PY65P3vm6xjgwl6uxV8WzfVT1g97YqXflFDZVb0hrMb6CstNDgpFnew+ffyQzaHz5iix1WeecpXtLrA+plwOEn3bg/LYCb83M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761102225; c=relaxed/simple;
	bh=mHrufdfNJwJVrp+yhdaW9/F2qsv80VXOMup9iEE18+w=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jRL1PKhkq81s9RHcvNSr0TWgkSHSJ5p4oKaYhhrUlyf5Lc4v3zdTiifCBUZSZ54osT/PQw5qvmv6LB+sB+72eqLyAtX+nPabIVGUnE1jGz0q0QGpNNpOQk3c7evzftW5fXTSAwAJqIQGRSHYdH4mKOYQC9myHGeL3CEIyDe6UEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N0VY5RWf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xevH6rDf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N0VY5RWf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xevH6rDf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M1i2r4010659
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9GC7n48JYnUAcF/HfkzmmG1hq+2GzS4ByCzBWsq/8to=; b=
	N0VY5RWf6N5YEzNYGRLmL6vz9Tr1vQXxhN0fOD7zOY3tK+Alt77uVzVyB1bUtK04
	Q/+mxZtrs6aH9xFkiedczpyU/yekkSwH5vU16UD0H8PllD2r1gj7vgKeOSslriBv
	bp8ouQQ+GLSzhNfcqomiSYj3bzvY4ciSRHrnnmCKxtEbFyl9MUekqrfX2y25ZFgF
	tt7O8NmfLvBJS9a/ARC6M9DNeThF1M8o7ZXyxK/4EMOCnjqJnH1Da7ZW8KxoZ3fG
	kx8QM5QYmLhtxqp/8Kc4Snf3LxgzEKvXNU2zXCZATTsiMUmiEqp+ghHSUmuXdQqc
	qlIOeCjjjx9SOdTV6pUeNg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2vvxt62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:03:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2Rgff009438
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:03:40 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdv1cp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:03:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE0066dQTvmDlHpYVaNUOe5YjNTluWCxRMa08Kkx7u/IXiF0vykb0NMaLOd6OTzJ3RvqdAaHGtyysx6ZcFs3n1gXJ2wMojUX5hNlYrl+tkWNvuE++kFVad5fKIM0a36BEYbIva7+wCNE7onDuEKGivBEu2xQ3z4gCBCrD0EG/21tnNzbRY5USN5l9IoalGcgbDnEEVLfoVLPEQ/iNhNDhL0LGrAj4E4BjofSkTmXn/2m10thfuKk2cc7V5qRign5e6febj+xguS6tFMQ4qbsN+BvCtkjx29wkFsxH4UbvW2g5mnTqlLiczYExRoCb/FFd3E45oVMRWeKMvrwXUW0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GC7n48JYnUAcF/HfkzmmG1hq+2GzS4ByCzBWsq/8to=;
 b=vXjrhB960Emb2xuOZPTOIQVa47JNPn1O9Nr2wE/TkEUA4z/54CWR3Cb7YyUjI7c/CIpuLNrpi49k6sqdfGimh67kFpVXUn9i5TyP944Zy/VttvqlVu6l6BR0AycsrzHOzbOqB4HIMFQhviXs9bGVeCdILR6BGSsJgU4kwNEXHZdNHLUHG/8snAIN2WlgoSNxARVMBNtwagZ9UoMJiYLtVBDfWSkLAi88KzlIUhPQqg5mjEqCAWUMLusEpx3u9B3nGFOKyom37bkws9Ly0qs3Ojc8j3Y5GvisFxhR8i5DlWaOYDXXQh6tIcyelDYc+FV1JVbKWdofcFfETw6FOvfBWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GC7n48JYnUAcF/HfkzmmG1hq+2GzS4ByCzBWsq/8to=;
 b=xevH6rDfE0OyfwYk6p9VI9JwMwYtxlhYTkyVZkIZxTkE6Wa+JyBW8OZw4KudK/CnlCWy9s83eUlCg/bXehM8OP4DKHe0b2T1Tbc8JGWU/vNhyVla2Uvjb9zPEhwU3JKr+Z37DZMUrMsJYEWbkg49MEqw7Z/nvGynhqRQnaNMNdU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA4PR10MB8519.namprd10.prod.outlook.com (2603:10b6:208:55f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:03:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:03:33 +0000
Message-ID: <e0d9c501-1283-0c34-3bb4-8fcc3cc17964@oracle.com>
Date: Tue, 21 Oct 2025 23:03:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 07/20] doc: Remove internal ID definition at top of file
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-7-eugene.loh@oracle.com>
In-Reply-To: <20250926190557.8485-7-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA4PR10MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: f7726010-7c40-44b8-3bb0-08de111795e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0paU2hMSC9VS0JTc3p1cysrOHBVQU1iNmNFVy9rTXQvSWZtL1ZFRFJpb0VZ?=
 =?utf-8?B?RDBHUjhpODdNanlsMTZyOGUvb3N2WHJEZ0JEQnMzMjZDVy94b1h6MGJzUG1x?=
 =?utf-8?B?RWRpdjY2ZG1yNWV4TG0wdi80R3k5aGh0dmxNVHBHTXhQS3hHak54Y0F4aUJQ?=
 =?utf-8?B?OStGVmtJYng3VU1UYjEwM2UvcCs2TWdyNTJMblgxeWZvMndndTJDdmlBbGVt?=
 =?utf-8?B?b2NVUjh5MytzY202V2pZb1AzaHVnRkpYRFFJdkRjTHE3RUFkMkhKb2s2UjEr?=
 =?utf-8?B?UlJycG0rN2J1QWJnZ0lHMFdRdmpiOHhJWDRqbHNjaEZQMjNFLzBIb2tycDI0?=
 =?utf-8?B?WWRSMHpCVmthRHQzVVlPS1FFY21RTW9XRWU5Mi9RWGFKMzVFSyt6c0o0alF5?=
 =?utf-8?B?TUIvT0RUdEpZaUhmUlFhcFdHM0lwd0N6STJvNldVeW8zaEVWVzRvQXU0Zm9r?=
 =?utf-8?B?SVYwZis5Z2pkN1ZYdFdLazdxYWhVOWxjOWJDbk80a1dLUlhHMXd5b1FOVTJ1?=
 =?utf-8?B?eDE4OXpEL0RGUFBkOW1mZzU5cDNrRHV6OXVmNnJDNFltZVVDQW1qREMyYXN6?=
 =?utf-8?B?eGxlS0JmT1Rpd3ZvZnVMZ2NtZnRLaVRzVzRrVHppOEpkUGFIY21zNFI4REpj?=
 =?utf-8?B?cG1TcURGbm5LYy9aQlRoTy8vZ2lyYWZoUVY4elhIV1YvN1RtYU56Q29aSm1l?=
 =?utf-8?B?cmsxOFQxbDRLREY1anJpWVNHZzNmMWhRdkM4cHVjWWRhamw5T2NKZ3hUbzBo?=
 =?utf-8?B?VlNTVzkwZ0xRbVBSSElMeENUMm9lQmN1YnR1OXlLaVM4b0djNHp5ZVJWaHVQ?=
 =?utf-8?B?QkZrZXpGWVpuU2FUV211eGRlR0NMRC8zWldiVGFuMDFONUJCd2d5OHNBbE81?=
 =?utf-8?B?QlhkQ3dUTWtveXpCQW9ERkJCeXlCOGRnbDdnSlVsYStzdGtaWFoyZGc3Y1Fv?=
 =?utf-8?B?czc0ODhHVU5HMGRjd0p3K2YwSW9jNmdaT0RYU1hxNzZaaWRVVDhwM1I3Y2RX?=
 =?utf-8?B?NWliUHRpUXF0M1c3T3dKQVZFNDNKdTJWb3RFU1VaaS96cVduc2ZYeEZEbE81?=
 =?utf-8?B?dTJVTWVzYkNwelpJRmxpNjdWSlpyUzlnenhpM1dEZGFTUGw3WWhXL0JOM2N1?=
 =?utf-8?B?enBQdWtpM1lWV2ZwS3FWYkt4VmRNY0JKK29tK1pFRGVaMUpQamN1K1pKaFhD?=
 =?utf-8?B?R3VwNEZHNHBWd1FWYm83Wk16UFloOUZNWWlkWW5YWi9COGtUZFdWTUdyVnpR?=
 =?utf-8?B?NUNYQXhhcXZmZFZLNGN6eDEzOWl1RTRNakJWSE1vck1NamtXY1Z2VXhEbUNL?=
 =?utf-8?B?aE5lbW84TmRMMVYwK29HbCt4dXZhNG00Y05Dbk5GQ3JVNE0xUXBIUlZ0ODJw?=
 =?utf-8?B?alY5RlYzYmFUTmtidmU1N2tGTEpzam9aZXN6RW5QMHorcWxJSzBHSnFGcXBm?=
 =?utf-8?B?Y0tNVmZEbWVTcHJxTmZwbktRemQyVjBBclhiSkJxcmZmeUU4V04zYjBmQ1or?=
 =?utf-8?B?VmJkYndzeHphUFBHbzl2RnZUcDBnMmhZZzd3ODRUVGFBSXR4Q1JqU2tmRWVy?=
 =?utf-8?B?VnBIVXpsWURPYjlyeHJhN2lZeTh6SHFjdWdMMXZwcDMwdHFqd2dNandmRFVh?=
 =?utf-8?B?NWkzL2k2dGNoV0g3VWV6cUNiQnF0ZXYyd1ZndG5QUmsxUnhTR2FCMGpPNU9z?=
 =?utf-8?B?NDdyenl2dDREUkFFMnAzQWtzODhGbktjUnF4YjdDZCs2bTdEZkRkWE05eDhS?=
 =?utf-8?B?eEtVUlNpdktEVk9kdWkzRmFuNEZMS1loUXl1Zkc4aUFaMmlsZm01UmFURFpT?=
 =?utf-8?B?QlFtT0ZBVFN1WHlPb1MrbldzSmFqUm92S2p3RUVQSTdtTVRiMzlBUFNNMTFY?=
 =?utf-8?B?bXIyWXNJUk4veXNFRGg0RGR0emZKWnAxM1lMYWl6MkQrZ3laai9QOEhsRjFt?=
 =?utf-8?Q?ShNNutlY1zjHI12KaHPKKDcJ9lp0vP4x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzV1Vm4xWEJtdk1ZRzVUdDFZd3NxRmU4OE01KzY3Z0RPRnhhaHVSODUzdU85?=
 =?utf-8?B?NlJQT1RCYm5NY2tXR2Z0c2pVdEhWd004SW9RQ0V3cDJDV0tpdXhZWGZ3ZHA4?=
 =?utf-8?B?UUM4SkMvemZSUGZtb3FEbngvLzBtWElLK1JhakV6RnFqSVd1SHR5QTliTFI2?=
 =?utf-8?B?TDdDYzNoeEhYQkViaTFQV0ZtS3h4RkllZFBVcnFEa0IzOEZSVEZtU3JHOGx4?=
 =?utf-8?B?b0JZQUxLdExkREtWMXMrV0FNajBrdUtCcy81eURXOG1yVlFYMWtXelp4QlZm?=
 =?utf-8?B?V08ySGI5aDc1VUZ5MjUzbjVCZ2gydnV6VXI4Y1gwcXBkdDZtNFl0Zk5zdEh5?=
 =?utf-8?B?WWEvVDMzU3VLaXlCczV2WWx5NHBzNE5uTUhyWmp2MnVGYy9WTzUxcmZoU1oz?=
 =?utf-8?B?ZTFqdlU5Z1FjUUNRbE9JTDFQa2ZURFlDQytnRHQwa2dhWUJnOGMyNUljOU93?=
 =?utf-8?B?eisvamhMZ015L1RNVzBHUGprdnJrUWJwdXdEUElpZkk1WXdPZFh6bmhFcTdM?=
 =?utf-8?B?cGJKUmh5dEtJSFk0azRDNTRZYVZTWjYxZDNoZ2RLMXc5T01lajhLQ0dCYWhk?=
 =?utf-8?B?MmRIVEJxR2lEaWVPWiszUTBBMGJIOVA5OFd0dTBoYTd4SitSdDFMSjBtckts?=
 =?utf-8?B?T1NSZkNkUER6UHZ4R00rRk5jTDcvNFVBUzVNWnJlMzBERy9CODRiRVp6cmRF?=
 =?utf-8?B?YWtRN1p2NHcrckc2cW9HN294WjVKRVFjZElST1RIWllJYkcva2xrVE5Cejlh?=
 =?utf-8?B?ZDUzZHJ1ODJwVW95M3ZWd1Vqb2l2NjJraFpxa0FrYXYrYUx2VEI0b1Mva3Zr?=
 =?utf-8?B?MG40WFBINE96YlZpNjNKUkNZVStWdmpISXNiWDQ2YW5EamlQZkdKN3Njb2tQ?=
 =?utf-8?B?ak1LSjZ3RWpSRGhienVXamZwNUZrZ3N4SFNybUxwVW9zRlRNWFd4Ukc1M0Jl?=
 =?utf-8?B?ZjB6OEZQSTRIVUh2bERSa3hoZStqaTZrQjYxYTRsZmQ5WEdlb2N1M09lZnEz?=
 =?utf-8?B?czFROVV1MjZmbFhuUjVEa0U1RmZkSWhRMzBQNy9XenNUelgzNWg5Q3lONVN5?=
 =?utf-8?B?bG9LS3VNTUxkai8xbzBRcUtuZHZQc1dMbWVIWXFSZHhhSkV4UEJrZU1QVFFV?=
 =?utf-8?B?T1Y0akFMRCtLUWEwcStpSGplajRBMjV5alQwNlpUNVdHMVFJZkxERGhaQlEx?=
 =?utf-8?B?ZVZsZUdwQ2VEZ2MvcFJKaU5LTlZKbWxBS0dKNTN1cHB5RG1PT004UTdPMUhP?=
 =?utf-8?B?MU9wWWxxbGc4c3YyVnBrVHpEZ1JBenE0S0JodFVmOVgrdjhmSWpwZnJnZFJa?=
 =?utf-8?B?RitKV1JmSk9aRm1WWTQ1L2hmSm9WQ2kwRExHOUlsSEl4bG4zVm9zNmdNdEhj?=
 =?utf-8?B?M2YweGlTQ0R4U05Kbi9LMG84UnQ4eThiRU5tL1plcnM5cVdvOXgwSnBOZlJj?=
 =?utf-8?B?bkp6NW5uWHY5a1R6eWlhSTVkdk5qQ1MwTEpNd3g4a3duMzd5SW4yMDBXejRr?=
 =?utf-8?B?N3g5TytWc2hnci9STW1zYkpBQUJSaW1FbE9WWHdzWUJacHJUOWt6cFFtdjJS?=
 =?utf-8?B?Z2tKeXQ5ZlFQcFdROEpsaXY3bFdWWDRaN2VOZFNubXJMS01EOFFhTU4zaFBs?=
 =?utf-8?B?ZHdpRGpFOUFiYlluQ0xMelhZdDgxN2Q2Z095NEdyOUh0SE8xaDdmNFBvNzBP?=
 =?utf-8?B?U0FLSERHaUs0YXQrNUh5T2RwUElhaCtOcDNwOTdrUHZROGg4Zjk4Wk5VaW9E?=
 =?utf-8?B?bEJkU0hBNy9kMDlQR25HRGJHYkVHNFd0bDBJeVN1TUo3RVQ5VjZPaWY1UXJK?=
 =?utf-8?B?YXlYQ0JHUEp1UWRKellrRGg5OXdQdWN5aDZhVGdLWGdhQ1h0dUt6UVJCTWk5?=
 =?utf-8?B?MExHOFJkQlJ0UUJMenQ3VWJqNWxwNTgyVWVRZE1jMGdFa1RiOFN4dTFBSHJi?=
 =?utf-8?B?cktPWGQvWWkrQUJhYjRwTGtldW9yUUhSVXFEMlJNL0REcDRGR0FYNjM1OEYx?=
 =?utf-8?B?amNjUnpDT3hCRGhGYTRLSzRPeG01cUZFelNmVVd3NHU4WHZ2WW9ZSE50dU4x?=
 =?utf-8?B?SlYzaEN2bXBKZlo5YnpQbERBWWdvZVV5cVMyY2NuT1NBVnlpeXpwM0pmdStj?=
 =?utf-8?Q?h+bO7QKTHaly/u/TbQ2u1ZxrX?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JmX5DtCM7fWvvYwbyf2SEWL21kYLFAQAe+M//A5EPt/F9QZMnFjWZv6wdROQEvpeTAjvZBQlKnIkImNrdEiAa5UtjzhrhxOM+eB13xByUgMZDqYM9DDiBt+MA9eSR6kX9f+ys1OfuKyHUMA0F7Xxw1FlIz03n393aju45XCachht4dBC/xRrv+LjH2DyN+HvdzB7JY+MROflgWCpv2xMczIOhVfN61A2wf+K5ucfPGKQqy0L+//VgES6u8/eXavcjRFUwLAkLLQ0H44+O63S4+EX3erVglu0YFadMJdonquN2pKi+voNLi2Yhwb8WRojLRf/8ZsYAVCzA44EbiexFo/cUmyzNB3zZdMwYrDYwJNTR3knlmdJN4mxAC+ZSUYdYfcvyTwushb6RrikD3Rp8UqO5zP31lmZ2WxBxGTvzMMG0RB/ZiQ++VMtyzBU2pkyPcKn375hZqp422NMb3dghnLJ3YGre9VIGKBk/ehNYsRbVnoUMXZ5RqUN2OW3l9ygA71MOsAgqpzrPylDFNAL4OSh/nuw1H+YW9IM8mbzp3ef8/xwQYHLvPhE07qLzIbiZ9fGi+AQpvO75kN2fcIG2eZQKvs+tpVFaU1fhK0gXpM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7726010-7c40-44b8-3bb0-08de111795e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:03:33.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsPW0KTDrGIdSZUSSq4YPrj2aulyhf7PKCIp9kFTnDFx1sw+kcN3zAaHE+Qlp/LU0m3Pa2zolzA2Yv6sNdzhRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8519
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220023
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX/P5rCP1t/bGT
 1Et1bK+MfO0v075z/mQIaj70DOCJxjn43d4Yz/VP9DjGNdSKtsSMOuqgQT4PytVpWLQE4PF2izh
 udKx/A51GbkB4hUM7jr7G1mP1w4hwA2hd9o7KBL4nlPNox1yfJMf20kudU2WigzBm4+vStaZRmQ
 ZxaLtDFbrNe6UdXVrHVijK/1jhR3qJFPNiPF4SAy3yhp9qocEiwRGgK8o0v/4JWnMssLLAjgskL
 XHrr/5z60Wv4cbFXADfVz2hMIN5JnFRhck+hxLH+ebgnWYLTLN5t+iDVJbOVNrWRkMgVGZ7Qeu3
 vPup3aryNvJhmwsskAUSXlInvBaX/olQ9Yoi3q8cSPVaK6X7C5WgH5EK1dO6zamT5CwEkQcoV9h
 eY4qMkNuyOP3UXxnTDxcKKaC2BMdXV7iFIC4jmiRmVRld/zMKYw=
X-Proofpoint-ORIG-GUID: 2Ffh-GiLtbj8ZS84JHqgPL13P9D8YJRT
X-Proofpoint-GUID: 2Ffh-GiLtbj8ZS84JHqgPL13P9D8YJRT
X-Authority-Analysis: v=2.4 cv=FuwIPmrq c=1 sm=1 tr=0 ts=68f8498c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=fa01KBOEilXbyib3oI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12092

I'm withdrawing this patch.

On 9/26/25 15:05, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> One can define internal or anchor IDs in files to enable links to
> specific locations within a file.  This makes no sense at the top of a
> file, which is where one goes by default.  Besides, the {#id} syntax for
> defining these IDs in Markdown seems not to be working anyhow, exposing
> meaningless text to the reader.  Remove those IDs.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   doc/userguide/explanation/dtrace-about.md     |  2 +-
>   .../dtrace-components-and-terminology.md      |  2 +-
>   .../dtrace-howto-create-a-dtrace-script.md    |  2 +-
>   .../how-to/dtrace-howto-install-dtrace.md     |  2 +-
>   .../dtrace-howto-list-and-enable-probes.md    |  2 +-
>   .../how-to/dtrace-howto-use-predicates.md     |  2 +-
>   doc/userguide/index.md                        | 72 +++++++++----------
>   doc/userguide/reference/aggregation.md        |  2 +-
>   doc/userguide/reference/compiler_options.md   |  2 +-
>   ...gram_syntax_reference_program_structure.md |  2 +-
>   .../dtrace-ref-DTraceSupportforStrings.md     |  2 +-
>   .../dtrace-ref-PointersandScalarArrays.md     |  2 +-
>   ...ticallyDefinedTracingofUserApplications.md |  2 +-
>   .../reference/dtrace-ref-StructsandUnions.md  |  2 +-
>   ...dtrace-ref-TypesOperatorsandExpressions.md |  2 +-
>   .../reference/dtrace-ref-Variables.md         |  2 +-
>   .../reference/dtrace-ref-speculation.md       |  2 +-
>   .../dtrace_builtin_variable_reference.md      |  2 +-
>   .../reference/dtrace_command_desc.md          |  2 +-
>   .../reference/dtrace_command_exit_status.md   |  2 +-
>   .../reference/dtrace_command_operands.md      |  2 +-
>   .../reference/dtrace_command_options.md       |  2 +-
>   .../reference/dtrace_providers_cpc.md         |  2 +-
>   .../reference/dtrace_providers_dtrace.md      |  2 +-
>   .../reference/dtrace_providers_fbt.md         |  2 +-
>   .../reference/dtrace_providers_io.md          |  2 +-
>   .../reference/dtrace_providers_lockstat.md    |  2 +-
>   .../reference/dtrace_providers_pid.md         |  2 +-
>   .../reference/dtrace_providers_proc.md        |  2 +-
>   .../reference/dtrace_providers_profile.md     |  2 +-
>   .../reference/dtrace_providers_rawtp.md       |  2 +-
>   .../reference/dtrace_providers_sched.md       |  2 +-
>   .../reference/dtrace_providers_sdt.md         |  2 +-
>   .../reference/dtrace_providers_syscall.md     |  2 +-
>   .../reference/dtrace_runtime_options.md       |  2 +-
>   .../reference/dynamic_runtime_options.md      |  2 +-
>   ...ing_dtrace_compiler_and_runtime_options.md |  2 +-
>   37 files changed, 72 insertions(+), 72 deletions(-)
>
> diff --git a/doc/userguide/explanation/dtrace-about.md b/doc/userguide/explanation/dtrace-about.md
> index 4ab252a79..8c6039947 100644
> --- a/doc/userguide/explanation/dtrace-about.md
> +++ b/doc/userguide/explanation/dtrace-about.md
> @@ -1,5 +1,5 @@
>   
> -# About DTrace {#concept_about}
> +# About DTrace
>   
>   DTrace is a powerful tracing tool that's available on Linux. DTrace has low overhead and is safe to use on production systems to analyze what a system is doing in real time.
>   
> diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
> index b187055a4..1d7a35076 100644
> --- a/doc/userguide/explanation/dtrace-components-and-terminology.md
> +++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
> @@ -1,5 +1,5 @@
>   
> -# DTrace Components and Terminology {#concept_terms}
> +# DTrace Components and Terminology
>   
>   Learn about the different components and the terms used to describe them within the DTrace framework.
>   
> diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> index 199649a9f..72e085b2e 100644
> --- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> +++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> @@ -1,5 +1,5 @@
>   
> -# Create a DTrace Script {#dt_create_script}
> +# Create a DTrace Script
>   
>   Learn how to create a DTrace script to develop understanding of the D Programming language.
>   
> diff --git a/doc/userguide/how-to/dtrace-howto-install-dtrace.md b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
> index 45da88fd8..83de8f905 100644
> --- a/doc/userguide/how-to/dtrace-howto-install-dtrace.md
> +++ b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
> @@ -1,4 +1,4 @@
> -# Install DTrace{#install_dtrace}
> +# Install DTrace
>   
>   The following instructions provide steps to install DTrace on different Linux distributions and to verify that the installation was successful.
>   
> diff --git a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> index ad9c3a4d3..91b005657 100644
> --- a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> +++ b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> @@ -1,5 +1,5 @@
>   
> -# List and Enable Probes {#list_enable_probes}
> +# List and Enable Probes
>   
>   DTrace providers publish available probes to DTrace so that you can enable them to perform functions when they fire. You can use the `dtrace` command to list all available probes or to enable a probe.
>   
> diff --git a/doc/userguide/how-to/dtrace-howto-use-predicates.md b/doc/userguide/how-to/dtrace-howto-use-predicates.md
> index c32f3050f..44bc41d5d 100644
> --- a/doc/userguide/how-to/dtrace-howto-use-predicates.md
> +++ b/doc/userguide/how-to/dtrace-howto-use-predicates.md
> @@ -1,5 +1,5 @@
>   
> -# Use Predicates For Control Flow {#dt_preds_dlang}
> +# Use Predicates For Control Flow
>   
>   For runtime safety, one major difference between D and other programming languages such as C, C++, and the Java programming language is the absence of control-flow constructs such as `if`-statements and loops. D program clauses are written as single straight-line statement lists that trace an optional, fixed amount of data. D does provide the ability to conditionally trace data and change control flow using logical expressions called *predicates*. This tutorial shows how to use predicates to control D programs.
>   
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index abd1096db..a8f6a7e76 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -1,31 +1,31 @@
>   # Using DTrace for System Tracing
>   
>   -   [Get Started With DTrace](how-to/dtrace-guide.md)
> -    -   [Install DTrace](how-to/dtrace-howto-install-dtrace.md#install_dtrace)
> +    -   [Install DTrace](how-to/dtrace-howto-install-dtrace.md)
>           -   [Build and Install DTrace on Gentoo Linux](how-to/dtrace-howto-install-dtrace.md#build_install_dtrace_gentoo_linux)
>           -   [Install DTrace on Oracle Linux 10](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_10)
>           -   [Install DTrace on Oracle Linux 9](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_9)
>           -   [Install DTrace on Oracle Linux 8](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_8)
>           -   [Install DTrace on Oracle Linux 7](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_7)
>           -   [Verify the DTrace Installation](how-to/dtrace-howto-install-_dtrace.md#verify_install)
> -    -   [List and Enable Probes](how-to/dtrace-howto-list-and-enable-probes.md#list_enable_probes)
> -    -   [Create a DTrace Script](how-to/dtrace-howto-create-a-dtrace-script.md#dt_create_script)
> -    -   [Use Predicates For Control Flow](how-to/dtrace-howto-use-predicates.md#dt_preds_dlang)
> +    -   [List and Enable Probes](how-to/dtrace-howto-list-and-enable-probes.md)
> +    -   [Create a DTrace Script](how-to/dtrace-howto-create-a-dtrace-script.md)
> +    -   [Use Predicates For Control Flow](how-to/dtrace-howto-use-predicates.md)
>   -   [DTrace Concepts](explanation/dtrace-concepts.md)
> -    -   [About DTrace](explanation/dtrace-about.md#concept_about)
> -    -   [DTrace Components and Terminology](explanation/dtrace-components-and-terminology.md#concept_terms)
> +    -   [About DTrace](explanation/dtrace-about.md)
> +    -   [DTrace Components and Terminology](explanation/dtrace-components-and-terminology.md)
>           -   [Probes](explanation/dtrace-components-and-terminology.md#concept_terms_probes)
>           -   [D Programs](explanation/dtrace-components-and-terminology.md#concept_terms_programs)
>           -   [Aggregations](explanation/dtrace-components-and-terminology.md#concept_terms_aggregations)
>           -   [Speculation](explanation/dtrace-components-and-terminology.md#concept_terms_speculation)
>   -   [DTrace Command Reference](reference/dtrace_command_reference.md)
> -    -   [About the dtrace Command](reference/dtrace_command_desc.md#dtrace_command_desc)
> -    -   [dtrace Command Options](reference/dtrace_command_options.md#dtrace_command_options)
> -    -   [dtrace Command Operands](reference/dtrace_command_operands.md#dtrace_command_operands)
> -    -   [dtrace Command Exit Status](reference/dtrace_command_exit_status.md#dtrace_command_exit_status)
> +    -   [About the dtrace Command](reference/dtrace_command_desc.md)
> +    -   [dtrace Command Options](reference/dtrace_command_options.md)
> +    -   [dtrace Command Operands](reference/dtrace_command_operands.md)
> +    -   [dtrace Command Exit Status](reference/dtrace_command_exit_status.md)
>   -   [D Program Syntax Reference](reference/d_program_syntax_reference.md)
> -    -   [Program Structure](reference/d_program_syntax_reference_program_structure.md#dt_prog_struct)
> -    -   [Types, Operators, and Expressions](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_types_dlang)
> +    -   [Program Structure](reference/d_program_syntax_reference_program_structure.md)
> +    -   [Types, Operators, and Expressions](reference/dtrace-ref-TypesOperatorsandExpressions.md)
>           -   [Identifier Names and Keywords](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_ident_dlang)
>           -   [Data Types and Sizes](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_dtypes_dlang)
>           -   [Constants](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_consts_dlang)
> @@ -43,39 +43,39 @@
>               -   [Enumerations](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_enums_dlang)
>               -   [Inlines](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_inlines_dlang)
>               -   [Type Namespaces](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_typens_dlang)
> -    -   [Variables](reference/dtrace-ref-Variables.md#dt_vars_dlang)
> +    -   [Variables](reference/dtrace-ref-Variables.md)
>           -   [Variable Scope](reference/dtrace-ref-Variables.md#dt_vscope_dlang)
> -    -   [Pointers](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarr_dlang)
> +    -   [Pointers](reference/dtrace-ref-PointersandScalarArrays.md)
>           -   [Pointer Safety](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrsafety_dlang)
>           -   [Pointer and Array Relationship](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarel_dlang)
>           -   [Pointer Arithmetic](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarith_dlang)
>           -   [Generic Pointers](reference/dtrace-ref-PointersandScalarArrays.md#dt_genptr_dlang)
>           -   [Pointers to DTrace Objects](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrobj_dlang)
>           -   [Pointers and Address Spaces](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptraddrsp_dlang)
> -    -   [Structs and Unions](reference/dtrace-ref-StructsandUnions.md#dt_structunion_dlang)
> +    -   [Structs and Unions](reference/dtrace-ref-StructsandUnions.md)
>           -   [Structs](reference/dtrace-ref-StructsandUnions.md#dt_structs_dlang)
>           -   [Pointers to Structs](reference/dtrace-ref-StructsandUnions.md#dt_ptrstructs_dlang)
>           -   [Unions](reference/dtrace-ref-StructsandUnions.md#dt_unions_dlang)
>           -   [Member Sizes and Offsets](reference/dtrace-ref-StructsandUnions.md#dt_memsz_dlang)
>           -   [Bit-Fields](reference/dtrace-ref-StructsandUnions.md#dt_bitflds_dlang)
> -    -   [DTrace String Processing](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strings_dlang)
> +    -   [DTrace String Processing](reference/dtrace-ref-DTraceSupportforStrings.md)
>           -   [String Representation](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strrep_dlang)
>           -   [String Constants](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strcon_dlang)
>           -   [String Assignment](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strasg_dlang)
>           -   [String Conversion](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strconv_dlang)
>           -   [String Comparison](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strcomp_dlang)
> -    -   [Aggregations](reference/aggregation.md#dt_ref_aggregations)
> +    -   [Aggregations](reference/aggregation.md)
>           -   [Aggregation Functions](reference/aggregation.md#dt_ref_aggr_funcs)
>   	-   [Printing Aggregations](reference/aggregation.md#dt_ref_aggr_print)
>   	-   [Data Normalization](reference/aggregation.md#dt_ref_aggr_dnorm)
> -    -   [Speculation](reference/dtrace-ref-speculation.md#dt_ref_speculation)
> +    -   [Speculation](reference/dtrace-ref-speculation.md)
>   -   [DTrace Runtime and Compile-time Options Reference](reference/dtrace_runtime_options.md)
> -    -   [Setting DTrace Compile-time and Runtime Options](reference/setting_dtrace_compiler_and_runtime_options.md#dt_runtime_option_description)
> -    -   [Compile-time Options](reference/compiler_options.md#dt_compiler_options)
> -    -   [Runtime Options](reference/runtime_options.md#dt_runtime_options)
> -    -   [Dynamic Runtime Options](reference/dynamic_runtime_options.md#dt_dynamic_runtime_options)
> +    -   [Setting DTrace Compile-time and Runtime Options](reference/setting_dtrace_compiler_and_runtime_options.md)
> +    -   [Compile-time Options](reference/compiler_options.md)
> +    -   [Runtime Options](reference/runtime_options.md)
> +    -   [Dynamic Runtime Options](reference/dynamic_runtime_options.md)
>   -   [DTrace Stability Reference](reference/dt_stability_reference.md)
> --   [DTrace Built-in Variable Reference](reference/dtrace_builtin_variable_reference.md#dt_ref_builtin_vars)
> +-   [DTrace Built-in Variable Reference](reference/dtrace_builtin_variable_reference.md)
>       -   [Macro Variables](reference/dtrace_builtin_variable_reference.md#dt_macrov_scrpt)
>       -   [args\[\]](reference/dtrace_builtin_variable_reference.md#dt_ref_vars_args)
>       -   [arg0, …, arg9](reference/dtrace_builtin_variable_reference.md#dt_ref_var_arg0-9)
> @@ -185,22 +185,22 @@
>       -   [ustack](reference/function_ustack.md)
>       -   [usym](reference/function_usym.md)
>   -   [DTrace Provider Reference](reference/dtrace_providers.md)
> -    -   [CPC Provider](reference/dtrace_providers_cpc.md#dt_ref_cpc_prov)
> +    -   [CPC Provider](reference/dtrace_providers_cpc.md)
>           -   [cpc Probes](reference/dtrace_providers_cpc.md#dt_ref_cpcprobes_prov)
>           -   [cpc Probe Arguments](reference/dtrace_providers_cpc.md#dt_ref_cpcargs_prov)
>           -   [cpc Examples](reference/dtrace_providers_cpc.md#dt_ref_cpcexamples_prov)
>           -   [cpc Stability](reference/dtrace_providers_cpc.md#dt_ref_cpcstab_prov)
> -    -   [DTrace Provider](reference/dtrace_providers_dtrace.md#dt_ref_dt_prov)
> +    -   [DTrace Provider](reference/dtrace_providers_dtrace.md)
>           -   [BEGIN Probe](reference/dtrace_providers_dtrace.md#dt_ref_begin_prov)
>           -   [END Probe](reference/dtrace_providers_dtrace.md#dt_ref_end_prov)
>           -   [ERROR Probe](reference/dtrace_providers_dtrace.md#dt_ref_error_prov)
>           -   [dtrace Stability](reference/dtrace_providers_dtrace.md#dt_ref_dtstability_prov)
> -    -   [FBT Provider](reference/dtrace_providers_fbt.md#dt_ref_fbt_prov)
> +    -   [FBT Provider](reference/dtrace_providers_fbt.md)
>           -   [fbt Probes](reference/dtrace_providers_fbt.md#dt_ref_fbtprobes_prov)
>           -   [fbt Probe Arguments](reference/dtrace_providers_fbt.md#dt_ref_fbtargs_prov)
>           -   [fbt Examples](reference/dtrace_providers_fbt.md#dt_ref_fbtexamples_prov)
>           -   [fbt Stability](reference/dtrace_providers_fbt.md#dt_ref_fbtstab_prov)
> -    -   [IO Provider](reference/dtrace_providers_io.md#dt_ref_io_prov)
> +    -   [IO Provider](reference/dtrace_providers_io.md)
>           -   [io Probes](reference/dtrace_providers_io.md#dt_ref_ioprobes_prov)
>           -   [io Probe Arguments](reference/dtrace_providers_io.md#dt_ref_ioargs_prov)
>               -   [bufinfo\_t](reference/dtrace_providers_io.md#dt_ref_iobuf_prov)
> @@ -208,48 +208,48 @@
>               -   [fileinfo\_t](reference/dtrace_providers_io.md#dt_ref_iofile_prov)
>           -   [io Examples](reference/dtrace_providers_io.md#dt_ref_ioexamples_prov)
>           -   [io Stability](reference/dtrace_providers_io.md#dt_ref_iostab_prov)
> -    -   [Lockstat Provider](reference/dtrace_providers_lockstat.md#dt_ref_lockstat_prov)
> +    -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
>           -   [lockstat Probes](reference/dtrace_providers_lockstat.md#dt_ref_lockstatprobes_prov)
>           -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#dt_ref_lockstatargs_prov)
>           -   [lockstat Examples](reference/dtrace_providers_lockstat.md#dt_ref_lockstatexamples_prov)
>           -   [lockstat Stability](reference/dtrace_providers_lockstat.md#dt_ref_lockstatstab_prov)
> -    -   [Pid Provider](reference/dtrace_providers_pid.md#dt_ref_pid_prov)
> +    -   [Pid Provider](reference/dtrace_providers_pid.md)
>           -   [pid Probes](reference/dtrace_providers_pid.md#dt_ref_pidprobes_prov)
>           -   [pid Probe Arguments](reference/dtrace_providers_pid.md#dt_ref_pidargs_prov)
>           -   [pid Examples](reference/dtrace_providers_pid.md#dt_ref_pidexamples_prov)
>           -   [pid Stability](reference/dtrace_providers_pid.md#dt_ref_pidstab_prov)
> -    -   [Proc Provider](reference/dtrace_providers_proc.md#dt_ref_proc_prov)
> +    -   [Proc Provider](reference/dtrace_providers_proc.md)
>           -   [proc Probes](reference/dtrace_providers_proc.md#dt_ref_procprobes_prov)
>           -   [proc Probe Arguments](reference/dtrace_providers_proc.md#dt_ref_procargs_prov)
>               -   [lwpsinfo\_t](reference/dtrace_providers_proc.md#dt_ref_lwpsinfoproc_prov)
>               -   [psinfo\_t](reference/dtrace_providers_proc.md#dt_ref_procpsinfo_prov)
>           -   [proc Examples](reference/dtrace_providers_proc.md#dt_ref_procexamples_prov)
>           -   [proc Stability](reference/dtrace_providers_proc.md#dt_ref_procstab_prov)
> -    -   [Profile Provider](reference/dtrace_providers_profile.md#dt_ref_profile_prov)
> +    -   [Profile Provider](reference/dtrace_providers_profile.md)
>           -   [profile-n Probes](reference/dtrace_providers_profile.md#dt_ref_profile-n_prov)
>           -   [tick-n Probes](reference/dtrace_providers_profile.md#dt_ref_profile-tick-n_prov)
>           -   [profile Probe Arguments](reference/dtrace_providers_profile.md#dt_ref_profargs_prov)
>           -   [profile Probe Creation](reference/dtrace_providers_profile.md#dt_ref_profprobecreate_prov)
>           -   [profile Stability](reference/dtrace_providers_profile.md#dt_ref_profstab_prov)
> -    -   [Rawtp Provider](reference/dtrace_providers_rawtp.md#dt_ref_rawtp_prov)
> +    -   [Rawtp Provider](reference/dtrace_providers_rawtp.md)
>           -   [rawtp Stability](reference/dtrace_providers_rawtp.md#dt_ref_rawtpstab_prov)
> -    -   [Sched Provider](reference/dtrace_providers_sched.md#dt_ref_sched_prov)
> +    -   [Sched Provider](reference/dtrace_providers_sched.md)
>           -   [sched Probes](reference/dtrace_providers_sched.md#dt_ref_schedprob_prov)
>           -   [sched Probe Arguments](reference/dtrace_providers_sched.md#dt_ref_schedargs_prov)
>               -   [lwpsinfo\_t and psinfo\_t](reference/dtrace_providers_sched.md#dt_ref_lwpsinfo_t_psinfo_t_sched_prov)
>               -   [cpuinfo\_t](reference/dtrace_providers_sched.md#dt_ref_cpuinfo_sched_prov)
>           -   [sched Examples](reference/dtrace_providers_sched.md#dt_ref_schedexamples_prov)
>           -   [sched Stability](reference/dtrace_providers_sched.md#dt_ref_schedstab_prov)
> -    -   [SDT Provider](reference/dtrace_providers_sdt.md#dt_ref_sdt_prov)
> +    -   [SDT Provider](reference/dtrace_providers_sdt.md)
>           -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtcreatep_prov)
>               -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
>               -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
>           -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
> -    -   [Syscall Provider](reference/dtrace_providers_syscall.md#dt_ref_syscall_prov)
> +    -   [Syscall Provider](reference/dtrace_providers_syscall.md)
>           -   [syscall Probes](reference/dtrace_providers_syscall.md#dt_ref_syscallprobes_prov)
>           -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#dt_ref_syscallargs_prov)
>           -   [syscall Stability](reference/dtrace_providers_syscall.md#dt_ref_syscallstab_prov)
> -    -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_prov)
> +    -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)
>           -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
>           -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
>           -   [Building Applications With USDT Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
> diff --git a/doc/userguide/reference/aggregation.md b/doc/userguide/reference/aggregation.md
> index 8bdd44b49..0114d26f3 100644
> --- a/doc/userguide/reference/aggregation.md
> +++ b/doc/userguide/reference/aggregation.md
> @@ -1,5 +1,5 @@
>   
> -# Aggregations {#dt_ref_aggregations}
> +# Aggregations
>   
>   Aggregations enable you to accumulate data for statistical analysis. The aggregation is calculated at runtime, so that post-processing isn't required and processing is highly efficient and accurate. Aggregations function similarly to associative arrays, but are populated by aggregating functions. In D, the syntax for an aggregation is as follows:
>   
> diff --git a/doc/userguide/reference/compiler_options.md b/doc/userguide/reference/compiler_options.md
> index 8e2813c1f..6b16446d0 100644
> --- a/doc/userguide/reference/compiler_options.md
> +++ b/doc/userguide/reference/compiler_options.md
> @@ -1,5 +1,5 @@
>   
> -# Compile-time Options {#dt_compiler_options}
> +# Compile-time Options
>   
>   Compile-time options can control how DTrace programs are compiled into eBPF code that's loaded into kernel space.
>   
> diff --git a/doc/userguide/reference/d_program_syntax_reference_program_structure.md b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
> index 547fd7a36..e13bcd005 100644
> --- a/doc/userguide/reference/d_program_syntax_reference_program_structure.md
> +++ b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
> @@ -1,5 +1,5 @@
>   
> -# Program Structure {#dt_prog_struct}
> +# Program Structure
>   
>   A D program consists of a set of clauses that describe the probes to enable, an optional predicate that controls when to run, and one or more statements that often describe some functionality to implement when the probe fires.
>   
> diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> index 98f482c63..367d9b133 100644
> --- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> +++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> @@ -1,5 +1,5 @@
>   
> -# DTrace String Processing {#dt_strings_dlang}
> +# DTrace String Processing
>   
>   DTrace provides facilities for tracing and manipulating strings. This section describes the complete set of D language features for declaring and manipulating strings. Unlike ANSI C, strings in D have their own built-in type and operator support to enable you to easily and unambiguously use them in tracing programs.
>   
> diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> index da4b69333..035f5ed15 100644
> --- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> +++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> @@ -1,5 +1,5 @@
>   
> -# Pointers {#dt_ptrarr_dlang}
> +# Pointers
>   
>   Pointers are memory addresses of data objects and reference memory used by the OS, by the user program, or by the D script. Pointers in D are data objects that store an integer virtual address value and associate it with a D type that describes the format of the data stored at the corresponding memory location.
>   
> diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> index 7548bad83..ca3d74ffc 100644
> --- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> +++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> @@ -1,5 +1,5 @@
>   
> -# USDT Provider {#dt_ref_usdt_prov}
> +# USDT Provider
>   
>   Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
>   
> diff --git a/doc/userguide/reference/dtrace-ref-StructsandUnions.md b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
> index aa4f092df..79115e362 100644
> --- a/doc/userguide/reference/dtrace-ref-StructsandUnions.md
> +++ b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
> @@ -1,5 +1,5 @@
>   
> -# Structs and Unions {#dt_structunion_dlang}
> +# Structs and Unions
>   
>   Collections of related variables can be grouped together into composite data objects called *structs* and *unions*. You define these objects in D by creating new type definitions for them. You can use any new types for any D variables, including associative array values. This section explores the syntax and semantics for creating and manipulating these composite types and the D operators that interact with them.
>   
> diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> index 1a1549445..013989706 100644
> --- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> +++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> @@ -1,5 +1,5 @@
>   
> -# Types, Operators, and Expressions {#dt_types_dlang}
> +# Types, Operators, and Expressions
>   
>   D provides the ability to access and manipulate various data objects: variables and data structures can be created and changed, data objects that are defined in the OS kernel and user processes can be accessed, and integer, floating-point, and string constants can be declared. D provides a superset of the ANSI C operators that are used to manipulate objects and create complex expressions. This section describes the detailed set of rules for types, operators, and expressions.
>   
> diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
> index bc10071ca..c4d7c4014 100644
> --- a/doc/userguide/reference/dtrace-ref-Variables.md
> +++ b/doc/userguide/reference/dtrace-ref-Variables.md
> @@ -1,5 +1,5 @@
>   
> -# Variables {#dt_vars_dlang}
> +# Variables
>   
>   D provides several variable types: scalar variables, associative arrays, scalar arrays, and multidimensional scalar arrays. Variables can be created by declaring them explicitly, but are most often created implicitly on first use. Variables can be restricted to clause or thread scope to avoid name conflicts and to control the lifetime of a variable explicitly.
>   
> diff --git a/doc/userguide/reference/dtrace-ref-speculation.md b/doc/userguide/reference/dtrace-ref-speculation.md
> index 181d45db3..88ef12db3 100644
> --- a/doc/userguide/reference/dtrace-ref-speculation.md
> +++ b/doc/userguide/reference/dtrace-ref-speculation.md
> @@ -1,5 +1,5 @@
>   
> -# Speculation {#dt_ref_speculation}
> +# Speculation
>   
>   DTrace includes a speculative tracing facility that can be used to tentatively trace data at one or more probe locations. You can then decide to commit the data to the principal buffer at another probe location. You can use speculation to trace data that only contains the output that's of interest; no extra processing is required and the DTrace overhead is minimized.
>   
> diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> index 37beb34c2..3ecc55440 100644
> --- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
> +++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> @@ -1,5 +1,5 @@
>   
> -# DTrace Built-in Variable Reference {#dt_ref_builtin_vars}
> +# DTrace Built-in Variable Reference
>   
>   DTrace includes a set of built-in scalar variables that can be used in D programs or scripts.
>   
> diff --git a/doc/userguide/reference/dtrace_command_desc.md b/doc/userguide/reference/dtrace_command_desc.md
> index eeb45509c..a523fa6f1 100644
> --- a/doc/userguide/reference/dtrace_command_desc.md
> +++ b/doc/userguide/reference/dtrace_command_desc.md
> @@ -1,5 +1,5 @@
>   
> -# About the dtrace Command {#dtrace_command_desc}
> +# About the dtrace Command
>   
>   The `dtrace` command provides a generic interface to all the essential services that are provided by the DTrace facility.
>   
> diff --git a/doc/userguide/reference/dtrace_command_exit_status.md b/doc/userguide/reference/dtrace_command_exit_status.md
> index 97aaa7100..edec072de 100644
> --- a/doc/userguide/reference/dtrace_command_exit_status.md
> +++ b/doc/userguide/reference/dtrace_command_exit_status.md
> @@ -1,5 +1,5 @@
>   
> -# dtrace Command Exit Status {#dtrace_command_exit_status}
> +# dtrace Command Exit Status
>   
>   The following exit values are returned by the `dtrace` command:
>   
> diff --git a/doc/userguide/reference/dtrace_command_operands.md b/doc/userguide/reference/dtrace_command_operands.md
> index d5261b225..5b3e39456 100644
> --- a/doc/userguide/reference/dtrace_command_operands.md
> +++ b/doc/userguide/reference/dtrace_command_operands.md
> @@ -1,5 +1,5 @@
>   
> -# dtrace Command Operands {#dtrace_command_operands}
> +# dtrace Command Operands
>   
>   You can specify zero or more extra arguments on the `dtrace` command line to define a set of macro variables, such as `$1`, `$2`, and so on, to be used in any D programs that are specified with the `-s` option or on the command line.
>   
> diff --git a/doc/userguide/reference/dtrace_command_options.md b/doc/userguide/reference/dtrace_command_options.md
> index 86c41abf1..b04e61258 100644
> --- a/doc/userguide/reference/dtrace_command_options.md
> +++ b/doc/userguide/reference/dtrace_command_options.md
> @@ -1,5 +1,5 @@
>   
> -# dtrace Command Options {#dtrace_command_options}
> +# dtrace Command Options
>   
>   The `dtrace` command accepts the following options:
>   
> diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
> index 39b2ca6f5..6c48c1586 100644
> --- a/doc/userguide/reference/dtrace_providers_cpc.md
> +++ b/doc/userguide/reference/dtrace_providers_cpc.md
> @@ -1,5 +1,5 @@
>   
> -# CPC Provider {#dt_ref_cpc_prov}
> +# CPC Provider
>   
>   The CPU performance counter \(`cpc`\) provider makes available probes that are associated with CPU performance counter events.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
> index ef62c5040..45f30457b 100644
> --- a/doc/userguide/reference/dtrace_providers_dtrace.md
> +++ b/doc/userguide/reference/dtrace_providers_dtrace.md
> @@ -1,5 +1,5 @@
>   
> -# DTrace Provider {#dt_ref_dt_prov}
> +# DTrace Provider
>   
>   The `dtrace` provider includes several probes that are specific to DTrace itself.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
> index 885d59230..d4ee4366e 100644
> --- a/doc/userguide/reference/dtrace_providers_fbt.md
> +++ b/doc/userguide/reference/dtrace_providers_fbt.md
> @@ -1,5 +1,5 @@
>   
> -# FBT Provider {#dt_ref_fbt_prov}
> +# FBT Provider
>   
>   The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
> index a458ab284..105ad477a 100644
> --- a/doc/userguide/reference/dtrace_providers_io.md
> +++ b/doc/userguide/reference/dtrace_providers_io.md
> @@ -1,5 +1,5 @@
>   
> -# IO Provider {#dt_ref_io_prov}
> +# IO Provider
>   
>   The `io` provider makes available probes that relate to data input and output.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
> index 98affd838..c7259cd49 100644
> --- a/doc/userguide/reference/dtrace_providers_lockstat.md
> +++ b/doc/userguide/reference/dtrace_providers_lockstat.md
> @@ -1,5 +1,5 @@
>   
> -# Lockstat Provider {#dt_ref_lockstat_prov}
> +# Lockstat Provider
>   
>   The `lockstat` provider provides probes that can be used to study lock usage and contention.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_pid.md b/doc/userguide/reference/dtrace_providers_pid.md
> index c0c7bbb9a..0b11cdcb3 100644
> --- a/doc/userguide/reference/dtrace_providers_pid.md
> +++ b/doc/userguide/reference/dtrace_providers_pid.md
> @@ -1,5 +1,5 @@
>   
> -# Pid Provider {#dt_ref_pid_prov}
> +# Pid Provider
>   
>   The `pid` provider traces a user process, both function `entry` and `return`, and an arbitrary instruction.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
> index 6c1fa8ecf..1858ffcd5 100644
> --- a/doc/userguide/reference/dtrace_providers_proc.md
> +++ b/doc/userguide/reference/dtrace_providers_proc.md
> @@ -1,5 +1,5 @@
>   
> -# Proc Provider {#dt_ref_proc_prov}
> +# Proc Provider
>   
>   The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
> index bcc8c64d2..40e6a4858 100644
> --- a/doc/userguide/reference/dtrace_providers_profile.md
> +++ b/doc/userguide/reference/dtrace_providers_profile.md
> @@ -1,5 +1,5 @@
>   
> -# Profile Provider {#dt_ref_profile_prov}
> +# Profile Provider
>   
>   The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
> index d85dd45a8..5246df85f 100644
> --- a/doc/userguide/reference/dtrace_providers_rawtp.md
> +++ b/doc/userguide/reference/dtrace_providers_rawtp.md
> @@ -1,5 +1,5 @@
>   
> -# Rawtp Provider {#dt_ref_rawtp_prov}
> +# Rawtp Provider
>   
>   The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
> index f6d183708..0ac9af526 100644
> --- a/doc/userguide/reference/dtrace_providers_sched.md
> +++ b/doc/userguide/reference/dtrace_providers_sched.md
> @@ -1,5 +1,5 @@
>   
> -# Sched Provider {#dt_ref_sched_prov}
> +# Sched Provider
>   
>   The `sched` provider makes available probes related to CPU scheduling.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
> index 442911fc7..bc50ebe3c 100644
> --- a/doc/userguide/reference/dtrace_providers_sdt.md
> +++ b/doc/userguide/reference/dtrace_providers_sdt.md
> @@ -1,5 +1,5 @@
>   
> -# SDT Provider {#dt_ref_sdt_prov}
> +# SDT Provider
>   
>   The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
>   
> diff --git a/doc/userguide/reference/dtrace_providers_syscall.md b/doc/userguide/reference/dtrace_providers_syscall.md
> index 880b7de69..7e8637c2a 100644
> --- a/doc/userguide/reference/dtrace_providers_syscall.md
> +++ b/doc/userguide/reference/dtrace_providers_syscall.md
> @@ -1,5 +1,5 @@
>   
> -# Syscall Provider {#dt_ref_syscall_prov}
> +# Syscall Provider
>   
>   The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
>   
> diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
> index 766709af2..c9691c339 100644
> --- a/doc/userguide/reference/dtrace_runtime_options.md
> +++ b/doc/userguide/reference/dtrace_runtime_options.md
> @@ -1,5 +1,5 @@
>   
> -# DTrace Runtime and Compile-time Options Reference {#dt_runtime_options}
> +# DTrace Runtime and Compile-time Options Reference
>   
>   DTrace uses reasonable default values and flexible default policies for runtime configuration. Tuning mechanisms in the form of DTrace compiler or runtime option can change the default behavior of the `dtrace` utility. You can find more information about the `dtrace` utility and various command line options in the `dtrace(8)` manual page.
>   
> diff --git a/doc/userguide/reference/dynamic_runtime_options.md b/doc/userguide/reference/dynamic_runtime_options.md
> index a42ed3e7b..3ddc244fa 100644
> --- a/doc/userguide/reference/dynamic_runtime_options.md
> +++ b/doc/userguide/reference/dynamic_runtime_options.md
> @@ -1,5 +1,5 @@
>   
> -# Dynamic Runtime Options {#dt_dynamic_runtime_options}
> +# Dynamic Runtime Options
>   
>   Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
>   
> diff --git a/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md b/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
> index f978c7825..2fd22c5b8 100644
> --- a/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
> +++ b/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
> @@ -1,5 +1,5 @@
>   
> -# Setting DTrace Compile-time and Runtime Options {#dt_runtime_option_description}
> +# Setting DTrace Compile-time and Runtime Options
>   
>   You can tune DTrace by setting or enabling a selection of runtime or compiler options. You can set options by either using the `-x` command line switch when running the `dtrace` command, or by specifying `pragma` lines in D programs. If an option takes a value, follow the option name with an equal sign \(`=`\) and the option value.
>   
