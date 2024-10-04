Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879A1E376D
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056829; cv=fail; b=QvsRJLrXQXo7e1pID0XQvY2Upar1DNftrcnJOtYpXtLVn80Fz8WsXMk+uUi7+CWKUksMSO+QlcVhhWgY8aFyyZiVgdj937zqTZYoIA6/Fn8eq2I4QBz9UwOx7/rHa8RNw5Bswdsizc46z113ym/qVBzHVkeGKTX+RljGE0rUfPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056829; c=relaxed/simple;
	bh=K8Mq+92NAVYKmWc45EZIaQ3ocNQwKqjcrwCfo6AP5Xc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wh3m3v/KHrZy/PMAnPFcrfYqCrHalG7CBEUo+bEvJhZx6dvYU3lRN5Fut5MRM6eU2114UTV1zKfTI76JBT2fOuJo0zGIeAM859+ePrazonXaumQ2SatJPkEg7HLOB09a1x8PAaddtXS+/2kJYAHgRH1muCqkrsJtICRBQt4cc6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b2Db3gAt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WBUFqgaS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b2Db3gAt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WBUFqgaS"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494E0757031822
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 15:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=AGHFvK+4Am+ssh0tL8wDzEM1T04TIKotYBNRguxKzXY=; b=
	b2Db3gAtcucbUU7m5tWfQtYiX1WY7vpn2afWFuBrssHI44DDuZCXjnJkwq28KAHl
	Surm+V/XhQhyNIniM4vt/4eQMvOtQviH8zgLb4LfBGwNSryonPc5X5Pwd+yP3Q4m
	qStbnYP4i6toxGoV/LehnK+C7fNGqAfjmqqFIu7SkXWq11zyc75cq8EmG+UKrDIP
	/7Ks6q2HW7AR3NRUJbYj3DcwxirY2X1315PrnWzb17quraeYKun91GiF3sjk7ONh
	8WSuNTxhpR+grm9rtVTiPhE9LdutuPcnMHvGFNl41EWQxAwPqDw8TiVHFKwQQqqd
	ae7kyZ6JSK8kpomBZi1Ogg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42206m1vg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 15:47:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 494FNe6C005855
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 15:47:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422056qqur-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 15:47:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiPEFy8pvh7tqCP6JZz0eaRCMjby4aQ27o9Gazr5jLw9afppIIoYKXRqDHXaBwIRmMIbJuLBbbPC+TRpwZujqyw/E9Uu1CCGBCsPXezTQ6yUhd2UlBtkXnWn6pArhGQmLn/br0/MRv+9r3xHoDtZ+5ftiAo3va/6IoW14AH6+ERW+cOhJCH+hq9Hxnq011bpN79i01oAi5MFvuE8jadLT6QOZbTQuq42sFz1udhylg4KmQdcauSCUkTy4BjQprvTWrbfiBUvH6jNJcifQqEZuSluTOulvaXFq45v5sRu4pwIWN9Z8ulHrpcBzqAQvecYimAKeiNHhtLeXgBwNbC2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGHFvK+4Am+ssh0tL8wDzEM1T04TIKotYBNRguxKzXY=;
 b=vmgXpTKb9flTrr7hp0I6Z67vx1ZXyEc+iYlF4zWevPfm+c2+KCrpRTDzKsKxMlZC5u7+oAGcBrrc/SnYWdo2qAX0s4KXZacax+l2f4yxl/utZJrpE21qO2kfD7piiTwE/8uCMGRdThJIeZLI+YckXwiBPFP4Ne5GtvzKgB14gIFm0Gv4TQis5cXo1c1YV9p8TBF2G5ny8uZXVaZEUORKQrZL0OmEFcNbgXrv098CFGonmSoMgBUdmnqtg7Qn4Hi0CLhF3QiwE3LoZAkr4FumQtlURiOabVD8r9vUzK0xqbmWP/0CRdHfOiFKchfC77+ANT/RgFT7zkFrhgus0JkaKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGHFvK+4Am+ssh0tL8wDzEM1T04TIKotYBNRguxKzXY=;
 b=WBUFqgaSpbl+OVc05CTuiBye48HPkfQhlhFUNxssSFiYmtf3Ms3rPruuJHjEw1dxVSjE5k+tl1o5bnWgK+1lRC26rvK7CBroUeb/bzCiugxmMr8lw6mzlckwlOHPeNo8I/Skr6qhfL49Hxg3VBnUTqzPix/Zxad9GMZ8neOSRXM=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by MW5PR10MB5690.namprd10.prod.outlook.com (2603:10b6:303:19b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 15:47:03 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 15:47:03 +0000
Message-ID: <2d1eebfc-d0ca-4fc8-b6c5-c8fc3a37faa2@oracle.com>
Date: Fri, 4 Oct 2024 16:46:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: sdt provider and access to the trace_event_raw_* struct
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev,
        DTrace development list <dtrace-devel@oss.oracle.com>
References: <9253be47-c9cb-4967-a090-cc1cb1f23c91@oracle.com>
 <Zv_7try5KxexkrVy@kvh-deb-bpf.us.oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Zv_7try5KxexkrVy@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0272.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::12) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|MW5PR10MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: 49208b02-cc41-4335-2b2d-08dce48bca6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGxMUnNRVndtQVNTL3ZoMXVBSVdWb0p3TkFlVitmTXFtbFB1US9odDB6blVm?=
 =?utf-8?B?NnNwNXc0aWdyZ3R0OFNLM0RkTHpXb2tIdzVETEtma05DWTRqQ3pneExrWC85?=
 =?utf-8?B?Mk1MTEYzOUd3dXRETHFYNmlMNzFqZEMzcHUweEI3MnJrZkxWY3pwYWJMZ0Yx?=
 =?utf-8?B?QXloemo3YzlZbzNVaXFicStaZ2dzeDIvSm5GdlRLM3lvQTgvWnY5andCZ1JO?=
 =?utf-8?B?dk1oa0lJNjlMeTRGZVFvKzVTODN3TnpMcUdjbituWEpxSFRCaG14Q1VhV2Fa?=
 =?utf-8?B?eEluSUFmTVhNUVg3QUxlN2hwMldYK3pWV2xoL2xiTHNGWUNhZzFxSlZDWGw2?=
 =?utf-8?B?SStseXFaMFpyNEJlWXNPZVZKNDZMTFNHdTAzck00M2tFSGwwUjEwYjhtWU9R?=
 =?utf-8?B?eW1lTFhYdllXNlByMy9taGNIanZwRlFjaEFDcjd1VVRNSEExbXJDZ0ROTEN0?=
 =?utf-8?B?dDM1TjY2VGc0dkdYa1dCY0dHRVAya25waldsU2RKNHRkaXBLZ0ZYWkRwRTFh?=
 =?utf-8?B?UUFyNVNHYmczNFk3TGg0KzlReDNUZkNOQVN2alphZlpjZ1FZNkk1ZnZkRkpC?=
 =?utf-8?B?OVpkbURLc3B3OGVHVUFyT2dFMkZUMjY3TWRyQWhZdWJweEJNeGVOVElPSjJN?=
 =?utf-8?B?L0MwTXBTNjhaQTVMM0N5QjRBc0dZOEEyekFUbjA2TzQ5RytHcENpR1RHWDFP?=
 =?utf-8?B?c0hBenA5WENmcyt3WDR4TjJkQ1VmbGxhWDR1SVZLMERmTnRJbFZjbUtVTUFl?=
 =?utf-8?B?RUdYSVpwemlsVE9rWDZRUkV6MENiTksyK25VQ2g0cFVFTkkxZUQ2bnZ1RHJy?=
 =?utf-8?B?WE9qcFdmR1NsV2c4Rmg4blRLS2FqS2dMVmptWUxrT0N6YysrTnhaZXJYRjNw?=
 =?utf-8?B?eDBWQnpUNEk2ekRocFd0dHpMK3lzVmwxbEM4ZmUyS00yNUtqTHNEanlISVA3?=
 =?utf-8?B?Qnh3OGNPQUlvaVBMSEpxbXB5UmpHeGFyRjVDdHNZVTg4dTZQeWtJcno5cjEx?=
 =?utf-8?B?em90SlgvTC9rT05WV3ZxMnAyM3cvYnNqV3krQXlYRCtXSVVyL2JoaVVxeXRo?=
 =?utf-8?B?ZDhKU0t0TVVvTW1YdTEvRTl4TkZaRXkvUlk5b3JSSVdNc05rSHh3cW8yTWRp?=
 =?utf-8?B?Z1hhVHM5WnVBUDBNcThKc1o0OTRUSHRnVHZXSHN2YkNiUS9UUlZIZHBIUFBM?=
 =?utf-8?B?amJGVWdQWEl4WUZEWFRBK2UvUVpSSFRQVXlQQmI5cWdveDZiSjJRUXpDQk9i?=
 =?utf-8?B?ZHR3N2ZzMTI0SDl4VnhHRzRiR0J2eE1vQmYvYzQ1TzNpdjdpTHJLRU9jV012?=
 =?utf-8?B?S3FSMnJOSFdKai8wNFJnTEtQclBzOFh0N2lLQzU4UkJyUHNKc1dBN0hnSkVn?=
 =?utf-8?B?RXRaMC90TUsxVUZhVWFXOHBYaTZJZDVFYUFEK0tVcjRTM2gyb0ZCTjhEVDBL?=
 =?utf-8?B?QUFlZksvYmdFMGhIcjVkM3lUb2dnc2hJQUtZakNST1VKSzRDeXA5K1NDdVNG?=
 =?utf-8?B?NkRUd3d0bmpKMTA2T0N0WFROYkpUWHdmZTlRb3h4YU1GZTA4MzNMMGMxNGx2?=
 =?utf-8?B?SEttL3JmWjB4V20zYnFkb1R3MzJmM0lCVDE2dlJpbnpCc0plUi9LVXMyR0I3?=
 =?utf-8?B?ZjZsb0Zrd2gwOE1KUEp1NnlqV0RZeXJBSGROZ1VqTU1XN2d3U0Zha2ZyMzgw?=
 =?utf-8?B?Q0o2bTVDb25GcU14QUpwczVNNlU0UlhBSmdhdTExQThxTGJrMWlWaUp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVRTTnlxVyszKy85WUcxZFRDc3NQNUF6ZXB0MVo5MUpSa2xsZUhxLzhVMnJa?=
 =?utf-8?B?dmVwWktwWEYyMFlsY3VnNXdxNEFrTVJWYTVmQk55WVdLdW85ZWIzbDRMSWhV?=
 =?utf-8?B?RVBsbTkwR2tUdFRqRmhQNEFzbHg3bURGNTh2ZTdWMGlFc3pnaWF1UEExMVZT?=
 =?utf-8?B?WDZLeHBYSVdUdnV5MmlLWVBvVFpjTW5mWHJiYzd6L2NvLzlJZHVQYmlYTEd6?=
 =?utf-8?B?RktQeC93ZFpHa0c2bXAwRUlpRUFHNk03ZkJGdUk5N21OTW92Rmp6V2thaWFk?=
 =?utf-8?B?bEFaU1VqTVVrVVp6Z2RWZkoza2FDSE5xUnllM2VPaS9aRFBPaVJsK2I4dzRL?=
 =?utf-8?B?NzRnS2NzTk9ySkh5SkUwaW9BcG1vK1czOG1BWFpHYis3TkpuQTNiRkZGME52?=
 =?utf-8?B?cnZHOG52MDU2YlFDbyt4d2gyd2lsckwzcDF2aGNRQU93KzRsWVlzak9PRSs0?=
 =?utf-8?B?dHdpZkVWcVB6QThrRmRpbVNENnZuSTkvSlgwQ3FKVkswK0tFM0FYLzVDTElk?=
 =?utf-8?B?TGhKcjhQS2Zza1BPMFQ0M0tVQ3JKSTRVVDdsZUIzZUxIZG84b0VaM1czeHYw?=
 =?utf-8?B?UjRBa0RaNHU0a2xxWVN0UFdMY3hpakcxUXpFdjJ3dk1DeXZKcUlpaDhoV09l?=
 =?utf-8?B?enhvaG52VEpRV3RuV1dJaWhjT3ZsRHM1dldobFY4cHhzRjAzS2MzVmxBWG9s?=
 =?utf-8?B?akhudHpoV3lHR1cxQkhBSlNHL3Jlb2oyU29BTk5uRHhEMEwyUVgycjZGQ3pw?=
 =?utf-8?B?emkwYXFYRkVzUGE0M282c2ZEUTVLYmJkdVZMQVJjT3BLWi9iRUdmQllvMEdl?=
 =?utf-8?B?L0J4dTJyMS9pTzdzUU1DRDFIckZGYW1ZTXZDUjFFWlBPTHRpTkV0T0grVnc4?=
 =?utf-8?B?by9QRnRCUTJmOGtVZ2NnUklya1lxZ0dFYW5RbWN3NFlqcjArcjFlSHJMY1lh?=
 =?utf-8?B?K0F5NGlvQ1lzbTYwSElaOGxWRDU0Q29NaG8xOGFrbGdhdm9Zcm1mYjI1VkhW?=
 =?utf-8?B?RzZEbjc1WExOU1ZQWU5uc05SaFNEUVdNUGo0akhGcWxiU294VDlrM3R0VkZK?=
 =?utf-8?B?dmRrNjBiU0NKZjl5VHdvVllQSkFGM3JLWlpPNnJuZnRXbDJtQ2M3WmZUVHh0?=
 =?utf-8?B?VTN0bW1lRkdGTGwydm5OWXp6eFBsb2gvd25hYXhUSDJBaGIyQTBoZ1dyWUd6?=
 =?utf-8?B?RUpyek40TnJTR2ZpN1lsWnJNeG4vYnBpVDM0bHhYODRVZTVBT05kM0kvV3VL?=
 =?utf-8?B?Ni9RTkYrUUpOSFI2bURrVUhFaGdrbUhVNHJsUytyYVlRTHRpaGpPRWtnMEkw?=
 =?utf-8?B?UkE3dXVsZDNiSnVQRWRMVW9wYUhVVVJWWVBsd3V3Q1o4ZnZ6eHUwb1hzR1dG?=
 =?utf-8?B?MjNxanRCQUJQRUV6c2gvSWJkSThOQWlDUmNlTytSaGRLT3FkM1Y5SURQTW4z?=
 =?utf-8?B?Z0d3dkFjaXc3VUFXUVJ6T3N4Nmxnb01mTG1Sd3ozT091RmVVejlmTmRrcS8y?=
 =?utf-8?B?bXhKYWhoaUJXdnVkVkZmTzhta1lMZm9KZWJlek1DOGVkUHZnZGlXeHFOU0NF?=
 =?utf-8?B?QjhGZEl0MFAyM0RxeFE0Y0NRbTNoK0xmSkFZdGhSZ3dVVHp3TzBFeHkxVnE5?=
 =?utf-8?B?VzdFMkV4ZzNHME9vaFo0Zk9TTjRxc0xUVWxlYmlpdE1DMDdsWUh2dkVkNk90?=
 =?utf-8?B?b2MwRVRiRUR1a2pFRkdYcWl4WmlWT1NROFdVNmxBTkd1UkVOMlMxSGRQWjF3?=
 =?utf-8?B?bDZqZXlIQ1RzY081YlY0YTFRZFNUbnZyZDVyNWpXOEt4UnhqSTdVV2tqSnlG?=
 =?utf-8?B?WHkxOUx5ZjFWV21mSGNCVWZ4Z1NHK0xDakF3MFd2T2tqQmRaeHd1QUVGd2hO?=
 =?utf-8?B?UDRXOElxb0xQTmJGRmUwaFV2NzJVeThMYXZXbzF2eU52MGJSdDJmaDUvSVZt?=
 =?utf-8?B?N1E5YnpPaFp5a0tYcXVNYXRBWHg3YnRvS2ZwcnA2NFdVQmpMOXdYZUxvc21n?=
 =?utf-8?B?dGt3ZUZQTFQ0dnJXbXdjK1ZHVWlqT1NsWVdyUTlIVWF6bFJPNDFyYTRkc1B0?=
 =?utf-8?B?R002TXRnNG5pa0FYbkdLR0d3aVVOOVNyOW9IaXB4K1VKNFJwVUEwQm8zdDlC?=
 =?utf-8?B?OFBma3RDclVFWlpVejRseWF6OG5nZ1QwVXk2TVRrQmVtejhKNml1SmdDeWEr?=
 =?utf-8?Q?FT8Z29093aoOVP4QyGCDYPI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A7Vy74j4j2JuAdh7/q129mLT1vYQaQL7ocmtsAj/mG3Bz8ueTKsHYFLvQvX3x3I+jSPRJ1eVDXHc1dVdd110MTFoScR19LWxSg1OFaAuf+RrSamjbqfzXEZgFPI3iJUklVHIdwUM7N+0o/dNpXdeVvrtZwAhQn5KvDA6GxxuhWnRQ/s2lxFO3l0FpPOpbAB0UrYg/VDumjYbhk/QrVK5jq2biSlHUFTnwT9AD+Vuy2KDqIhDCNcZQURAR2Zk3sYPC14pwIuxWeEqKruHT3fOJv21IRQIhRe0q4V6DRqmjJqE+1+E3FjDnmCGJeeBLTFJhtZWcLGZck+z5VdCBBUazdHEmAR22fC5wliojswOHd0ApeP8b/abl3W9cLYAb8M9mmaRo6Nv4MykpEiCL0LfMMZO6Hn8xekbUXSKxcS3UZZboTKGgOoPWTgMA+4xq7gQtyvdcjaGSZSZO/7WzPsumEx1tw6Zj8PKgovhZhDTirzm4KvIjrTdiSMX5qsY0QkYM75QPjvlxFjbQEO1aJqxFfC6u1x1ovxN5Y0hEvUsXTENdGFtG7IOMQttrSG4OJ1cyBS6ALvpbUbtR4cN1tnCSSmf0OpS9/n+EGUqkipdgxk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49208b02-cc41-4335-2b2d-08dce48bca6d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 15:47:03.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSgGnR4hx5t4ssTcSCs2VfOSos1bc0lGrzvH0RqCWeg9LBrCFK5mN4b/gKeKm5BbN5i79MLqTqDoMfm2xO9bGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5690
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_13,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040109
X-Proofpoint-GUID: kV5RrIaRp09bXhRN3aEM6zAIHCWD4yMV
X-Proofpoint-ORIG-GUID: kV5RrIaRp09bXhRN3aEM6zAIHCWD4yMV

