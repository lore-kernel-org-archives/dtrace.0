Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF16C274676
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755543556; cv=fail; b=j+4Q5s9rw/B5IGHLfCHgMJOsTU0cfnkBxSbYZ5tfD7UI4jvs0JprumIiqWpAwBm8zP0merwBh08kqzESTPSonDirbv5T7hYdII16jz/NNGbffsq+wselekygCrpJT5YLGuSl9zTs46jLB95ToAdJm//DXohgVYASJg6uoRHu8JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755543556; c=relaxed/simple;
	bh=QvufNXtYhZfUZ+pmfqC2ypJFvUcs5/akAEDSqytwTug=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JlFolVAUCyq3Tpy99GrhpiCMkJJzH33H8XzOdyblnDsREpZV2kSlg7MAL04M2vo2/YvFW2G+rG81RFg3ff3eK3DZxd46IT0EzDosDhM852ZoMoOiwMKji6JR2ZmO1+ORmnFkTj+nqAfBM27hlBr1hvYwspZYw+T5HBq0auAS8kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ogNSOeGz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=K81SyO7b; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ogNSOeGz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K81SyO7b"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEu1VH028807
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 18:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QvufNXtYhZfUZ+pmfqC2ypJFvUcs5/akAEDSqytwTug=; b=
	ogNSOeGzeVHwUWBbeJ1Y3cOsz0Hd8pOxzx508SdJkIGsndSvdInSAtZQgk+W1B0R
	4aIGq5C3Kn40T3dSd+a4w0AVOueTwpvR+IeaPcLKiKz28v1V9k06kQyCJ8Awuzte
	5qaxJdh5E+SyWik69eopucn30CwjpeCL3SVhc+JkD67gR1dV6OOSp3Vk034bLVpL
	YatasxE+/iFZbF7+zWQNkRTEB51sIddkP4lbXgTIvFnClshOBEPlFqbmsT1mNfPI
	kIJ+wfwvVj9e6zmvMcuKHeTenvmHDXySKg7KLu24lVVIZ6+nMfj/E3Nl+R0jSUfr
	4X4jSoBWqpvCJfs621XohQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jhvdbsa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 18:59:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57II4JHK030809
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 18:59:12 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48jge95y1g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 18:59:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbVxz1BG60cTrouO8SmtGp+EUwfiZCjpzqBa4ruAMYNcvalyonq2D9sI1YEyPJvUH9imWgeBeYM5vLEH+08DJenxMsKh9kqLdR6duqYwwe0IXRYbKAGD43xTpY6Pw0aV7UiDlaZVAt8ykm+SWCO9FUE4SHKYYhYmfWu6CmN3zEutugBPvzoHMTcAnpxlKcx1OTj/esWsAivfpXHoMGggDY3oJsG8idPbrU2GIwk/mUMIYWo+oLV+JBj8u77P3FCF1ERdhQTqcUKg5jePLlDsAFA3/KM2LK80pRqZsm6V/4SQ6XQftyScQFJkN/sbGnaTXoU9K+AmHtfOR7m/3/QQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvufNXtYhZfUZ+pmfqC2ypJFvUcs5/akAEDSqytwTug=;
 b=Q3boeu+mtunEcLsBPN5ncd3s7bYoQZ2PazWmQXcXQC5UzSrCftv/6y2xqb8NU/zJxfiHbN2RvLLL0vAL+0fpuhaHZYIlqJimWyBNCGgd0oY3QhSKI6NKDH0yadBrLat21ivXZLQVQjPLJGcZpvF53p+xEAt9n1zflIyjihky07qzts6FjELs7bm2+YV2ccB2dqiQZ1Z5IR+LAeG3qBQU7xvzLtGs2AQXKtivkvoah/WmBJjHhfB8bmVzBykdoX1urFU2sUFSYig1XQrvFaVw5i6rSWwkHPo+pGWv6mnOORcBaZw9G1Ugf5N9isH1gmek2aXpj8raeu2VchxMAqRw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvufNXtYhZfUZ+pmfqC2ypJFvUcs5/akAEDSqytwTug=;
 b=K81SyO7bN/CgefisDX2URepsUHknojzL2tMB05ITy3tBLgdGDK9+3DUBRBfYlBTTtX2tFFHfzKHRwE6GqY5Fo3UI3/y5ggauvuWeglsYmqpcVitT4WC/HM9+0tUcX7k8dXFSOMC4Bhfy7E0n8vyomv0HFYm052zk9xIKfxJ5Pmc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH3PPFF6F1F7CB1.namprd10.prod.outlook.com (2603:10b6:518:1::7d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 18:59:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 18:59:09 +0000
Message-ID: <52a069d7-8b39-eb35-5dd2-9e71bb9981fa@oracle.com>
Date: Mon, 18 Aug 2025 14:59:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] Refactor the versioning handling system (code
 movement)
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56720FDBFD11C3DFFF3AD2F9C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56720FDBFD11C3DFFF3AD2F9C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH3PPFF6F1F7CB1:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad2c379-f421-4ef0-b461-08ddde894fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVVJNTN2ZFh6V3UxUS8veS93cEtkcitGdTUyMWZKRE5JVGY5M210NkpOR1I3?=
 =?utf-8?B?MDNHa0hidEE2RmNYQUg3c2hIZDJpL2dKaEZjTy9pL05tOExzQk15TWN0eXpK?=
 =?utf-8?B?dXAvQWxnVkFUblpMRWgxMXRQYzBRY09lTG1vTm9ieHV1TktkRThycWg3cGRp?=
 =?utf-8?B?Q0NqejdZWTRQRTdlVWJ6QUZ2VDJRUTFNM3NGZXdvcDNRN29TaVp2YzV5QXJZ?=
 =?utf-8?B?WlhQTzR4cXRhUHhkSElaSGMvRTRScXB0blJsQ2I1SXdSb0IyQUZqcjUwQnM4?=
 =?utf-8?B?azlEaVVsTjI3enljTHVsTUFRelU3ZXViVmVUbDNTRWdnajJDQjR5VS9teEhS?=
 =?utf-8?B?WC84Yk55RW9iTXlISWlLQStkUitHbTlaRVNjM2RCSlkwSkF3Ny9oRFRLaUNl?=
 =?utf-8?B?eUVDSVdCSHM0cDA3eFlQVXl2MUlkcXNxL1FrYU1rUVJaT0RCeDc4ZnBqSW9k?=
 =?utf-8?B?L0NWRnRqdm95dEpPdlJYVE1sR1d4YkRObHJ6bXptd1ZwQUJRYUxhdXV4cEFY?=
 =?utf-8?B?d2VBY1RBdXhvcGt4QVhoOU9Hd2ljREkrRVhPMHRLWTMrY29RUWE3M09Sbmtv?=
 =?utf-8?B?QXpzT3k5cGJjVm9QamQzMzMvRHhLaGJYbUJhV2cvcVJlbGxvUGwrdE9oS3Q0?=
 =?utf-8?B?ajBLbHZPajUxWWtJb3dJWkxIQkVMSGJReHVOWEJTR3BheHBUR1oxVDVTUzdC?=
 =?utf-8?B?L251RUpjL3RxUWNQNVhpNzJPMWVua2ZQTzAvcjJNWHVOMUZKYm5waHB4QUt6?=
 =?utf-8?B?ZE5xVXJOckNTSWFwUHZZN3Jqa0V1RUtMaUJVSExiZThKdWVFNTBTQ3NyajNn?=
 =?utf-8?B?TnJYd2g1NFhDNzB4RlJYdFNaeVFVdmUvNWNpYzJVU2xOa2F6M2lRWEc0Q3dO?=
 =?utf-8?B?RW5Od1F4a2tZV2lkdXZ3bGcwanRGR2FmM2UvYUJyL3dnT3BWNE5TUUgvQVI1?=
 =?utf-8?B?KzMySThMMzI4Vk5UVnNoeUhhRFl3NTVKSVVIMVZLLzVDZ3hFNGVJa1FwTlRa?=
 =?utf-8?B?NTd2MVF2b3lMaHQ1RHdqNGNJY1NQWHVhL3VYYXRJeGpibFNJcFNSYldpSTd2?=
 =?utf-8?B?bGJDdWJGK0REbjlOU013bnlQUzlPaUY4NlZ4bEF0VktxMXNibnZlRFhlUSs0?=
 =?utf-8?B?d1c5SG9mNEpRUjU2MUdqUEpBUWpaSWl0ZWRxQlUwVzllWTRjOGorNUt5V0Jl?=
 =?utf-8?B?RzFRWE1KWS9WZU5adis1bmIrZlYyejJ6Ym5OM1dWUm1mdWhxK2xpMi9zWGQ3?=
 =?utf-8?B?c09lZUlCY1dZbVRNeTZYaEhjLzNBL0RLL1lqU2JGZ1M5UWdxYURYMFVOWnRW?=
 =?utf-8?B?MERWbHBZaks4ZmlRb3F3dGZienhmMmU0UVpycXdaRHIycWMyL00zUVY4L3pL?=
 =?utf-8?B?MmxUSXY5WWZmS3ozVHV0d2QzaDcrQ1EvcWlwRXloaUp3clZhQlg3aWwxM3dP?=
 =?utf-8?B?c1N6Z1p4T2dPSTNKZUQ4ekJkbW9FVTE5OFdaMzB0OTBjcjRoYW5oYzhRcE1o?=
 =?utf-8?B?MWcybE9MM0N5RVJsWC9Bb2hidkl5Q2hpTXpuY1lLK3RMUnZiOGV3R2RNbGov?=
 =?utf-8?B?enlSUkhjSkJlQVprWVFhYk54M0hRdytzZFNTSUROa1ZVdG5qcGtyUm8rMXVC?=
 =?utf-8?B?cU1WQjNicllxSGs0WnorY1BPck1BTElXLzBxN21vSm9mM3VmUHMySTk2NmhL?=
 =?utf-8?B?TWNKRHoyaWhNZ0VLZ0M2LzlYbXNIaTNWMHRPeGtoQXZFR2NwRjBCMlBKTXRD?=
 =?utf-8?B?UjR6d1pIT3RBOHppcTdHSUh3TlNyS2RQaE5aN3VPNngya3V6Z1UvY1ltbXY5?=
 =?utf-8?B?dmFZNk9ZSzVkRVVWR1ZIWnY3eERVSjc1bFVXeUtqaUNtaUVaUlNqeldoM1Er?=
 =?utf-8?B?bUdRSzJrRTJoREd0cTRZTFNINTMxRVNWVU5aNDZzVEx2ZWtFa3d3V0FBc1ND?=
 =?utf-8?Q?jRB+Y5a2Zdc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nnl5cmFTVGxZdmNCelU3am5OdEFKVEdxOENmVmphWjEzdGVQTlhiV3lXdEV4?=
 =?utf-8?B?Mk9pMWludWJ4ZW9xZTlWMGpsZjAxLzNmUTB5eGt5Mk45VUk0dDB6Z1JUQThB?=
 =?utf-8?B?UG5mdzNlWXIrbHJJKzBGbStNdHMrOFFZbndiMHZvSlBmY2V1VWFxMHZvMDZU?=
 =?utf-8?B?SFN2VXRjclV5Uk5MaUR4OHc0TFp4Z3FGOXlhVU10eENPSFNWV3RkVnhLa1Vu?=
 =?utf-8?B?TWI0YlVaNFJES0gwOC9LLy9RM0VCdC8yZGJMYmx1WmJaMkljYTRmMEZkRlhU?=
 =?utf-8?B?WHNTTGdhVkN1Mll6aE5sSU1Sc2ZKQmlZQVdpVko0a213QVJXR1pqY201Q3Fv?=
 =?utf-8?B?VW4rN1RmQWwrQS9EN0dyS0M3dDF4RC9RSUtGQXlaeVZOQk16dkpsM0U0dG10?=
 =?utf-8?B?ZXJWNDhSL0tsSHdtQndSMXlndlQxcFVKTDFxUFhsV2M4ekxBQWthb1g0YWlV?=
 =?utf-8?B?bDV3RERVQjVVUThTTG1FaUh4SnlKU2JCaWdORE5iZGNMQSs3Z08vOVdFSDMv?=
 =?utf-8?B?SkpqRXB3UlJ6Q3hIYW1IQjFNaXJVRTlxaU5LT0draUJlYVFaYjZZSEpWTW51?=
 =?utf-8?B?S0lVVzU3M1ZPQXYwcHZWWXU0RE5HRmZGNmRDNHlnYkw5bU9JQ0FVWE1sM0Rv?=
 =?utf-8?B?NTBZaEhmNVpnamY4NXBONWVENHA1Y2tEeWJJUTc2NlU2RVJPeEhkVFVSRkp2?=
 =?utf-8?B?QStwVlZJS0JaU3oreHEwTHVtMldoZ2dDVXFXRFFZNklmSUdRamp4UFlhck9L?=
 =?utf-8?B?VnlwakRGTFJEUFhNZzdESXA2ZklqQjhXRFBna29YdFl3ODhDTjhkUVFveEY1?=
 =?utf-8?B?WlVGVGNpRHFzakpNdDdTSDhmbkdKRDQvMllqK3FkVURsaTVwa0k1eVZna0g5?=
 =?utf-8?B?QVFranJkQ0hCVEhhNmtmcXdpRGE2UG5SMFhVOWdzNnRSNFJKci8rZG9KZXhk?=
 =?utf-8?B?Y3pmNmpYSkRROXUrbXNxdGtTRVgyQlhhZ0tPSm1zZjJEODRXVGRJYzFVYUFw?=
 =?utf-8?B?ais4ZzNUQVZ3elVuN21Cd0o4OWMwMjlZdjlnTml4SThFUkVweDlxbTN0M2xy?=
 =?utf-8?B?ampTTHJiMkZOYmJrdVBONGpDM2RUcm8vaUtOazlwMjNNcW5VQ3Nha0ZYUVNS?=
 =?utf-8?B?Q083UEJqZ0JqYVRpQmRSK0V5Ny9MM1JQb1VnTTBIZGhoRnIvVFI5clJKekha?=
 =?utf-8?B?dCswWGV1UExzSnR3S0pTclJsVE9QWC9HVXIvd3RWc0R5ZUZLeEZSbTI1RGJU?=
 =?utf-8?B?NU50ZHM1OVZxcit1ZEtyaFUzL3NMUWdKMVJQWm1ZM1FlRGJBZnBXSGhxa1BK?=
 =?utf-8?B?QkgvQllMZkw5Z3NjWnc2MGZkNk4rdFlYbUU4Wmp3U2ZOWU4yRDRueFVSMkRS?=
 =?utf-8?B?OWFjeUJ6MmY2UEhGaHdYVTZzdEJYMWRnU1JETTdyYUNSZEZlNzY5VzNrREFO?=
 =?utf-8?B?Zmsyc1ZITmZuR1RuSlVnZ3MvNDBBeDR2aGxmUkhySTZtYlMrbmJhRHQ0cXdM?=
 =?utf-8?B?RVNRSW1vUTlxUS9LWG4xeDZyTUVDTVZ4QXpvajB5NE9nQ0VtTCtWcHZvSFla?=
 =?utf-8?B?VG5rMnE1aXlwTFBhRFJTTlNtYlVnbWZrZEIrZklEb29XWGJKcTQwU0xVMnVK?=
 =?utf-8?B?L095R0ZUUUZ2T0hNQS9obEF6RDRoUnlHblNtdGk1TkYyV0VjelphUXpXRlJU?=
 =?utf-8?B?ekg3RHp1TlM2SFpZYlg2MkdFNmFTYWtHaU9mOGdjcVVuOFZISG45MEF5Rzdw?=
 =?utf-8?B?L1BiTlJYOEVFZDN5ZStiUGpNcU9hdjFIdFBXQ1hydzlrYkNOYnl4OS9Kd3ZO?=
 =?utf-8?B?cHNzTzhXa2pZVnFJNjlBbUErbDJtZVZyQUU3dUtaVktSZ0ROU25teTNYRDBS?=
 =?utf-8?B?aVgxOVNzbWVwZXFwZ292ZldKeWljRWJEclRMMENkanhQS2E2OEVkSWhhazJh?=
 =?utf-8?B?MlQwSFFwekhRdnJCTm5sUFl6ZHp2cCswa3p2Nk1WT1NDd1Bpbm5iNGM5aFRa?=
 =?utf-8?B?SWZqZC9mR2ZsWXM3VTNVMFJXQkFCMWlWUlZ0bjJFN1A5cGVKVGFmUXdwRStP?=
 =?utf-8?B?bWlkOFgvL0poWmhWcGR6a3F6Ylp1VDZIWG9QNjUraDhvZGlMU00zVXEzb2hK?=
 =?utf-8?Q?oRciPJqXteTaqtXYYPijtAXpG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s0VW3q1WTvZYNM8X5FZticUhvSLY5qB2KUaOBQ30ecwgbxPFdxdPmVRT1lh949ByrgppJuHlYn0tAaKH5iut8M33Ysu+a5RTtWV1sI5sB4ytBxj4lShN/YAtdbV0ELy9/Y6XehJLDx6OV7bapeFcMoT4vNXNCDhWo/Vs9ETc9wdDZ27iOcuZ0DrXprxNF+IIx3ICaksLyJmU3AVXrDzclvzkgIZCSbgFu/ZUkDeFI1ezHY0dbFcHJVbKoyhFEkJ5QFRKoJiNehVzz1Sg+5siDK8YKLy8aB7b6xtt2WNQPZaAstYdantFVhpd+JdQxNHSE96q71OV9u8EAQiH8qd5+J0KLvO9Fj6+/TSdX/yYn2jew69Vo8VZM7ilpgf+q3xyjs8W2FnBe+RsYpHW/BeYfUjCONyuMuwC+Kr+2A3eI3doe4fKR2ZHf0SFaW3tEmd2lWj3Og1tnkzuBH7G82NOL/fe22wmMyv5wQt2LFKISgYJs7FmUL7kCoqnNtmA2bF1A7t3bfoCKeXf+S/i9cZHtsRq601To2mikB1z7RHvVylUbXzLBrrnoDbXEud6hv6xZIWL8OeYB/Sn2P1N9ONXgJfMr/JQ7aRm0mefRK4tsx0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad2c379-f421-4ef0-b461-08ddde894fb0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 18:59:09.0776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQBwpjpNgZvNVp9WL9qtJWBkmw52z5gQ4zmflg79KyggT0oFkq4eBUouQOY4zxXkhrIny82N6r+DZbYg62+cWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF6F1F7CB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508180177
