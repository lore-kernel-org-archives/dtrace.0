Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F61AF0C1
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568115; cv=fail; b=jQjb+AK0gWCa2rxBdcOYYLFPoJ+VJdycUHqWA8y2aFj15gj66Y3jgc7tP0Bc8qrXQi9H5QMuTIWTHYcE4okA1GdOmDqKZ1q6PesJ6E58zhUIkTywD/Osynoy7uKyC2O+ifajJ9kbDDEJM3jn6ZkEE4UKrGBA8CdOJEWTqGMmuaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568115; c=relaxed/simple;
	bh=YAuYCK62ewKfkBhNlirxlzcfAcQ+tw/AQEbL8Aw3hjI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dbLjSikTX9pXNcmCcUdnhBLhB8RQo068guZdWKrGhdNZJ40ZC491M0T6NSKO7Xt1KdEO3jTVvPoaJuHv6MRteU/zHS4ctOtNIwFlmunMq+PqdqVHI+JRV421dXqKuvbxJl7h20dpIqRKn20eJ2xzuP/qgEBGqRitmZygJN1QaYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PxppE4kJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fay3sdbt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PxppE4kJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fay3sdbt"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ3J3009458
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 18:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YFQ60PtJM7Ejdr/sFG1MLueYSReApKw5bOLeoZ6hzYU=; b=
	PxppE4kJ4cJEWTgLbgQUJNekEoLZmpDrtycf156wDg7Ozk8vm2IldtQohsiw62Gy
	zyE5zw0GUIoUxpumVzjL7Ks+S4vxfPAEmZBRcpupza6/cAfW4A7nYpVYUCtBs4JQ
	wjguOvc36PoKj5NfwUE9oJMA+WF51DN1+fhR0/CEwJBBbeYl6jSy07LB4RrrIK0Q
	N+C9oFNUb0OFvDoKJukrdNp52WZApY3zj0Ns3YcnZ9MR+dKbzd3CLhpAYUmuXEKF
	LFqdIGC1TWWusCXbfRPGTyF4djyK5SAjAtff5DTQRIqee88e1BN6ryWUY8vHLnDo
	q7Q4Sfry0iYYM5CaI6RZWw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w9hr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 18:41:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563HB5c3018847
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 18:41:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucyr5h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 18:41:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rf9Hc/uKPoYiu0IcDDWs7ecU9RdCxnRL64w60j2gVx5AyHdm7jWtFYFSPKX3iNmbNXPnI0Yi6gDWjAaqDFfoOBIOVXOriZzNRaMG8B4L8OR8XxJbIVMTVr1Lza5rxi1ijmz075xQikAe6lUjjMYRkUJkqvdd/YujCcSJ8embLFpw2KReowyZOu7/qwoJVBBFbZiruky7WcEjmamc2XGm61bqTgmra9kAXOmiTBfBZHy2cLPI8MLIBPSq9fpK7p5G3IrGIZ1Fk2ox6jge8rak42p8Yh6nf8KSEX1rUuwzvWDdx7VVKlpsBu8QnqlMnURR5cyOCj69FE3+VwLxATKB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFQ60PtJM7Ejdr/sFG1MLueYSReApKw5bOLeoZ6hzYU=;
 b=D5b40dLDsc4WFv+MX2JzqTtOIa1TK5/idOcoUqbyPeaW4WZPb3Po1pKhQ18p5xmPZ3e3ylUaT4tVPqSTzltqOc8RVfb8CFl69i7dYA+mtT0D+QQVWI/3oicz5EDK39LvQ0QQDREoeuXBWeuCESsFMOJB7F/L195i0taWPd999DghpnXz5Li/h+iTH9mjm+w0zwpsKAsTzpo+tFHahPzh34vOetBFoZDKsj1nPV1CQBf7Ha/RrrZKiUK3pYqVA+gu2XC6N0g56+SfbR9B+NjZFwOWn2Nzhapn8+DMWi/g4xDlFzUAQsaKMmOqqVMtjcc15jhnJMdhajrENNsQDWwaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFQ60PtJM7Ejdr/sFG1MLueYSReApKw5bOLeoZ6hzYU=;
 b=Fay3sdbtzDfMIbvwUGsn/EleREbCvMch8HwABAKk05PcWwCUvDBg5UZtv15Uwmyh/oLPIYJiU6BLt6I7mvfaeaEXNtJRmZ6N3tHxV69HsYreYI/WSwODG4s1gjqQPfnTalHhC7NFy0wZYEaL880oBVK8f1FrQOYJoA19H4yqibo=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DS4PPF8B03CE791.namprd10.prod.outlook.com (2603:10b6:f:fc00::d30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 18:41:47 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 18:41:46 +0000
Message-ID: <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
Date: Thu, 3 Jul 2025 19:41:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aGbLTOzqILN+3J93@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::8) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DS4PPF8B03CE791:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8ba330-b914-4029-58be-08ddba61438d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bldMNVpwY0dQR3I1d293RVJXZXFOamNiWitCeXkrRURiT1ppQW1UaVNIdDRm?=
 =?utf-8?B?dUxjd3gwcEQ2NEVqbG5TZzNZQ09OUVJSNlk4bVU0cDBqd2h1MUpGSjhua2Mw?=
 =?utf-8?B?UzNYeWF4Q1VjMXhoR1dvcEtKZnRjdHdORGNHQmhoUlc3Qkx3UnhObTcvL1Fo?=
 =?utf-8?B?OUM4S2lQdU9uYUdlc2k5YjRxYlNielV4dGVSRitycDVJK0NqRmMrRlJsdGNq?=
 =?utf-8?B?Uk0zRGNweWRZSjN4bmRFSEpvNmZxWUtTTjdNaWt1MUZHZUJmaEZEOTA0VkQ0?=
 =?utf-8?B?TERJQ2xXV1NESGhUcVd3M3Q5eVVuZTFPbytBa2FwbjRLV215MlVwYlJXOXE4?=
 =?utf-8?B?a1pBWWJCcVUwK2xsKzZKSHN1dWhua0xIOTVKSHlxdzlzbk94a3VKZFArRnZI?=
 =?utf-8?B?Sy80VFhydDh0UEFhMTZmMXhzMXJWYzR3c291SUVLbHhRZjFPTFYybm5RSlJL?=
 =?utf-8?B?VXFOb2E0dnpnN3Fta2hGalBQNlB5emY5ZmlyV1UvOVNOZ0grNlNyU2cvbFEy?=
 =?utf-8?B?d3VGSzl4UENLSm5LY3dkRisyYkxodHZWRFVNZmVuQ2ZXOHpxc1VNbklZVkhw?=
 =?utf-8?B?bGd2TGxrNG1mNEhmR2w0c0k3cDQyRU5hckIzNXgxeXBGMWNnNFlPRWRpM3Qw?=
 =?utf-8?B?cDdxUzZVWUV0bzdWY3pJamFtd0VBN2gwWGdRMGMxaWJqaC9Ib0doWFNkMW1G?=
 =?utf-8?B?VUNZVDQybnIyUzV6U05QY2h2RzFUcnFOQzF4OWxjVkppbDZ5NGJ2cWRMRVgv?=
 =?utf-8?B?R09yRjJUdE9OeG11MFlWK0RvbVhLYmNMN045OUh0SW5DQy9DQ3dXdmsycDJm?=
 =?utf-8?B?bEVpQ1VZZnE5Y0NJd0M5a293QzIrNlpvbFl4aWhQSEROQWloQVFDT1JVYTBZ?=
 =?utf-8?B?YlJPb2c3dFZ4QUZnRGljTUd3YjZjbmNHOXNwS3ErbE1USzZpajkweWlUTisz?=
 =?utf-8?B?MkJyVmxqbWR1TEg0dGF0dkdTTUV2eWNnb2RHY0pGNTUzOEJGS3NYdU9Rb0RN?=
 =?utf-8?B?eE4vb0w0Ny9oNDFNQW1UVVlVanhESWZaaW4vMkd0UUZud3ZPOEJxM0ozMzk3?=
 =?utf-8?B?MmI3RGozZjFWWVh1WDBzY3N0Ylg0WVlHbVduTGgzTW9MN0dNQkx4RTArd3VE?=
 =?utf-8?B?OWtvNjVNeXV2LzJmUzVnUXJadFlpSmdCbEhURGRyeW11VXhnTkFuTFJrYnBB?=
 =?utf-8?B?eVFtSmpkWGVzVGdOem9HYm9MNTZBbEpBQ2ZZNUJPSUN5dm8xYThKYzhQY1ZQ?=
 =?utf-8?B?NU9YcTR1Yy9vVzRmc2l4c01mcUhSQUc1clZsQWY4b1hWSVI4akloOXRtZ25V?=
 =?utf-8?B?QXRWNzBzT0Y1cktBbmNXcU5iSmpDcHljNThjQzh6R2VjU3F0L1lyK1RaZHZQ?=
 =?utf-8?B?bnYyaEZISktyaTZ6K3F0b2FUcWs3TTRHMEwyUWpaKzQxNmV1cjY0ei8wdzlZ?=
 =?utf-8?B?dmdRbmFZSVN5K0wyVWxXaHVwK0xqczlrVTBMc2pDYnJCMDJ4dHI0OVIvM0N5?=
 =?utf-8?B?M3pLTENyNzRHdFF5VjVINWtlZWRmZ2VyOForTkoxbm1pejk1MDhMeXRHVjBF?=
 =?utf-8?B?WU5pNWZSdWN5alBmc3ZFSGcxL0lVdWFwOC92Z2FqVkVwZmpzajZ1MUJsNVVs?=
 =?utf-8?B?WFFaeGlrOFdqL2ZPRkV3d0doY2VWU2hxN2JhYkhQc1B3aUc3MFhlTHZ3WFFK?=
 =?utf-8?B?OU9ESzJMN014THMwMXZNWlhoYnJPbVI3Wm1JVysvbGhYZXc2dGdhRDdkTHRS?=
 =?utf-8?B?Zno1TFM0WUtmSVpERk0wbEdiZ2ZPZk5MMHZwMFZNVm9TWmtVT2R6MFlyeFRI?=
 =?utf-8?B?RmtXRzdzWStUTVJ5eHVyL3kvVjVKVmsybUk3YjBFdUZwaUlIUCt3eVpJVStt?=
 =?utf-8?B?UTN5YWNpTVZCektFbVdTUVpNcXZxYkVCMlBld0FqakpPZVdHTG1ZTzAxREFs?=
 =?utf-8?Q?tbz7w3F9cNk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bnFDTEFtem92THUvY1BoRnFRS3RFOUdiMUFxcjlIWnkxSTFqNFdiakdhL3Az?=
 =?utf-8?B?MXZjQ3JMSUtuTWxqREYrRUh1TnVoQi9aMVVETEJGbUJEaUR4THRVbjhOVHRh?=
 =?utf-8?B?TFUvdDFrTmJ2N1dteURRVXArZzZyT1pTZkdnUEVwL3QwL0FGMXJwN1o4aWpF?=
 =?utf-8?B?UFluNjQ4czNPQXh3dDUzTmZKSUtVYzVwbWltTHFIeUtIREpIT2lzQ245QXVO?=
 =?utf-8?B?a3JEVTBRc1lJdm9aczNMU3h2cmpJcFJSSnhPS1RZM0tvNzM0TlowSGdGT09L?=
 =?utf-8?B?dTIzeUFRNFpYSjgxM0dqOVRjVm5MbkFueFFFMzZJUnhzM2Z2SUxXdGVsUEho?=
 =?utf-8?B?ZHZRcmJRNUN0Q2NsVHJNRmk5YkE2M0N3OVlRVWg3dWNZekZJM0daSzRaVXhj?=
 =?utf-8?B?N3VMdVNpNFhnM29HZGJ3bUNjdVcvKzRMRlZ2OGNPMyt6dVVmZTFkQnB4WVZi?=
 =?utf-8?B?YTBVWC9wZ0ZFTkpHU0MwRThBUXhSYmFOd0ROU3U5a25KZE8yQVdwZUtpNFJU?=
 =?utf-8?B?SklYa1ZKMjljU0QvVVh5QUNSaUpBVHM4NG51d3crYWh0SHZzOVVDSm9sVVVp?=
 =?utf-8?B?czhCU1ozaVVVR1czUndIQ0o1N05lcUptMmNFbHUyVXo4RXlDMjRGd296K1g5?=
 =?utf-8?B?Ymt4eXVuWGRjaUZEU2FPK1NaQTc3eTA5bHE3YkJub25PM1k0eGNPc1VPUHdp?=
 =?utf-8?B?R29CZzQ0NkQvWnhGbGVmU2g4TGZwMmtEZGRxeUt6MTNJVERTaDJsOVEzWjFT?=
 =?utf-8?B?KzhaNVRhclVnN1J4NnZBN3JpYTRiQSt1eW1ueVBJOUVYd2V3Q2JPRkVUVDll?=
 =?utf-8?B?bENrVGg1NEJTaDN1eEZ6UUdaM1pTUktteUd1UE9nTWJzdTNlQTZtclVFeXBz?=
 =?utf-8?B?Y3VWSVUwaG44TVQwbmEwYzVtMUhyT3E5WFlBbFFLdXd3YUt0QzNHRlF0RTFm?=
 =?utf-8?B?MUtxVDF5NEoxa0YwZ2tpQmZlSXBwWTFNZFlQYXZUQ1ZNeFhibVdISVBvQjcr?=
 =?utf-8?B?SkMrZmYzWW9TYXVWVkh2VnVuMXZnbVh1aUlXcmxPVHg2aGRMSkxHdEdhNmE0?=
 =?utf-8?B?ZkNFem9Ta1dpR2FvenlVWFI4UDR6bE1DcXY0VlVxb0JYeWpzVHBaOHNpSERU?=
 =?utf-8?B?LzNpSkZkeS9aVHZHMnFoWkdMWmw1d1p4MWZKcXF3U3FCZ1RWOFZHU29PVXJ6?=
 =?utf-8?B?Q2N3NmJmOEI1WnE3VUplWWVkTXBKT1dQTmJ6bmRaZGZpa2M0bWhOVWlyOUZP?=
 =?utf-8?B?OFYwcE95bTJ4RXdUY0RDZUp2em5iM0taTWJGVEV2bldxNUpuTzJLQzRnVmUw?=
 =?utf-8?B?S0MxVnRmaHFoZmVsa3VXbTBOcXB5QW5EMThxVU1lSXI4Rkxua2NaLzJKUWVL?=
 =?utf-8?B?UEpLbWhqQlJZNUh6TDMzQm0wMW9pRTdod3NpNGpYSk1oL1VTUlB0ZDVDQmlx?=
 =?utf-8?B?V2FzWUVnUzNNS3hzWFVwTXdHZ0JFMk5CaHlBdk85bFYvWjAxZnRzS1dyYlk0?=
 =?utf-8?B?bmh0SEdMa1VhbThsRzU5bms3a0laTWJjWC9ELzJEYUxJRHRacXh2Mi9Hd0pk?=
 =?utf-8?B?ci9DbTV6NTR5cysxVGcybnJ2VkJMRUQ1bkg2alFPZy9vR1JFdG5wKzhRS3d0?=
 =?utf-8?B?VVNDMHk0UGxsc2hoMmpjSnpvWmN2MThHNHdwVHRVT1lldzNRR2g1WVo2NUpP?=
 =?utf-8?B?WjJsbDgyMjNXKzBicG90dU1jRHU2cWVsNzhyc25hV01xUGFNYXlzQVJQWWVG?=
 =?utf-8?B?N3kzK2NxWjV1bWZUMDBSL1hUV2QyRUZBY2x4di9yc3NBbWNFZGtUbG96bVZW?=
 =?utf-8?B?OFRvOXBRQTlZL0F5RVJlVHNyTTFaR0VOUlI1anVsRE5SUC81RVUyOGZZb25N?=
 =?utf-8?B?YS9VdzhnMGZET0NSa0l5M2txQW42Z2tVdVZSczROSTJaTHQreGx2TUcxYS9W?=
 =?utf-8?B?Y0puSVJUSWo2bUlnMGN5TzVFdkt1UUpxTmVncFdDL3hOOVh5QW42cEZFRFB2?=
 =?utf-8?B?STdGQUZUWEw2bmNZNFlOOVptNUI3OEJSdDB5Z2VDdVhnMWtuVXVSMldjbWxl?=
 =?utf-8?B?dVZiSUR3MEx6SFZLMll6V3ZTZEdtbGlHTDVzSS9kK2Urcy9RSk5ERmduazlt?=
 =?utf-8?B?Q2FDWGtyNmt1Wk0xVERzclJZOGpVZzVzNW1IYThDUEMwZnNRQmlkbndlOHRa?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 pemn5Jn/ThXbfEqJ7Psaq58VLMLX6DGX5IVus59XrfCNUtWZz0xg9opWQw0S6S/XC6RWqxk1On/V4DVQSfo7Y+6dPNF+Uk64YG9ubaGhaM8LOVY2TxAn0uSGzuZ/ce5FRDBqNID8nicZdFbJBLDNq7KDrRNx0IIRfH5AN+Ri3RHv9X+UIa86s9iqslafdiG2gvfdlG31uq9mCr8A41oNAESzuFoGQXo1s3ESO31zlcACHgocD7X0dlhkp2WAE4XKPziMmW+Y2cOyLk7bEj49IG+u0TpyHwmnUuuWlAmAeUE4RCpqpO9sb+2ab0j91t5bEc8VUNjHXjvj3AAzF5oJM/Yb2qHOMbnYB+tFdBX3w2kqYePFpdpZ3U+uCRomKkw2NPdVbbY0e8E9qhDULXlW/e+krY7Jsg3qbV1Z/q8/MGQFHffzlss4Nuh9u0kzDJngFrRWM4jfKSYvVw/cYNA2rTrKP7jPDEQsXUNFDCenDw7rpyWoPehTJrkmsMaC6dLJUyLjdmQq0EM3GDAgUmU6HqYN05xhWJzAVaJGC7YDeXF3onmPjbf64S4Px9TR14SOUUA5VW6IGhmMeYh4+JKUUQSG9mp+iLo9nTffbda/EjE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8ba330-b914-4029-58be-08ddba61438d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:41:46.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwwsawKoZoWhElMGNh94iV1c01zzTPjlhnd4pSlskMOlTYi8MkX02KHuihDbeSZPqsATTERm+xn9a187DsPK/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8B03CE791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030155
