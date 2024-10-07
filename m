Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F01D1757
	for <dtrace@lists.linux.dev>; Mon,  7 Oct 2024 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307145; cv=fail; b=oLVQJxXqRi1S+PYepoWdORmdyJkX65y4O/eGiZIxqmf8hKD8GXN7McYkLXS0kMrvuhqkHRmo6TE/mGhR+PG1excdi2TfZ57Cab1iXdDS5d4yEmkUrRyidUvLnS3B01h8wyXFlkGGmhpjEe/+ISrKqQ1Rf9k1zjBD36rM1n88aKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307145; c=relaxed/simple;
	bh=KF757twc4NCdPWqaEGFe6YUP6uq2Uw5vnUY6R7DLgcE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TrPoKk5a0FhGjIvCoTCj06Oo6AOYrq0oEj7iD4meR0S+UynkjDtewgpBmrzr8bl580u6xzfXNs8J8uN1mJwUxjf8Fok1Taao6UDC3BA0ZqKj+PzhHk/VRfXfZ/TnHS0kMAs2oF5YPX+1MiY07DMB4Idf8vhskR+JyXFMAOvWQqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jDurXZ1a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rxVY8BHc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jDurXZ1a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rxVY8BHc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497ChH8e030648
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 13:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=BQwx1ax7btPktiTNMM0uyACt8VFmJ5SPphUra/yhsxY=; b=
	jDurXZ1aO+Yk/Cam5U89OeHqCVWPLwcpIEPCjNFG0IbnxOWJYr0FYB9vSqalJMgP
	UvUHBEJqtj2Y4rU27p4Xss6SQ4HrkU3tC03qsdXMP1Mi9Rn+GY8wBlb5OIMRE2VV
	92u2GQMNIto2sTvkCoHST0VHWqUJCfgQNFYYEWZE3dS/iUD2CVxg1Tvm3pbM0H9z
	jFYrNJRP4lULCdKio4q7LUqp1dagNNtc1dPuWi+Gx0oKXJiXxPlx0bke1EQTcWC8
	9x3RUnEB1F4mfkZNeOQGab1cLwY03Wk1CbPV16l3roqS14ZVf4qBWrv+VUnsuqSi
	fYqZDreI/eCkNc3/lq6wLw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308dkah3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 13:19:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 497C6cVU001191
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 13:19:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw5sjpg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 13:19:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjFKzSemmvC+JYQNXF58p6nng1NwllTEtxlH/T0gfykfFYG/Sjbwpr58/RTnvoVo/LHj2GZvDVKFM+nUU+dcfEY4unCs6hrdLKIlFwwF+exRdxvB/zQuUg6vQsWlyiSDFfUFq4QZIemeHD4/658viGZrAC+/tArm9uDTlK+XX2XeIyy7RQTLjY5LWN1r0G4891G02zpgU540R6wlie6aAA6IaBPDM2weTre1s8brHp91M9gtT81G1zBmXFHKJcNrVssrvESL+u1oOTq3Es0Lp1ws9T4/JgeUsHqWzub2/BSXNU+myq70bymzHOPKJdKimKZXaCBHq+PSkzdo06bPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQwx1ax7btPktiTNMM0uyACt8VFmJ5SPphUra/yhsxY=;
 b=ExGTLl4ozRIdOZ4dwanQE/AOLWbDVSecELCvu3V95U+cg9AQ/5W1rQET0n5YAgZSNS/kT/mdonD+cPt/t4evOuLgG+puev1zTmBtJfykOb+2rwHUD/DU0kz77ZKiuDdzQbAa5SSY3gOqu0qNDBcTnSzB76RoHT904nvprtiH5qVSCR8GhF/QbVE0rhbuHCy7t4XP1szgIBx3+skhHHRiG1IJFhPMxu4+rHPrzldfW2mqG8DoOKw/mpoYkCpTNrcyPPBHIvkdHHlAnjqcLqjFFGLTtAb2/R0R7EBJrhZBo+mkUFowdjgaBuL5PWey2RphomE7ebhCzlnIcD3Zb/BCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQwx1ax7btPktiTNMM0uyACt8VFmJ5SPphUra/yhsxY=;
 b=rxVY8BHcJW7J8RGinxJL9uVlKpdCLktaa20Nd2tDaDvz7RfNo9MBC1iOgfjiJspOo7DJz1PnzfuJ3ZRoOMXF7Ggvo9EyKsiZ6DOdBIn/TEpdnhzEY+Fp0hHyETrIAt4kVSfru80YVux+9pnxIzhepv9vYB95j8pBuiqDMRH26d0=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by MN6PR10MB7441.namprd10.prod.outlook.com (2603:10b6:208:474::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Mon, 7 Oct
 2024 13:18:50 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 13:18:50 +0000
Message-ID: <d56dfd99-83b1-48e2-b4d0-2dfd92b5c21c@oracle.com>
Date: Mon, 7 Oct 2024 14:17:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: sdt provider and access to the trace_event_raw_* struct
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
References: <9253be47-c9cb-4967-a090-cc1cb1f23c91@oracle.com>
 <Zv_7try5KxexkrVy@kvh-deb-bpf.us.oracle.com>
 <2d1eebfc-d0ca-4fc8-b6c5-c8fc3a37faa2@oracle.com>
 <ZwBAftV8Ov3FG2jr@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZwBAftV8Ov3FG2jr@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|MN6PR10MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c595a2-be42-4223-bf66-08dce6d29516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnpvWVZHaG02OGM1blFUK2o1WkZuWXBMOHhWM3hHUHA0WWpVM2k1d09aQjlL?=
 =?utf-8?B?RCtHcXVndldhYzluOVRKay9wTXhtWUdIbFExR2R1KzdoMENTeVZEZkhuU3NF?=
 =?utf-8?B?UGhKRXVUdGVZdDM4Qk5jaHRKNDdYaVNvaXpiMFJ1VkVXcksyaURZVnZWY1d3?=
 =?utf-8?B?VFlEL3BmS0s5c1QrcGFlT0t6YjdPK2lqbjlnalNXNzZ4blo4QVZWM0QyQXVT?=
 =?utf-8?B?UVBTb1BFKzRZSTBlWHVnOWpwQUc2ckVpT2xGVjhHZUM4TXhkOEkycnhyOW14?=
 =?utf-8?B?S09MdzNHazdreEFIaHhnQlEvVEFuUUJKTUtWSzhpbFVCY3l3VGM4VXBuYlZk?=
 =?utf-8?B?SWwyVnU0MlhBczZUQnhKaHBvL1hZRXpHU3czb3lEeXBlSWZlS3gzV0p4d1dh?=
 =?utf-8?B?UEdPZVhNeFp0N0V3R2ZQSWk3aU55WEZCeGQzaHhzeEZtOU9Rd000K3dmZDVD?=
 =?utf-8?B?Y2JxZVhkVWoxcUNTYkt5UFRSMTU0eDNGeC83aE5ndGFTcGtCUm1qclVZbGty?=
 =?utf-8?B?aGdYQ012UW56K1ZiSXVTRlg0UHpnUEJJZjNJMUsyckdoUW9UMEMrS0IxWjR5?=
 =?utf-8?B?SURRdnpDNU1USGl0QVBkT0I1VnJudVJETFZLWERoM200V0JUeHdxZGxGaWlU?=
 =?utf-8?B?TFJURXRzNDJQaFRSRS9ocEY1anYxRWhWOThMTWJqelAxVy93MFhBK0lyK0Rl?=
 =?utf-8?B?OGJQeWdSMDlLcXZCOWtqeDV6R2pUZG5Wbyt6Z29YYmZtYkRySldGQjZvbG5i?=
 =?utf-8?B?OEg3OWNBQXNaTTRneWxaSVVFY3RYRzUzYUU1N1I0ZVRRaG9hejlkT0N3OWpl?=
 =?utf-8?B?V1prUTQxMFpubHBGTzF0V3ltaW5BdlorZ0E2N1hLS1MxQzJzK0dvV3Z2b1I1?=
 =?utf-8?B?bTJobFJ4akpRaU5LdkMwQm9Gb21NL0p1MDg3Vmo5dlRQWE83RzB3ZmFNQmI5?=
 =?utf-8?B?TUc0dFlMTC9CcFR5NDBTUXNXa0paeUt1NzZxeVEvYUNiVnJNWE1oVEt3eUUy?=
 =?utf-8?B?bGJ5UFJETldpM0hWZGlaa1VLWXlTT2s2bEd5RnVDMUtIK0ZCVzlST2JzMHRS?=
 =?utf-8?B?eTFrTHpEcHN2eDVUNXl3YXZmOFpkRmY4aUhFMU9oOUFTeFcyVnhQWk53emhI?=
 =?utf-8?B?NmhKUXBXRnJ3RlRyTzhqKzF5OXVOVzNiRlUwZ0FhTVdZVUlNYlpjakhkbEJN?=
 =?utf-8?B?ektTYlRRVVQ0VEhvQ3dsakNNMzd0aGk3QXdLbTJlOWFQOVVBYW1JNUNwR3BY?=
 =?utf-8?B?OG0wWEtXMkV1NHBkZmJqa0dqNlZqTnJxK2NTVk5VTWZYZEJHNWlOWHB6OWc3?=
 =?utf-8?B?ZTNXVGU2TlJ2RWpxT3IxZitPUWl1ZERWbnhqc3hCakptMzd4cFd1d2plUUlo?=
 =?utf-8?B?emxMTHRKSlpoMnBaSDV0RDNBR1lQWDlQTzdzVzJEOE51aXZJUUNhU240WVlv?=
 =?utf-8?B?TFZQVHdpcHdnL2RwMEhGclQycmlBRDVPTjhGZG15bHhLODNGc1hxTDhsSmJT?=
 =?utf-8?B?QmhSN09uNjB5OWlRZTRCS2IyZVBuT3o4MVF5QnRqcTBkS2loc29qSzUyT2pL?=
 =?utf-8?B?WFZYYUF3K1BhaHB5ZlZiZXM0bFVoMkE0U2x1cTNOQlJmd01lOHg4N0swS3hY?=
 =?utf-8?B?Y2k1blhWUkwzK0swR0s3ZWQ2RFgyRVFBcWppWjdFc2RGUW9NWUNUNWRiZDNh?=
 =?utf-8?B?eFJUb003dzZpQ1p1eWpoTmhyRkJUSjBaQ0NzS3VRTmJFZGhzL1l2LzBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlB5RHUzaDRSOVpoaSttWDVZaDQ2UUFSTm5OdW1BakhVSEU2VGxhbHN4dHJC?=
 =?utf-8?B?KzFvR3BQaW54YnA2ZU9qRWl4cXhYNUhkMVpSR2ZiZUxiNldrMUhESGQvMDRo?=
 =?utf-8?B?UHJXY2VGRVZxYmZ5WXcreGF3OGFZb2lEbXJRVlE4NTdCNHM1bW90b1k2V1U3?=
 =?utf-8?B?ZUx1bmRPNXFCbUJ0RG5vYTJkK0EwN0QwVUxQaXdtN1JUaVFBK3o5RndQWE9X?=
 =?utf-8?B?NGV2b0kzSzBLZklEb213NGI1dVBnbFZzMW01TGY4QzZhNjk2Z0g4aUZhdWhS?=
 =?utf-8?B?a0ZNdTZFS0VzSHo2Wk4vZzhrdEw3c0YwWUNTUEV2ZUovTmtEZy83anR1THgy?=
 =?utf-8?B?aUwvRkw0bnhmV2ZuRlVDZmtla1BhMmRZZ3p3NVB3SnZKdm12YXZyeFEzcGtI?=
 =?utf-8?B?cEhQcXd5SHMvVVVuN2hkUzluN0RpWXErTEI5UEd1c2hvT3ZTb2dXSmVDWTIx?=
 =?utf-8?B?aTZxRklPMGpuRTRHSUlNWE04L1psVEJ3ZmRtbVQ2S1kxUEd0bmIyWHc0TEpw?=
 =?utf-8?B?SDYxL3U5VHBRbTFJcFZKRHBEZXIyS2VPZEZleTVYcFozc2VyQ25PSUQ1OE82?=
 =?utf-8?B?ODAxeks5dnI5Z1BDU2ZHOVNpUWVDS2hmY2IzVkdFcEJnN0R5R2NKU3lWWDNz?=
 =?utf-8?B?WkEvOVc5U3hJZStXNytjS2xkS3d1aUVnUk9JQjJ0OVNDV2czbitaa0RDd1NQ?=
 =?utf-8?B?bWE0cGF4UFpxOFM0UnpENjZSa2JlWnl1OC9KQ1FMb1owY0kxUVB2ZmlPMWhi?=
 =?utf-8?B?YnZCMEd6N0JWMFpWSWY3dzNkckFiQ0E1R25uSkp2NmtUK2g4VnRjVGpmWEFQ?=
 =?utf-8?B?aFkrRnl4VC9pWkYwc3g2TGhiWnlWYlZMTEdtNU5pdUl1MG5OZWs1VkRONGFT?=
 =?utf-8?B?bGJSRUpDQk9SUnJUdG1rak1CVjcweVN5R2RkWHRianVLT2YweUJ4QUMvR05J?=
 =?utf-8?B?NTZjd05QbmV3eWRPcS9uMndmMU9RVmg3SDBnaU5OMUtrYkN6K3B5K0RScXlu?=
 =?utf-8?B?bmxCVG1BMEp3T2xCOG5xY2xVbjhOaFhteTlzN2plU2JycFVBc1F4QXVqUE1T?=
 =?utf-8?B?dDVKSUoxdmlIWUlVV2JLaFFvK0VrMmlWTzJ3Ym9uN003cEFuL2hxS2lqaGcx?=
 =?utf-8?B?WWdSQUkxL1dmTTBPSHpLdEt6V1ZYUERaeVJ0V1lQaTZTSXhraXh5WFIzY05H?=
 =?utf-8?B?RWprL1ZzRnFtYVpEaUdIVjBDZXM5YnhxZEhhWndDVW9lVWNmTXJ5TnRoNVpP?=
 =?utf-8?B?b2VhelpVaDZwZ0pUU1RGOXIxTW1RMHF3Uks1SUZObmpTTklmUVRGbUZnVTZ0?=
 =?utf-8?B?V0tGZmkyK21DdGhMeDFnZmw5UVBjMS9QcDMzclUxTmhIVWNZZU82cTZxbW8w?=
 =?utf-8?B?WXBLTUpreS9relZiZWN1aHNsVTY0eXVHTHZNRUlOeEpqNUJKbEZBYzRrbDBy?=
 =?utf-8?B?VkgwWGFVRDlLVjY1UitGblZJWEtQOXhIOWQ4NUtzTWNvdWV1ZWJqdm5FT1N4?=
 =?utf-8?B?eDZNWWxpeHp2b1Y4ellqK2I1YzRoZXEvQUVMdTRFQlRsUnAxdnllUVZZS2lT?=
 =?utf-8?B?WExGMW1PU2JuVXQwSzFMQ1ZhV1E1SUI4dkJ2WVFnaWxuQnJtSnhTWjZ6RlJx?=
 =?utf-8?B?OUpObjRtMjJNWDRpcUthNWI5YVQxNmZsZ2hURGhIV0JhRExrZGFiWDJhbXZD?=
 =?utf-8?B?WXBjcjdlSjFxSW1GNnFvQ2VSL0JSOXRYUG04YVF5bitTTThoL25HVExHemlJ?=
 =?utf-8?B?VVJNbWZWY042MmlTVWRBNUMzdEYwVW53bUZYeGNxMWZRN25GbWRkdnJyM3R2?=
 =?utf-8?B?eEcwOXZZTy82bXdwYkZNS2ZRTy9LajV6UlhuQThXazJDdVM0eExyM0Z5MEwr?=
 =?utf-8?B?ZFY0MlNSSmRmUE5MYlgwbVZUaExvbnRoaUd0VnFZWGNYeHJZUGhvTkNlbVRM?=
 =?utf-8?B?WGl2TnBZQm5uY1N4dHBLakpabVNVUEJGZzhwQ2JSUDNNd2s3cWprc0QrT0VP?=
 =?utf-8?B?OFJZNDEraUxzZEUxNWl1YjdaSElWOVdnUFg5SnlWcFhweFd0ZTJwb2xtVHM5?=
 =?utf-8?B?bEFFTG1YYWhzVXVJKzFTeHY5d0YvNkl5QklIdDVNZjkydDFKaHlVQ0d4ZVhW?=
 =?utf-8?B?THNHa1h2aEY5cTBtOXcxZG9MVitIajBsVkJ2VDdjbmdGTXZBc1BuRlB3VU1j?=
 =?utf-8?Q?HeFHJWkNZagbdEK9UNToVHw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p8/TCuJGXTmgm3AjYyUj/PzhWrhx/B+VMIcA6RSm5NuONZjPs3EfLAXEhwPqIKbU5Bn+huUTbbL2AR95k31+PHkvc1eHUkadfOX5Tq12xcnUeOWs0WIb4KsBZ979w1Xa67I2MNlBGoUTPn+NQT6eUXTo0wNJpprFkAfBgi4RbDOwZnV1VHrDIy0+J9x+9yUnD/b5tJuIOXvxkm9eDZDSF1vrcLtYbgDcwaZRM+xX4Atpm4aLu6mUrqWCHb5CakWziFhwoOkpKRDSjreQFbwkoLJcJ6crQDLi3FM+CJrkGAuV9Cj5Mac/z6sVTKpt9kWEIKW//eX9Bq9PPnIb6kXAlg/mdUG8qLus57M3g5Ga2PWkVNm8F4UXWxzjKdDYzutQL0xPoYt7YgUfqKvEkCVbTYWW7i2DKgPHh/qeCNgB2UG2QC/yKirIm9UXdi8Uy5b0tR7spSSFrs28AzpvjSrx1doylD8zLrBCOGglU4Yuz3thiKOVZLDYkkJ35AGXHTUkpTeFUi+dK/ZYRzvmOuQIhkwmSGGq+KGOJflKJLRnNOIe98eBjJzDIODQpcG6QC1QKa72qkjl7KqKhrVLS7KoqA2ZQbRIEmvirbsa/hU3gew=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c595a2-be42-4223-bf66-08dce6d29516
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 13:18:50.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0ewexijQUMIFm1Vg91FddiJvBP0kWgheJX4II1Cn3Eon5jfF7CQEVLqQoskXmJi0XN7TMKvTEP02trMkNqNDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7441
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-07_03,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410070094
X-Proofpoint-ORIG-GUID: BijGS8OBPy0ynxxK96ZZZwyDTEGqAJ1J
X-Proofpoint-GUID: BijGS8OBPy0ynxxK96ZZZwyDTEGqAJ1J

On 04/10/2024 20:22, Kris Van Hees wrote:
> On Fri, Oct 04, 2024 at 04:46:58PM +0100, Alan Maguire wrote:
>> On 04/10/2024 15:29, Kris Van Hees wrote:
>>> On Fri, Oct 04, 2024 at 12:29:35PM +0100, Alan Maguire wrote:
>>>> hi folks
>>>>
>>>> I've come across a case where I need to trace a kernel tracepoint with a
>>>> lot of associated trace info.  It seems that the current approach for
>>>> sdt probes looks at the "struct trace_event_raw_<tracepoint_name>"
>>>> structure and maps its fields into args[] values, translating each
>>>> member into a separate argument.  That works great for tracepoints with
>>>> a limited number of fields. However in the case of a tracepoint with a
>>>> lot of such fields (i.e. more than the number of args[] supported), it
>>>> would be useful to also have a convenient way to access the raw "struct
>>>> trace_event_raw_*" data, especially since we have access to it directly
>>>> via CTF. It's possible to do this via a hack, e.g. the following works:
>>>
>>> You should be able to use the raw tracepoint provider, rawtp,
>>> e.g. rawtp:sched::sched_switch
>>>
>>
>> That's a good help, but I should have clarified that I was hoping for a
>> way to get the tracepoint data _after_ it has been massaged into the
>> tracepoint form; the above will give me access to the raw arguments that
>> are used in tracepoint data setup, but I was hoping to have a way to get
>> a pointer to the entire trace structure after it has been assigned. It's
>> doable in my case (since the first parameter is always a reference) so
>> not a massive deal, but it might be useful enhancement for others.
> 
> Can you give an example of where it goes wrong?  I don't see a reason why we
> wouldn't be able to support more than the number of arguuments that we store
> by default.  I.e. I do think that there is a limitation roght now, but I don't
> think there is a hard reason for that.  We ought to be able to support access
> to all arguments of the probe without much extra effort.
>

sure; the RDS tracepoints are one example where we have a lot of fields.
For example the RDS state change tracepoints have trace structures like
this:


struct trace_event_raw_rds_state {
        struct trace_entry ent;
        __u8 laddr[16];
        __u8 faddr[16];
        __u8 tos;
        unsigned int transport;
        __u16 lport;
        __u16 fport;
        __u64 netns_inum;
        __u32 qp_num;
        __u32 remote_qp_num;
        long unsigned int flags;
        int err;
        char reason[64];
        __u64 cgroup_id;
        void *cgroup;
        void *rm;
        void *rs;
        void *conn;
        void *cp;
        int last;
        int curr;
        char __data[0];
};

So there's 20 fields there, which is greater than the number of
currently supported args[]. I tried the following

$ sudo dtrace -n 'sdt:rds::rds_state_change { printf("state %d\n",
args[18]); }'
DTrace 2.0.0 [Pre-Release with limited functionality]
dtrace: description 'sdt:rds::rds_state_change ' matched 1 probe
dtrace: error on enabled probe ID 2 (ID 120521:
sdt:rds::rds_state_change): illegal operation in action #1 at BPF pc 348

Experimentation reveals args[0]..args[9] work, but anything beyond that
triggers the above. Thanks!

Alan

>> Thanks!
>>
>> Alan
>>
>>>> #!/usr/sbin/dtrace -s
>>>>
>>>> sdt:sched::sched_switch
>>>> {
>>>>         s = (struct trace_event_raw_sched_switch *)(arg0-8);
>>>>         print(s);
>>>> }
>>>>
>>>>
>>>> ...but presumably that only works because the first arg value isn't
>>>> scalar. It would be good to have a helper or builtin variable to access
>>>> this pointer directly. Maybe there's a better way to do this, or maybe
>>>> we could add a helper/builtin to make this pointer accessible? What do
>>>> folks think?
>>>>
>>>> Thanks!
>>>>
>>>> Alan