X-Authority-Analysis: v=2.4 cv=TNZFS0la c=1 sm=1 tr=0 ts=68a37801 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=70k8ZiMFYwEfjjIQIG0A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE3NyBTYWx0ZWRfX24Ktr1e/yZ1f
 LhI2ciFbAv7n/np/rjJH4zE2757SeqICq9k7TVspY281KKwENMFdSuxtERJdxx/k8tcvyGxzGMC
 c6CwHpoHSwvJ+8UQqLVi9tBVYeWWRAmzSTdRHenc5ag7opv5SeTbhINJFE4cRAHNXdNOGKEmQR/
 PjFVHOtPH7AKJZGmfulEiA6/7jwPYYMoUGuse5FGjFPOyG8YICf8s/cLvUjHNbmdiRRMI4VjHp4
 vwB5n6QhTw4SjJOlmtAihQGOVNgAPGvX+a+t02dXUPyG/GjjNziixyKFZsZJnQS0FRioyNKfRcJ
 NDSunyqIpCR0OOMKxv5EQWcLiTaBPKoFhkshEqkzMhSRuSa78VZrD9txH6jkEuLzWPaOxtbRSbn
 0NBLC1vAtI0Hid//psfCPSrNEAlspRKtMOZ0ltHFj2ToxsDkVlwpq6HyY3xPaUbn7cA5ewDA
X-Proofpoint-GUID: fSRL7r8WJVPwX1gIjKCQAm_Rty8KTd8r
X-Proofpoint-ORIG-GUID: fSRL7r8WJVPwX1gIjKCQAm_Rty8KTd8r

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/15/25 23:46, Kris Van Hees wrote:

> diff --git a/libdtrace/dt_version.c b/libdtrace/dt_version.c
> +/*
> + * Convert a string representation of a kernel version string into the
> + * a dt_version_t value.

Ideally, that extraneous "the" would be removed.

> + */
> +int
> +dt_str2kver(const char *kverstr, dt_version_t *vp)
> +{
