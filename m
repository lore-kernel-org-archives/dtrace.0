Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2BDDD2
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 03:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759806336; cv=fail; b=nxlJuBvP4pyxthcRwQrTTW1Mx90n0fm+elaRn2956CrCamvAYcuOvIGgUWwuu+XBqOI0WEcOs7ZrmtSaCguLSBeAyPl7/jAaWBt/P2qGYWL7zxAIGDWuBPA/YJf/AMLmyInAaiXqVXsmTxdMCZaZV/SMK2WJtBvqng+XVDr5EqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759806336; c=relaxed/simple;
	bh=G7mLkWYqd/1kM6OuKInV+xDGuYWLu43obByME9EoyUE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RVdlGRtiSz+bar6HK2w3QZfINe7wjRJYQPg28/UXgLRHThgfs1d9Ho6E1XkLWCvXiY5kD3DPChkoVjI1oqD8058oLu2itxDDb3UKSRjBAbG3kOeuoSw5JhncgZk7k33Rmicmi3aNgmLC60sZ6frOkkjUPB0s6+tUeofEp54RR9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LwKLZEgB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H42d11uM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LwKLZEgB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H42d11uM"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972qDBd013847
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 03:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2wfu6TDEFHK0kRWiqo4GdlnsUB+LYdbHKVdCLkShQLQ=; b=
	LwKLZEgBjIk9oCOauZnnTjE2PjwbHDWTpGX1xVRWtTBZ1r1sw7xqvVLQU8VgXpvD
	TxRpDMNUwGkGbcStEOIapnnQpvNX1XZhoRSnJMBW6wvDtJItD56NY/zw4uLH7/1K
	5eBL3zYo5PRivkmW28lwQyMmnoGZKNNsTb4cax+mgAX3it5+ISOlj1Kq4mbolUbt
	4ePk07dYp1Ui7Cj049keM4Aj7Sgf+h8ml3EXmZFzXJsw7ULcW6LGsgTLfI70+plR
	16f5PZg2sjpIWOB5XjqPfZsFJ2AOtq/3vQQvs/e6MUg3lVTAlWus05fM5OCer5IU
	15Dph+M4rnVIBy41YOPzvQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mrt7r3bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 03:05:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5970T2lp004828
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 03:05:33 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17uv5y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 03:05:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+AS5gv5Bqt+34JbdkchgjicZIGPDGqG155mseZY2oNapNOJ8jxDrO/TVfmHP0dndBnGSnwlOjTPw/ZWxBZTj3cNoms3EdoEwxSRmtHraNY33jBCYdAMPCv2GAvlSnVD5wqVPLCpIH/uEui/D6hm234joOdyLjOCAZ+9aiep7+L+0LjJP9x2Q/qVrLUUagR49+zl6qG2yaUixxRlen5ffT0qsnxnANwSCk1V4pr80rSiKgnOxzhcQ8fdMrTFjY/2V4O9o70iLwGhC/2iZzQfKbsyvoydY7M/+WoPTsicnGjYM6ukn/p9HEl05geLHbt4+GX5hcaahk4//UtR+3eNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wfu6TDEFHK0kRWiqo4GdlnsUB+LYdbHKVdCLkShQLQ=;
 b=qhG7HhUMD7VH5C7AovY70BYS7Qjr5WhDlR37l8B8dC3EqSct8uB2U/9XJ1BgQfsEhfT6WJfcd5yoIUMKu69hsuqENSy5CWW7TObjvtSn1QitmR1hCcORUX2np/Dt68QM4+jdqknqed0w5CWMIuNGvq5Knu9XzRfYG9NAz4/bIzAnjjkadgl4lrypNPTWI+ZyltpSTWTwZYd1bK5TjLfJUvIlKWPhcc/dMyOABvT6ghCZLs3AI/2FyH5U+NuwcBOXk95HmhUFDtoHT8TySKmAEmw3FiBCcClokOvXC7U29Y/OztZCNe1SZPMZqkf+pkLZS+zBlA5VS7ofwxrBVEQ3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wfu6TDEFHK0kRWiqo4GdlnsUB+LYdbHKVdCLkShQLQ=;
 b=H42d11uMsxAbiIzn89LRhjMRRZZPRfgjPHrR0Y32Ot4tea2oc07atS0uOq/wttDFll/rFsze09cpRqm6eM2qAGps7wZZdkUrBm5fwYLq5RV1ejJ+bJmbkOevGZN9qBJnDX1A1ia5u0KxLUTRGNEHUmnC09DKJ2N9GEo5p/qWLaw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7906.namprd10.prod.outlook.com (2603:10b6:610:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 03:05:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 03:05:29 +0000
Message-ID: <49de3429-e44b-a0a6-8370-76596b165934@oracle.com>
Date: Mon, 6 Oct 2025 23:05:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] cg, printf: allow storing [u]stack() into vars and
 printf using %k
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567299E6DEDC0CBB101841DCC2E3A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567299E6DEDC0CBB101841DCC2E3A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0064.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 53151e40-ed4b-49ba-be94-08de054e5f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ty9iVXMzaDFRRmdMY3kwK0llVG1FUUo4cE4yMDl2MjZMQjZpZnE1L1RoTWtv?=
 =?utf-8?B?ZlZ2QUFnS0YyVnc4aXZPQ2h6RjMzQlN6eVNZcGhtTzk0TnFSSmxkUXpzQ3Vj?=
 =?utf-8?B?c3hHN3JUZWt6bzBEZUMrQ0lIREhUamtwY3RVdmNqeGhXMXJiSHFnSC9kYVov?=
 =?utf-8?B?OXk1UFRiNVI4TThxcTNNK2NCcmcyUGdNUUJRNmhRM3BETTM1Q1VFcEdQMUtG?=
 =?utf-8?B?Z2lHamx4bk10WTZJR2IvRzBZWkljY2N6YktKeElnV1ErRER6dkdTVE5WMTIy?=
 =?utf-8?B?UTRDNjNuWjMxNk5KeFZCeFZabG5CemEyY1FFNVJkSFkwbWdzUlAxSk9UNGFh?=
 =?utf-8?B?V1E1azJsbzBOS2ZRdUVSK3pqeFoyWTJ4TVNrK3lqK25ZVDR1YVVTY0oyaEkx?=
 =?utf-8?B?cUVJakhua3kxcVI4d0lUcU0yYmVLdmppMUtoc3RDcUNEa21FdXlIaHNKYWNS?=
 =?utf-8?B?Zlo3eFRIQmJUZDlOWTFKdnJJQnUyUHhXQkdtRUJVOGU1dzNMWklBM0I2dDV3?=
 =?utf-8?B?WUNrb2lPNEFHK2Q3Y2c5aVpLbFJMSFEzNTBMT2JvMExXNmthZitkcDN4YWFJ?=
 =?utf-8?B?b0VBSlVCbVNPajloM3l0YzVaQzlUNHl0bXlHUXJUL3Z3SHJockpjWGVXYkJR?=
 =?utf-8?B?Mi9hNGV3V0dBVlU3RXk1a3pqYk1Qd1ViZFV5ZzJ5WU9zaUgyaE8weEUzNXkw?=
 =?utf-8?B?UW5oWnhFZ29hTG56a1dRd3UzaGVGMk9lV0dSNklDZklrSGI5d1gxQmZvVVkv?=
 =?utf-8?B?cUpRVzk4b2E2MWE5Umc4VG5icWZENWJadTQycFN0bk5TMzBpZDlPWXRpc1N2?=
 =?utf-8?B?OHllbjA3b054ZkR5M0JnVHhLcWRoeEl1WEIzWWpZcmZuaElOaE8rcS94enJZ?=
 =?utf-8?B?eTZlL3pFYkdjTlNvZ1lVZldEMFIybU1walJBeUhPTWVMRXQ1SWMrUWxwVkF1?=
 =?utf-8?B?L2ZTdEZ4UXFuKytoTkFEWEFFMTcycGdWUEZMUHg5MTh1WVVCdmZaZDNEdFJk?=
 =?utf-8?B?OUpYWXJVOVM0dE5HdHVhRUU5TFM3RnJnVk1RaHh0QjIwczF5RFRtYTJhV1lE?=
 =?utf-8?B?WUxNZVYxN2J2c2FQVHJHUUlxQWszS211T1dXYW5KV0FXTDFnSGliMFp0dktn?=
 =?utf-8?B?RU84bGY3bFJKZElmMXhMYzdONVFINUNQU3lWY24wT0pOZlZCOHFBNzBHTnNQ?=
 =?utf-8?B?N2lpTFdZbk5FOTI5eXpSYjArTkdJVGZsdHdDa28wKzB5Sk8vYzBZSnUycDVn?=
 =?utf-8?B?UjhZZXRUZnZIQTRMYmc3eUZ2OVNLWnVsOFJ4bnVMdTd3UmY4Ty8zSkRCZ1dy?=
 =?utf-8?B?Yk1EWVp6cUZOMUZFajZtbnlQSXlpZklCY3F2by83ZHhHdVBQQi81OU5wSXMv?=
 =?utf-8?B?MXJFbjFva1NBUlBDaHZPNHA0cFJtNTE5M0M0UFJhd0pnc2xmY3BvdUpmTVdS?=
 =?utf-8?B?OE50OXAyVzNEaElOOTJPbU5BSVRJWDNCL3VWT3dHTk11SmZJVW5zbGZzZWNE?=
 =?utf-8?B?cklZRlYramhwSWoxS21oZmZtWFUraEVlZkRlWm1UYUhGUGViYUtLeUlpR1JT?=
 =?utf-8?B?ejEycXNzbUNJWjl2SHdkNEpkY0VNVVlPR0lSclVrWFdVUWIweWNRSDF2dGM5?=
 =?utf-8?B?M3hkRUF6bEw4RHZyMGt6dDVtdGVBcjI4TG9KZXUxejF0YmI4bGFLcjU2Q2JW?=
 =?utf-8?B?ZmJuSC9uNkhEZncyWVFjczdSVkhMdHgvc3pJZGxtbHN6NEdzamQ3dFl1RFgw?=
 =?utf-8?B?bW11cWszZXQzWmZSY01ISUs2OXV3cjVrbEJBTEJMNW9xdGxqTWltTlZIVDhm?=
 =?utf-8?B?anNWdEpDd1U2U1NCOVhLLzhIdWFMMVFvWW1IU01ObW5BK0xFNzRzSUJpSldY?=
 =?utf-8?B?QWN4enRzMDFsZlZ5LzhNdjBJR3kzU0RKU0JWbks1VFN1RVhzbFdnZ09CWE9C?=
 =?utf-8?B?V2srMXpUaWJJeW9SNTFxK2VtMVRJM1JaVFNCTnRLZWxQblcxV1E2SldqdW1k?=
 =?utf-8?B?b2xVZ1lHbUNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHpkci9POVY4c3JJZHp2OG9JUnRKc29UaHZ1UEZENE15a1hiRnIzUC95dk94?=
 =?utf-8?B?dlk4OU14eXo5OGgwemh6ZS95Z28vYUlhRzBhYUdXeWhsY0Rzc3VoZjJWcVBz?=
 =?utf-8?B?MVNDSHNkcG96N3BVbVNLYVdvTmxqSlJhbHF2ODdpOERVSllNZ3ZnQVFaMVVh?=
 =?utf-8?B?TTVyWk55LzJWVlhkdnhEVHJYU09QQUMwL2Z4MEFXNnRFTjZUMXZIcWtucWwz?=
 =?utf-8?B?K25SdjlRL0pRNWFtMXozR1oyL2F4dDFXcEZZZ3prZk9peEpOUkswcHI4TUlO?=
 =?utf-8?B?YmlQUk5OZGhUVmJRU2VSUWNoLzMvYUhxb1FyMThlb1ppRnV5c3Z6TFl4RWVq?=
 =?utf-8?B?UVRmNkJHbVAwNENZd29VWDU4TjFubXova1ZhV25nWWdDZWw0WS8vVWZxaG9B?=
 =?utf-8?B?RzlseklPQ1ZSRW5KRDdSZEVHK0dEUHp1UUEvSjVIR2NYTENjYUE5L3d5VmYx?=
 =?utf-8?B?dHNkbjhmRFEwclRyQ3dBemp0OXlpd2c0UFlDLzJEZ3hqYThGdDFjT0M4NklI?=
 =?utf-8?B?SVJGMW4zUW54YXRZVWxjb0ovVTY2L3NFb0VoVk81SWpQR0k5blFPVnZsZ1VD?=
 =?utf-8?B?VWF5NWpURVRGRksyQjdFdFF3NTVqSThMZm9qNDVuOGdUQ09sOG4vMmFLai9r?=
 =?utf-8?B?UzhOVFdKUTJEcHJ2VlNINlo3TEF3RDRxNEJ6YjNNbXVTMkU1SWhkTzJrVy91?=
 =?utf-8?B?eXhZeXlLcGVZYWgzK1dIbEZsbUNyanJQSEVlS2xtMmNGTGdBb1BMSldsNmx0?=
 =?utf-8?B?dy9CQkhwVzFjdGZTSEowOHk3YUI2QkR1dkxyVzNZMzJISjF1Wjd1VVhrMXFp?=
 =?utf-8?B?dzJGTUhnNW1VWGFRMUJKWTdjMFQ3cy9WdldEeDJ0RXYyYXhETWNKcEdWVjR6?=
 =?utf-8?B?NWtidFByTnNHU1F4emxnOURtZTZCSTlNRCtNcVcwUndlejdtRFFlVXBmSGhs?=
 =?utf-8?B?QnNzd3puY1ZUd2FnN1dLdnM4TC8xYzEzUGZ3cEZDcWxlZTd0RVgwS01yU01Z?=
 =?utf-8?B?RXBRUjdYczlsSG0walBBQ0M1UjhjbDVZZmpVdzN5bGNlOWRrSEpSblc4WnRY?=
 =?utf-8?B?b2FHWG96VU81eWlpclV1OERGbjVrVDRIeU9heUhLNVhrOHVmYmhuNEVhUU5u?=
 =?utf-8?B?dytOZVYySE1mdlJGZTIvYWYybGxCbWRKaExFSTZuS1RzS2hFbnBjcEREUEZX?=
 =?utf-8?B?eEs4TTk0YTZROWpSYXhPL29KNmh2dldyakwxVy80VFR0T282OXNGMEdrdDk5?=
 =?utf-8?B?MmJtVDRQd1J6Q09uZ09FamdCeVZGQml0ZEdvTmU3QzFjVVFzdVE1c2d1VWov?=
 =?utf-8?B?K0JWOWtvTm55YnR3QTFKWVZQbWU2NG5PQUhpWkRURjlQZ1NUNVZlZ28rR1pK?=
 =?utf-8?B?YjBKdjdydmRuUnE1UEtEazlFMGppVUp4emFrVXk3QysyNkJpcUlCdWp5OVdi?=
 =?utf-8?B?THhmMVpCN2pRbWNxdmUxcVM0OUlxOHA0VkxKb1hTQ1dSbmtRaDR1UnZpYnVZ?=
 =?utf-8?B?OWRJc3JjQlFyamZoYUVmYVhJbzk2QkxTaWl3UzVRS1I0THU4M1kxUWozY1Vt?=
 =?utf-8?B?RXJ4UitDSHRrdGlQbHR2dlpzTkhpOXpUVXdlZTIvOWJDQ2FwdlBsdXpid29z?=
 =?utf-8?B?TmNLdWcwN0thQzluU3FQMGdMWkl3dmcwUkQ1VEFuOThob012QlptZXhJZzlr?=
 =?utf-8?B?K29QLzhRUWluQUpLK3R4OG1Oc1JVbmhtM21TYjhOYVRrcU1TMUNSeC93M05N?=
 =?utf-8?B?MUJxcndHNDV4VGxQQ3dhQWlCUTVJcVoyQ0hPS3VWeVVwZFdHUUF4M092cFV1?=
 =?utf-8?B?UE1qVnJqamlxK2NqNHVnRUk5dkhLaUR1b0ZGYWp4K3ZYOHFjYTdyd3FKSEhF?=
 =?utf-8?B?SDlKMkxJYjlFZDRQS1lla0lEaFlkWWFnV1A3WC9zVzNwQnhoRGRSKytIUnBB?=
 =?utf-8?B?MWs4ODNyWmVtOWg0NGZCcmxKREhWaFpvbjhXN1FmcXUyL1Bta1hGc2dTV2NN?=
 =?utf-8?B?QmlPMm12M1c4aDFvVXRCWUdNazZnQlVDbUxvMmhOMHB2MndVTkFXUXQrbHpO?=
 =?utf-8?B?ei9zR29Mek55enBtWUs1ZktiQTZlejJ4L2NIWGhRcnZOZnlSVlY4L3ZLWXVm?=
 =?utf-8?Q?jvpJJcmb3XKMHDElGgiOv1dou?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	24cmpnluwmZVhUxYW8btdOafXR6iQkLk1X2ncQ6655gL7t3lPGsKVz6YRoCkyPQWmmU6kAO6VUavKZq28H+Evh5bzmC1umIR45lpuJe6nu99fQR76RbTl/dlcwKuSbpZjfIL+DTt/sJalzDvOBNHVSzFrOZag0JpoM/JPHtQVMkFdDxIlb7i5u4YYp60chbPMaz0Hk+3vuy5ks2ZZZ7vYM/WFvKEqK6uBftlr7HcCKi0D3DCRlBVUxsMZerotzoFcVtypNYKwODMXZ6YT9nSUd2xh3TwHySxljqv2qAmZ+taotFfJAqMigZWXtoWzbOvUeDYZDNw2NdV2GY5CCvfF2n/CGJp9rpKpS0WFNP9sEwkQ1a1HtJMhRZaNHjciUlhIgOTG7P3TrVrRXyj95W0BvFXhMSjGSKM9lnxLz8snQXNjGpxb3FMJh64xqXCo3HRJqmicetIHSyRaRQH3vFXZjYv/A/4r//a6dyeQmwAM6CUD05XsZGw0EFCVBYr/1A9MkmrFp9ctnMoG5vKe3Oq7P1kqb3lZ/wgUUbWn4L/QtZAG6OGKWndBGPb4/S6Yy8aKPGH6K6tqUgDAyRr2Z1bSuLlwW4pWaubiwvzVtdF9f4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53151e40-ed4b-49ba-be94-08de054e5f03
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 03:05:29.5092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYz1v6iRr2xfaiip1NrfPnklVeVzURcwhcsEOUUWJrI2t3ei3ALElmTi0HE6Hg9qeZ19UeQy3r1CvQX1wa8ENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7906
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070024
X-Proofpoint-GUID: zE6ZaCaXMJex4qc-g_xG7M-STqS-s5GA
X-Proofpoint-ORIG-GUID: zE6ZaCaXMJex4qc-g_xG7M-STqS-s5GA
X-Authority-Analysis: v=2.4 cv=SPZPlevH c=1 sm=1 tr=0 ts=68e4837d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OpT-_sPi5yqkU4ijBv8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDAwNiBTYWx0ZWRfX507y+hX4pjHw
 JATjpwCgsHStXht9wWg/hWNEaCSHHNU+Ur8BdZPyolBo7iXgZeOOIrslMyKAiVBACuKThYS2cFz
 sdmM0r/vbl46zw86Db8VYelTxMQv9cyDfvOF+ICSNix1q/vVCZfFfF1sJvBNvDd1GC5+jz5QEWv
 akeEu8xSh7H9t+JbjlYUi4guF6mvwt1Xb3oJhcPeLq+iS8PBm5o7nVuIDeJO+xG+DuNyi89jkJe
 +h51ZJ8NmIkRxz4XzDkETJXx21FcZFWEMwi7TGD41ccpsp3LBtbkaxgF0oE8FUAU2bHBSe9bkxE
 Tso1lIb8vf5GraVf4tIXqjLmy4HOGBbkGtHdPtRy/d4n4NQ8IeBSrJQT3WKZluwyU+rZYRz0d2W
 spfhuP0jV/a+vPZG1Q/s2GETmGB4Yg==