On 04/10/2024 15:29, Kris Van Hees wrote:
> On Fri, Oct 04, 2024 at 12:29:35PM +0100, Alan Maguire wrote:
>> hi folks
>>
>> I've come across a case where I need to trace a kernel tracepoint with a
>> lot of associated trace info.  It seems that the current approach for
>> sdt probes looks at the "struct trace_event_raw_<tracepoint_name>"
>> structure and maps its fields into args[] values, translating each
>> member into a separate argument.  That works great for tracepoints with
>> a limited number of fields. However in the case of a tracepoint with a
>> lot of such fields (i.e. more than the number of args[] supported), it
>> would be useful to also have a convenient way to access the raw "struct
>> trace_event_raw_*" data, especially since we have access to it directly
>> via CTF. It's possible to do this via a hack, e.g. the following works:
> 
> You should be able to use the raw tracepoint provider, rawtp,
> e.g. rawtp:sched::sched_switch
>

That's a good help, but I should have clarified that I was hoping for a
way to get the tracepoint data _after_ it has been massaged into the
tracepoint form; the above will give me access to the raw arguments that
are used in tracepoint data setup, but I was hoping to have a way to get
a pointer to the entire trace structure after it has been assigned. It's
doable in my case (since the first parameter is always a reference) so
not a massive deal, but it might be useful enhancement for others.

Thanks!

Alan

>> #!/usr/sbin/dtrace -s
>>
>> sdt:sched::sched_switch
>> {
>>         s = (struct trace_event_raw_sched_switch *)(arg0-8);
>>         print(s);
>> }
>>
>>
>> ...but presumably that only works because the first arg value isn't
>> scalar. It would be good to have a helper or builtin variable to access
>> this pointer directly. Maybe there's a better way to do this, or maybe
>> we could add a helper/builtin to make this pointer accessible? What do
>> folks think?
>>
>> Thanks!
>>
>> Alan

