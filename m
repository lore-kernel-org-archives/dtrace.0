Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096B273D89
	for <dtrace@lists.linux.dev>; Mon,  7 Jul 2025 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751925083; cv=fail; b=W6ibEEJjmJKmMlFwkkuQMu/JJzrT/LqvQ3vV7vLOyxCOKM8t7orNQHLtZfzW9rnfDyqGVbc2lHIMq3WGvr2//lHMtvqoaTL+D/vOmQdjAbuzJ6VDDvdHBvwho6w30ya0ztZ3zseyR7UW4MIHkbxrdPi8fy6yc6LULoDH6BM08UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751925083; c=relaxed/simple;
	bh=3q08cK+qm6j6gGNa6jP+aq9As4o+unz3pN18eZzRMpM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D3oLXS1K0T6ByggNpvSA4blUsA4eoNEpgW7VIpALS6QAGROmb9Fra2T172h0Cs8bXG2Cr3ZLYUc2wflKGeJmEKezl4Vz27OoMBWUkuS0Ree1WRJNtTU4tDcQazOMIF/KXBBJ4gWCd3TZn0Zsbl2IMb7QNqLU2yoHQuvbrKpFME0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e3ksm1Fj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dLZgAMpa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e3ksm1Fj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dLZgAMpa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567LbCNK004556
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 21:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YCHCL7vDG/Muyhs3FKbRNwPj3rNXu4/cuim+ko96KlE=; b=
	e3ksm1FjGI9N+fPxG+nvnB0OrNs6O56GBlnK+8zeU0cjmOSFnRvqVzIBMGqNXzTa
	ddNR9+y0gnMzJFuX8J0w/xnBa3mdggUCHJqqDFS4sAJVvYNKVQtgq+zZoSVpV63D
	eVZFvmtFEYvOAYzMGy90AHNNk28wcHBgXP09KRbibZXo2aGdG9N7He10FhQ8DZqg
	RFsE+leZQv4bBAC6NAf74chEkSPnElttFQmB+9xF6s1oYI4xGBwcRChbQSJTipFY
	+nmFi+NT8+gQDDuCbE/d0l6eq0IjrbU5Dq8JKDB7qxBK29YCIzbExNNSUhCIMvI5
	ehUNHl5YsSNQD0iojWza9g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rpadr0hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 21:51:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567KL9sg021496
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 21:51:18 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013059.outbound.protection.outlook.com [52.101.44.59])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg8txhh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 21:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBQ6ibLb6x7fTdqes2hTdzT1ny6wB51sBfirLXlKesJ8T5BAe24NvjsCWc9iXcaXKjiqksXqe5deEeP/UoJVdmPf/Z7lKGBJcxB1v0hS68FwXDGeV63tUcWlrqe984ZIhxCReNdV55uhPHIC0nLWczughJxyYylZhbAOC1hj+toVAIa1NaWyBRS7y2Iz9f765yGSf+s1e+Nv6X3hLqYzkbSj839UhlYCAZucTwHn6WbwT3zNOkPasxA+7fFd70fPKh8T3fXTa7YosyYi78AdiKl+8BF0OHWRYWVBXAfG13lmdANbrw/kq2Ngug6urQY7zFFDaYagA6+786+q7CqKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCHCL7vDG/Muyhs3FKbRNwPj3rNXu4/cuim+ko96KlE=;
 b=JUwE+DqLy6Ro/dOIAicj5fK9/s9JYNI78WpuHK6GgF9vCznCS22LjArx8lREkR/Jabr/BhZSB4p7QVubXWBM90fzl9G0lBLAfT5tiFRWC0zRQBRTcdR60R3ZgYGggi9ouGUXWaoT07SlV6dVR6lGzuep6x1qKlFGIsq7f6Y43PfD8wvJ1nyf+YXWV1xeyD011aySQUpQXcVwB1Ufhh5BXjtZfLJ82K/tHr7IUqt9++HFS2QaRVZWTnWi7S9kAq0mteJu3EXtHSHAtoEuEMkHqe1p5nv3G8/DBwIhNuijO7p8+7ig65+qjX3LjaUtx2Jt6/WdPpXkyDbSscAUy9jkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCHCL7vDG/Muyhs3FKbRNwPj3rNXu4/cuim+ko96KlE=;
 b=dLZgAMpanSKxYtXMHk0DdjsbLtjd733ycSz4d7ZSYSN7Di2hOw5Xxz/NwDYWrH2BvhC18b+EUsjl7PnCV0kjOOCU3mQ8MApdVO9ikMBe0RKXMPY2s6rnVB83WYQG3rNtYe3f9f/2CinhdlYuXB9jlOBgPmWk8LV3wO1DQ3/2y3s=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 IA4PR10MB8255.namprd10.prod.outlook.com (2603:10b6:208:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 21:51:15 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 21:51:15 +0000
Message-ID: <a2c14fbc-ac46-4e0b-804e-fb6e6c3e0751@oracle.com>
Date: Mon, 7 Jul 2025 22:51:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com> <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
 <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
 <aGwmKfOPU+NZ+ekf@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aGwmKfOPU+NZ+ekf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0023.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::11) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|IA4PR10MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: df44d375-b569-48eb-48fd-08ddbda06588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TktuYXJRcW1FU0FLZmRhY0RFZHJHVzVjOWpLVlZVRFBGNlphN1kvdzJsbmZy?=
 =?utf-8?B?OE41M1BWVGpHcWVlZ3FiY0tMSU1jRUIwdExxeFlmOVpIcUtISmhPYmFZQjVq?=
 =?utf-8?B?TGxjOXQvei9wY2RkSVBmclp1UWdINVFBQjFVVzJhUG4xa3pvcEhHQlBTRTVR?=
 =?utf-8?B?Z280cDF6MUE5TFQ3QWx2MUlIY2VJcVZMSXRPUVByL1pjUXhWNlZSaEhCbURV?=
 =?utf-8?B?aU9vZHF0VVdNK091QTdiT1RRVGVySHZhSmVnRmhNbVEvSURnWXh4N3BETTYx?=
 =?utf-8?B?V0w1VXBXbnZrYnNxRFQ0Zyt4ekZZWGVSQmhWT0FhRHVOa3d2ek9KTENDQVJO?=
 =?utf-8?B?MHRJdGQ1ZlNRaDlqYWpiWUJyVFNhdWJHbnRpRTFXVVpiazNOK09CWERnbEdB?=
 =?utf-8?B?QmtxWlJxcldCclRiRTdGaGhoNmRySlNHVTBGMVZPSUc1eWdEWHNvcWdDaE9a?=
 =?utf-8?B?MGFwVFVlaWIrUWhWSWNDdmcwREZNNS9WbmU4MGNNNE9YQStCTXBRR214RUtY?=
 =?utf-8?B?cndMUDJ6V1lUdFJJUUpzZ3BHUTJQcEpDVW9iR2gvRGdDM09iYWw0RlFSYUtL?=
 =?utf-8?B?K3IzUEtFaEdROW9uS1ZrT1E1TldHNDlkOG9nSHFtUXJWaDlXQUV5MU9Zd0hj?=
 =?utf-8?B?Q1lISnczeG5vbGtIVS80anpLUHY2UXpTeU9zNHQ0bHFmQVFpOVViZTMyeG8z?=
 =?utf-8?B?WmY2TTROaXdYSzVYN1BpQ3pWcnU3MDRzYTRMdktZZW9kNW9ZZmdwYTVZcWdk?=
 =?utf-8?B?WW5EaHRrU2FZNkN2ditqeTFVZDV3MHhHWm54czBnWDd3UW83UCs0RGlDczB4?=
 =?utf-8?B?d09nbzBtZFVkYXRpS29iSmdrcEVEZUZVUDA2ckp6ZTQxdjhzTDJoaEFzNE9B?=
 =?utf-8?B?a05aVnFQTGJkRExibTQwblh4WkY4cGk3UEkxTERHVGFhMDY0WDFPQ1liQ0NK?=
 =?utf-8?B?b1hCOFo0R3lVVjRIaHF6YnBpSlY0SWFxa0FpYXJicG9ham9ydXhSTW5KaUtI?=
 =?utf-8?B?SDJhMWNhV24vM1Q3ZEhibFdoT3dka2xCdDFnajB0bEtlcmoyYTFsU1hrY0lw?=
 =?utf-8?B?U2xnY2F5MlhBdkMvUUNUSEE1M3EvMGhDN1hqTWFJekVZNG5RZzhnVkZTa0oy?=
 =?utf-8?B?V0ZIVHZnYzR2QU80S3RoYzFEd3pVWER4dXo0KzF1bDdCZ2NJWVBsaVRsR1VJ?=
 =?utf-8?B?M2JtUUVSRmU0aEZmY2dSSmdIUVIyNkFZTVpoSFpNZkdqcFY0TzdSSmx2S1Ix?=
 =?utf-8?B?MzNOU0FsaWNKRWwzUjVOMUJqZURxOER5Z0xLWlRjMEpQcktkYVhwMS9WOHNP?=
 =?utf-8?B?LzVrRmJZNkNqbXBhbXgrSTE5YklVd1dYdUZHQmlveFZoU0J4TkNmaXlaV1g1?=
 =?utf-8?B?cXpMK2xVb0F5aG9YZWNob2Z2MHRTK0ZRVWZJSHgrVCsxbVRyc0tONDFuKytK?=
 =?utf-8?B?amtXQnBmaHhjelZhZ3lrTmt5emVLZmcyazM4MTJjV0h0cGpqa1ZpSG5ETDNk?=
 =?utf-8?B?Q3JGQkI5VmdBRVZUdXJaaEFzU2IxQXZWU3lNWTlzYnVicVJ5SVhUUlA5VVJ5?=
 =?utf-8?B?dklQM2ozUjR5SHNtTXZXazJNbXF1RVlCdDM0VTlxQkNKVkRUQ29XMVNYTlQv?=
 =?utf-8?B?bjl3S0piUlFCeXArSnY2N0QvWmtYUkFRVGllOWpWaGp2aEUvNGNoMDB5Y0NG?=
 =?utf-8?B?QlZHSklKSkNGTjlUWENOdUVjR0xqdjJ6TUE4bXJSWHI0VnplSVp0R1hKbHE2?=
 =?utf-8?B?NGRYaDNZOW5OeVZqRFExdUFqS0c1em5IL1FIZ2NISjBrMDhnTjJtV1RUSVg1?=
 =?utf-8?B?dE52M2FrQ2dJYXFGb3A5TUtlRTkyanJodFB2dDZ2dDVzR2E1bHYxRUswanpT?=
 =?utf-8?B?eHkwSVFzWFhUNktFbVMrc25CKzNoY1EwN3I0K3J3WVdIcFU0aEZPSmRTRkta?=
 =?utf-8?Q?IhG1Xs5i85Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3hJZThaaTlXYmpKbmw0Y0U1eitjYUE4clZKM0w2eG5DY0NvdnZaWXlZSHpt?=
 =?utf-8?B?WlVkcXNJK09hR0dLQmlXNWp4ZXoxWm1mc0c2UGUzQ0ZLUTJwdFNxSXZQblJa?=
 =?utf-8?B?Q0xRQlB0blh0LzQrZmVzNnQrNFRIRUNiYmFETFVzdWg5cUNBcXI3ekI1U0pQ?=
 =?utf-8?B?akRMOHJkbmxHU05nTUlXakJvcHFqTUpIeUFHZkxobjJoVFRCeFFoNCszSDNG?=
 =?utf-8?B?SStzT1BhUFFZamxKanB4TTEzaVA4VkZjWVAwM01SQ0YxdGFlOFdGUTJldzlp?=
 =?utf-8?B?QjcvaUNycnVtbmxqWHNuWURFd3VCbFpYbitQRWJZTGFBbW9BbDhSSE5uRXdi?=
 =?utf-8?B?OWJXZDBMMFNSV1o3cUdSdFdVNjVBU05kQTRoWCtPZkRFcWJQbHdZcmpIRnFp?=
 =?utf-8?B?TDZJMjN5V01LSWJuUDkwaUc2bTlqSlB5OHROUlJTT3BkMU44aHpVaVYveG10?=
 =?utf-8?B?dFZOUGVlcm9Ib2czVUhZSDc4N2tteDhYb29uR1hzd01PRy9yV0d3QTVYaTZ2?=
 =?utf-8?B?Rkp0N2dvMTJLdFVrWFoxL3FDb0RGTEhPSW5lK0QrMUFtNEhMQzJMblh2VnJG?=
 =?utf-8?B?ZzhXaGU4QUJCOWE1Nit5OHlGVlh3YXVNbFlkZWlmc2Rmb00vY2tDR2FSYzJy?=
 =?utf-8?B?ZC9iZGFhY3ZCaE40WXM4ZmRWS0hIV3BuVkhkdjBKK2hldFduMDdUSGV3R1l5?=
 =?utf-8?B?cjdKVytXakhibVVwVzF2Y1RHQjUvT1FmeEIra0RJU0FmWTlyQ0xPV1Z2NWR6?=
 =?utf-8?B?Zlo0aW1OOS95SXE0N1lEMk5nRVFkWEFwdy91anBYQ2lkUkMyM3pqbkVoMTJN?=
 =?utf-8?B?QUtsRDBoY3ViclpHL0owdlVCQVc0K3A2S0NOaWd1NjFuYm9PVjJYaWZUMFZ2?=
 =?utf-8?B?TWJRVFlkQUFxRVJIRWZqeXIyam05b0Y4WE96RFhBd29DVTVMV0YvUjVCT2ZX?=
 =?utf-8?B?dDEya3RqRUtma00zRDU1a3RHSW5QMlZTZmJrSFZtQnpWVWJWb0hLV0xxUlRH?=
 =?utf-8?B?WmhRM1ZMdVV1WkU3akN4WXlSVG8yUDR6ODhITTZrYXdtaERBZmlVb2E0K0I3?=
 =?utf-8?B?VENDelFnN2t6TVRaZS84a25zRmxDUE16aTNyRW4vNGlBTGZwOEJYb0VHeHJP?=
 =?utf-8?B?b3ZDUW1lVU9jVGtWZ0s5UXlZMUVDdTBUcGp1YWhIanB4WkdPa0dRMThqN3Fy?=
 =?utf-8?B?d200eUFBa3NhUk8raUJ0eGdZTjFVZVl1S1g3endUcU5WU2xiYUw0UWkwT1Vw?=
 =?utf-8?B?SDJ0eU1rQmtZVk5QR2pSd25uUDhWbHhZNXViMjNvakVIVzFsaFB1VFM2UVZz?=
 =?utf-8?B?YWZYZWs2QzUxdE44Z3JyUmZFK3NGYUJmK2pmK0FSYXF2bzBGbmUrT2NqVmkz?=
 =?utf-8?B?U0FvOUkrN0U2K1RnYkVSNi8vcUtteHRnVWgwb3Z4Qk5JWHcwR1VVeDVLOE5r?=
 =?utf-8?B?dk83L0V1T0doU2RzSzNJVHJjdjhTSVFKQm5ZM0R2SkxxazdvYW5od3VQek9s?=
 =?utf-8?B?YnZiQnFkV1dkVHJabGNIN2NZS2VYdlhVVG9lRFd0dUo5bzZGRENmWkVBSzNm?=
 =?utf-8?B?dE9JVm5ISXZEcS9iY1lnQ1pMNFVEcEswMDNJU3pibWlQWkk4UkJQTWgySU9q?=
 =?utf-8?B?Y1RyQUhoa2p1VXB5OUQrYXNQMkdVWFQ2UFJoMjJPT0ZIbkJsTEp4RXlCTTdF?=
 =?utf-8?B?ZDA3RWQ2ZmdGWEdzOTI1Y1hNeGlNL3Zmcys4WElsN24vaDdYak43eGhSakFB?=
 =?utf-8?B?QzJnL3VLN3JNa0ZqdlhraXRiVGpTdnZUU2IwS2QvbVkzMUoyZVhHcjRNbEw2?=
 =?utf-8?B?RHI3cVVZR1dGRE5yWWZFZEZoV1ZGb2F2WnRsWFBLWVJaOWF3eVFTeWtvKzhx?=
 =?utf-8?B?alFGMlY3NGNtaVpNRlVSZy9sOEFHZlA1bDhLNGFhRFNqMnhDVzJ4YjFqWlhh?=
 =?utf-8?B?QWFLTDFiMmVTTENnVU8zV2dhUVVwVVk5dDZoTFJ1U1Zva1FBQ2RIdHZhN1JM?=
 =?utf-8?B?SlA5TFA3K2txRTNESGNSVU96UGw2MEpadGE4dnZGTGUySDA5MnlwMC9nTkox?=
 =?utf-8?B?SzZwRWR1d1BldlNoSXdaalpRR0dCd3F3ZkxNM01EWlhDTi9TZ0ttVExoZStH?=
 =?utf-8?B?bi9mQzM5Unc5bFRTL2NPOWNzMFRjako0RWJIUEFVQW1hclFaYVByM3BmcHM1?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fNw8VJ9Rx7dt2NVQwj2wbwEsqrBMmot7Ts0PwU+idNIicEtrI90Lb1D5OEKnwWolFcOLl10Os2mUmFaCIjGbZ64vx4y7A3R1xk5McevcZrJoAV+SNceo7lOTOC45TVacrZjz880CStL9N3DbQsapMgH3ImJLuap8ivIJZjPUeW8xBhAdbiK4AdA2oaAAQuZfidZG8N7xrtUw6O8gVRjhDU9CgclG0WoNkkNzlPH1DEJkWGXcIlGX+2gmFBIGxPUSQqJYO2in4VRRwIGQPTNHj/X2GiDbPsIavo3Bzt2BF7Q+hAd5/EvDV81nbpqWy4pg46YPFGjlAj7qSMc9uL+Cf1QmQdxY5nEGRG8NkUk4GFW5rK/QNlRYxjSL2glW+Ctyt2z17zrzcsmUHgv+zf4/V0DPSlKBEMDQ/4YeMRkQ37+5wk9a8k1M9DbxJn1dtqzKcn03OvJV6gTWCqmVqa97FCay6YLqRVpe9I4SDw2nQiJMLFm8JcyumK0b2YnH1AeYvW+S02Sre2SnGSr/QWqxcgcj8VMW5TrrIRjs+AnO0XIUk4Wa9XEGbmSwK09VwItg9IQj4dCPZbSlxQrtnq3fvyLFw9/lUWgpWDuJNk1AP9Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df44d375-b569-48eb-48fd-08ddbda06588
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 21:51:15.5618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzKSIwMPYcfjc4mITOUxUoRhXHsdr9gmud5QvZWomUE+kzuGPy31s0u4BElfc/cVt7j2Q2dqibRSIlL3H12+ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE0OSBTYWx0ZWRfX4SB8n0qTNSme olJO0YVp+yfPSbTZt5G4T+iMB9G+zBM1CDy6buNXx+F7P8Gg6N15s4ENpLDnNl8Xnuh9LgvQZSW OfLzS5Uw4M6rP58qCKzgoShntNZ3T8knWr0bsrul74KsMAFNY7c4zj94Vpqiyah7Z2cT30Pac52
 PYMo/5DVymacdGpf+JTNhFPAMkfvxEHjFVvFtz9tKA+W10tNNBTOItvSRjXz00TQLDX2aDJkbur f5N416yOn6vnG8UVOLtEsoMuHaYntiAsCLvYURI6Ucpv4DgIbtkaO8L9PrSdFsRC0xX9gyvDZEW lbWi4X7NPmXE/F+KNSeG7g4iIa8/Cs+XbNmeOcxg7mhDCralJgC8SehVg1v5+XJdEJNjoEf3mqj
 MpoAtrZIX1S402NreK09VRdJPaDmIMnHLulVg30yOFj+/9V1xDj5QDbI4IshuYzb3QuvyI8a