On 10/6/25 15:55, Kris Van Hees wrote:

> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> @@ -2647,11 +2647,16 @@ dt_cg_act_speculate(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>   	dt_regset_free(drp, dnp->dn_reg);
>   }
>   
> -static uint64_t
> -dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
> +/*
> + * Extract [u]stack() argument data, storing number of frames and optional
> + * string data in 'nframes' and 'strsz', and returning the storage size for

Or, in '*nframesp' and '*strszp'.

> + * the call stack data (not including the size of the optional string data).
> + */
> +static uint_t

Again, I would think that "size" should become uint  in dt_cg_agg() as well.

> +dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind,
> +		uint_t *nframesp, uint_t *strszp)
>   {
> -	int		nframes;
> -	int		strsize = 0;
> +	uint_t		nframes;
>   	dt_node_t	*arg0 = dnp->dn_args;
>   	dt_node_t	*arg1 = arg0 != NULL ? arg0->dn_list : NULL;
>   	int		indopt, def, inderr;
> @@ -2760,17 +2772,18 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
>   		dt_regset_free_args(drp);
>   		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
>   		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));

The unnecessary MOV32 instruction is okay, but I'm curious what your 
thoughts are...  why you're in favor of keeping it.

> -		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
> +		emit(dlp,  BPF_STORE(BPF_W, reg, aloff + 12, BPF_REG_0));
>   		dt_regset_free(drp, BPF_REG_0);
> -	}
> +	} else
> +		emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 12, 0));
>   
>   	/* Call bpf_get_stack(ctx, buf, size, flags). */
>   	if (dt_regset_xalloc_args(drp) == -1)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
>   	emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
> -	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, aloff + 16));
> +	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, nframes * sizeof(uint64_t)));
>   	if (kind == DTRACEACT_USTACK)
>   		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
>   	else {
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> @@ -569,18 +570,41 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	return err;
>   }
>   
> -/*ARGSUSED*/
> +/*
> + * The data at vaddr is structured as follows:
> + *	uint32_t	depth
> + *	uint32_t	strsz
> + *	uint32_t	is_user
> + *	uint32_t	pid
> + *	uint64_t	addrs[depth & 0x7fffffff]
> + *
> + * The 'depth' member provides the maximum number of addresses in the stack
> + * trace.
> + * The 'strsz' member provides the size of the optional string blob that is
> + * appended to the stack trace data.
> + * The 'is_user' member identifies the stack trace as kernel space (0) or
> + * userspace (1).

Or, instead of "1" it's ">0"?

> + * The 'pid' member provides the userspace process id for userspace stack
> + * traces and otherwise will be 0.
> + * The 'addrs' array provides the stack traces addresses.  If the stack trace
> + * is shorter than 'depth', remaining addresses will be 0 and can be ignored.
> + */
>   static int
>   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	      const dt_pfargd_t *pfd, const void *vaddr, size_t size,
>   	      uint64_t normal, uint64_t sig)
>   {
>   	int width;
> -	const dtrace_recdesc_t *rec = pfd->pfd_rec;
> -	caddr_t addr = (caddr_t)vaddr;
> -	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
> +	uint32_t *vals = (uint32_t *)vaddr;
> +	uint32_t depth = vals[0];
> +	uint32_t strsz = vals[1];
> +	uint32_t is_user = vals[2];
> +	caddr_t addr = (caddr_t)(vals + (is_user ? 2 : 4));
>   	int err = 0;
>   
> +	if (depth > dtp->dt_options[DTRACEOPT_MAXFRAMES])
> +		return dt_set_errno(dtp, EDT_DSIZE);
> +
>   	if (depth == 0)
>   		return 0;
>   
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r.p b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> new file mode 100755
> index 00000000..9999094f
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> @@ -0,0 +1,59 @@
> +#!/usr/bin/gawk -f
> +
> +BEGIN {
> +    cmd = "uname -rm";
> +    cmd | getline;
> +    close(cmd);
> +
> +    if (/x86_64/) {
> +	gsub(/\./, " ");
> +	maj = int($1);
> +	min = int($2);
> +	if (maj < 6 || (maj == 6 && min < 11))
> +	    missing_frame = 1;
> +    }
> +}

Cool.  Nice solution to that problem.  Unfortunately, it fails for me on 
all ARM.  I think the problem is that the "missing frame" problem is on 
all ARM:  even newer kernels don't fix it (just on x86).  So, for arm, 
missing_frame should be 1.

> +/myfunc_z/ {
> +    # check probe
> +    if ( $1 != "myfunc_z:entry" ) {
> +        print "ERROR: expected fun:prb = myfunc_z:entry";
> +        exit(0);
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if (index($1, "`myfunc_z+0x") == 0 &&
> +        match($1, "`myfunc_z$") == 0) {
> +        print "ERROR: expected leaf frame to be myfunc_z";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing second frame";
> +        exit(0);
> +    }
> +    if (index($1, missing_frame ? "`myfunc_x+0x" : "`myfunc_y+0x") == 0 &&
> +        match($1, missing_frame ? "`myfunc_x$" : "`myfunc_y$") == 0) {
> +        printf("ERROR: expected leaf frame to be %s\n", missing_frame ? "myfunc_x" : "myfunc_y");
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing third frame";
> +        exit(0);
> +    }
> +    if (index($1, missing_frame ? "`myfunc_w+0x" : "`myfunc_x+0x") == 0 &&
> +        match($1, missing_frame ? "`myfunc_w$" : "`myfunc_x$") == 0) {
> +        printf("ERROR: expected leaf frame to be %s\n", missing_frame ? "myfunc_w" : "myfunc_x");
> +        exit(0);
> +    }
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit(0);
> +    }
> +
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.store.d b/test/unittest/funcs/ustack/tst.store.d

Okay.  Just curious again, though.  Is the omission of .r and .r.p files 
for this test intentional, given that the stack version of this test 
does more checking.

> new file mode 100644
> index 00000000..6a9f7c94
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.store.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: It is possible to store to members of dt_stack_t.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	v = ustack(5);
> +	v.depth = 2;
> +	printf("%k", v);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/printf/tst.stack.d b/test/unittest/printf/tst.stack.d

Looks fine.  Other stack tests seem to be migrating to hrtimer_nanosleep 
-- and dumping the destructive BEGIN{system()} stuff -- but that does 
not seem necessary here.

> new file mode 100644
> index 00000000..db943c29
> --- /dev/null
> +++ b/test/unittest/printf/tst.stack.d
> @@ -0,0 +1,33 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test printf with %k and a stack argument.
> + *
> + * SECTION: Output Formatting/printf()
> + */
> +
> +#pragma D option destructive
> +
> +BEGIN
> +{
> +	system("echo write something > /dev/null");
> +}
> +
> +fbt::ksys_write:entry
> +{
> +	printf("%k", stack(1));
> +	printf("%k", stack(2));
> +	printf("%k", stack(3));
> +	printf("%k", stack());
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/printf/tst.ustack25_pid.d b/test/unittest/printf/tst.ustack25_pid.d
> new file mode 100644
> index 00000000..9ae3a7b8
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.d
> @@ -0,0 +1,21 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +#pragma D option quiet
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	printf("%k", ustack(25));
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/printf/tst.ustack25_pid.r b/test/unittest/printf/tst.ustack25_pid.r

I still don't get this one.  Just as in v1 and v2, I get consistent 
FAILs here.  Does this pass for you?  So far as I can tell, there are 
issues with leading whitespace.  How about trimming the leading 
whitespace in the .r file?  And...

> new file mode 100644
> index 00000000..e7732fb8
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.r
> @@ -0,0 +1,28 @@
> +
> +              ustack-tst-basic`myfunc_z
> +              ustack-tst-basic`myfunc_y+{ptr}
> +              ustack-tst-basic`myfunc_x+{ptr}
> +              ustack-tst-basic`myfunc_w+{ptr}
> +              ustack-tst-basic`myfunc_v+{ptr}
> +              ustack-tst-basic`myfunc_u+{ptr}
> +              ustack-tst-basic`myfunc_t+{ptr}
> +              ustack-tst-basic`myfunc_s+{ptr}
> +              ustack-tst-basic`myfunc_r+{ptr}
> +              ustack-tst-basic`myfunc_q+{ptr}
> +              ustack-tst-basic`myfunc_p+{ptr}
> +              ustack-tst-basic`myfunc_o+{ptr}
> +              ustack-tst-basic`myfunc_n+{ptr}
> +              ustack-tst-basic`myfunc_m+{ptr}
> +              ustack-tst-basic`myfunc_l+{ptr}
> +              ustack-tst-basic`myfunc_k+{ptr}
> +              ustack-tst-basic`myfunc_j+{ptr}
> +              ustack-tst-basic`myfunc_i+{ptr}
> +              ustack-tst-basic`myfunc_h+{ptr}
> +              ustack-tst-basic`myfunc_g+{ptr}
> +              ustack-tst-basic`myfunc_f+{ptr}
> +              ustack-tst-basic`myfunc_e+{ptr}
> +              ustack-tst-basic`myfunc_d+{ptr}
> +              ustack-tst-basic`myfunc_c+{ptr}
> +              ustack-tst-basic`myfunc_b+{ptr}
> +              ustack-tst-basic`myfunc_a+{ptr}
> +
> diff --git a/test/unittest/printf/tst.ustack25_pid.r.p b/test/unittest/printf/tst.ustack25_pid.r.p
> new file mode 100755
> index 00000000..c0110e00
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.r.p
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +
> +# A pid entry probe places a uprobe on the first instruction of a function.
> +# Unfortunately, this is so early in the function preamble that the function
> +# frame pointer has not yet been established and the actual caller of the
> +# traced function is missed.
> +#
> +# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
> +# See commit cfa7f3d
> +# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
> +# for both a description of the problem and an explanation of the heuristics.
> +#
> +# Add post processing to these test results to allow for both cases:
> +# caller frame is missing or not missing.
> +
> +missing_caller=1
> +if [ $(uname -m) == "x86_64" ]; then
> +        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +        if [ $MAJOR -ge 6 ]; then
> +                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
> +                        missing_caller=0
> +                fi
> +        fi
> +fi
> +
> +if [ $missing_caller -eq 1 ]; then
> +        # Add the missing caller function after the current function.
> +        awk '{ print }
> +             /myfunc_z/ { print "              ustack-tst-basic`myfunc_y+{ptr}" }'
> +else
> +        # The .r results file has an extra frame at the end in case
> +        # the caller frame is missing and the 25-frame limit goes
> +        # "too far."  If the caller is not missing, fake that extra frame.
> +        awk '{ print }
> +             /myfunc_b/ { print "              ustack-tst-basic`myfunc_a+{ptr}" }'

... trimming the leading space in both of those print statements.

> +fi