X-Proofpoint-GUID: ybD-NJPI7b5C1o0oGD7Jp4MOoNJLqs22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE1NSBTYWx0ZWRfX8897/b/A2rd2 PEaQapQua9y2NCW1MseQkYS+dRK+xFoLphIEs4NKQ+0Za4Q7kaKr/t0UJ3t0w5yKdmiPUSmBag8 Rc0Vif4oSougMdJGloQtlerVAxNLWbSCzOC6z4kKY23UZANSere3t2u6NzBSVj33P/J1je3TTRm
 mqf9+Nx1P0gjGPXhnk6Fiog1JpPd4Ax/UAixnVk1yF+mJ0myQNabE1i9JP7D7AKqUmYXjNSrS5O ns36Z3uH69xqhZGxN+d/nXoc2B+YSiFiPiyz0I0b6HL+aFBUYv+IAkAS3R4+n51tI+n5RRM0zbg 3HLZTlIKQdVEz+eZ8g3DtWcUlWg7RSSwOwdKjfRWEgtsNyH/sRC7r4yMtC+zoz/+F4mLE3Qruqf
 op/TNcGkkdk9+VoGTx9UQySzKcoe76/irigiwtrPiZXilDaLjtbIRT66KY0N3BD+xrxeLupX
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=6866ceef cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=U7hbXFxA-5kJ_uHGQXcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ybD-NJPI7b5C1o0oGD7Jp4MOoNJLqs22

On 03/07/2025 19:26, Kris Van Hees wrote:
> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
>> On 03/07/2025 18:06, Eugene Loh wrote:
>>> On 7/3/25 12:59, Alan Maguire wrote:
>>>
>>>> On 03/07/2025 17:43, Eugene Loh wrote:
>>>>
>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>>>> patch 3/4 feedback).
>>>>>
>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>>>> send probes?
>>>
>>>     dtrace: failed to compile script /dev/stdin:
>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>> inet_ntoa arg#1 (ipaddr_t *):
>>>     Unknown type name
>>>
>>
>> Ah, sorry yep I have a fix for that one in the next round. Basically we
>> need to add it to the core set of typedefs and add a type for a pointer
>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> 
> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> this I believe?
> 

Unfortunately the #pragma include doesn't do enough; it just defines a
type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
typedef to net.d and doing the pointer lookup/addition but that doesn't
work either. Seems we need the core typedef + pointer addition or we hit
this failure.


> I'd really rather not add a type like this to the core set of typedefs we
> can avoid it, because it really isn't a core type.
>

I can't see another way round this currently unfortunately.

Alan