X-Authority-Analysis: v=2.4 cv=CtO/cm4D c=1 sm=1 tr=0 ts=686c4157 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=8mI-aJWB2JhOQ_InpAUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gk8mLTbTGv9JDv1Rxv_Jb014PS0aYLeg
X-Proofpoint-ORIG-GUID: gk8mLTbTGv9JDv1Rxv_Jb014PS0aYLeg

On 07/07/2025 20:55, Kris Van Hees wrote:
> On Mon, Jul 07, 2025 at 07:14:35PM +0100, Alan Maguire wrote:
>> On 07/07/2025 17:53, Kris Van Hees wrote:
>>> On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
>>>> On 03/07/2025 23:36, Kris Van Hees wrote:
>>>>> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
>>>>>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
>>>>>>> On 03/07/2025 20:03, Kris Van Hees wrote:
>>>>>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
>>>>>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
>>>>>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
>>>>>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
>>>>>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>>>>>>>>>>>>> patch 3/4 feedback).
>>>>>>>>>>>>>>
>>>>>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>>>>>>>>>>>>> send probes?
>>>>>>>>>>>>
>>>>>>>>>>>>     dtrace: failed to compile script /dev/stdin:
>>>>>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>>>>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
>>>>>>>>>>>>     Unknown type name
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
>>>>>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
>>>>>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
>>>>>>>>>>
>>>>>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
>>>>>>>>>> this I believe?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
>>>>>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
>>>>>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
>>>>>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
>>>>>>>>> work either. Seems we need the core typedef + pointer addition or we hit
>>>>>>>>> this failure.
>>>>>>>>
>>>>>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
>>>>>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
>>>>>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
>>>>>>>> translators and that works with that typedef in the file, so this really ought
>>>>>>>> to work.
>>>>>>
>>>>>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
>>>>>>> in one test and I now hit it consistently for all tcp/ip tests
>>>>>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
>>>>>>>
>>>>>>> My assumption (probably wrong) is that the include of the library does
>>>>>>> happen but nothing triggers the pointer type generation for "ipaddr *"
>>>>>>> in the CTF dict. If there was a way to force that type generation at the
>>>>>>> .d file level that would be great, not sure I see a way currently tho.
>>>>>>
>>>>>> Well, like I said, it does work for ip.d so I don't see why this would be
>>>>>> any different.  I'll have a look and see if I can figure something out.
>>>>>
>>>>> Looking into this more, I think the problem is simply that you did not sync
>>>>> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
>>>>> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
>>>>> your change, it will fail.
>>>>>
>>>>
>>>> No, don't think that's it; the .d files that matched the kernel I tested
>>>> on (6.10) were synced; the use of the 6.10 .d files was visible in the
>>>> error message. The problem appears to be around the fact that tcp.d uses
>>>> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
>>>> translated types) it does not have any other mention of ipaddr_t.
>>>> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
>>>> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
>>>> type list.
>>>
>>> Can you reproduce this at will?  Can you give me specifics on OL version,
>>> kernel version, etc?  I'd like to be able to reproduce what you see, because
>>> so far, all I tried actually works once the ipaddr_t typedef is in net.d.
>>>
>>
>> Yep, it's 100% reproducible for me on an upstream (bpf-next 6.15) kernel
>> + OL9. Moving ipaddr_t to net.d works for ip.d but not tcp.d in that
>> environment. The extra casts for the inet_ntoa() parameters that I
>> mention above are needed in tcp.d to get things to work properly for me.
>>
>> I pushed a branch to
>>
>> https://github.com/alan-maguire/dtrace-utils/tree/remote-tcp-v3-wip-broken
>>
>> that illustrates the failure.
>>
>> Relative to devel, it consists of 6 commits
>>
>> 1: the v2 of the remote IP address change (ensuring the remote address
>> tests won't fail);
>> 2-4: a few prep patches for the tcp provider; and
>> 5: the tcp provider patch (in a v3 work-in-progress form); and finally
>> 6: the top-level commit then removes the casts I added to tcp.d in the
>> previous "tcp: new provider" commit. With that change in place on my
>> system, the previously-passing IP tests start failing.
>>
>> If I "git reset --hard HEAD~1" on that branch (reestablishing those
>> ipaddr_t * casts) and rebuild, the failures go away for me.
> 
> I tested your tree on Debian with the 6.15 kernel, and this is the result:
> 
> $ uname -a
> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
> $ cat test/log/current/runtest.sum 
> dtrace: Oracle D 2.0
> This is DTrace 2.0.1
> dtrace(1) version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> libdtrace version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
> testsuite version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
> 
> test/unittest/tcp/tst.ipv4localtcp.sh: PASS.
> test/unittest/tcp/tst.ipv4localtcpstate.sh: PASS.
> test/unittest/tcp/tst.ipv4remotetcp.sh: PASS.
> test/unittest/tcp/tst.ipv4remotetcpstate.sh: PASS.
> test/unittest/tcp/tst.ipv6localtcp.sh: PASS.
> test/unittest/tcp/tst.ipv6localtcpstate.sh: PASS.
> 6 cases (6 PASS, 0 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)
> 
> I will try to get 6.15 on an OL9 instance and try there, but either way, I
> have a feeling there is a binutils (libctf) discrepancy somewhere?  What

could be; see below..

> version of binutils is installed on your system (nm -V)?

$ nm -V
GNU nm version 2.35.2-42.0.1.el9
Copyright (C) 2020 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) any later
version.
This program has absolutely no warranty.

Let me know if you need any more info. Thanks!

Alan
