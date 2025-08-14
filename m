Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D774D225761
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755188959; cv=fail; b=Czn1mezKqluRoNm1eV9Ae4hhKYU7Ge4YysYIosn5HFFoGoI4R6uQOtcPFDZiBMKy9z8/l4TsJ0AB1/NQqYe1RMRkxteDri8Yfbd3yeowbUQX/KculZx5L+iOwM4zdIDmq+jW6ErMrLNi/BH8DxWf5UmQx1iJ5rnniwHOMIMDXcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755188959; c=relaxed/simple;
	bh=6/6UyelV+0X4cFlmHGaeRLlmerSvDMECL92m56TBBHA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ADXorfu0FvTLvN2Yl6cINll1WCecmgAd98CwLMQ8c4u9WORnJ0rgxf/Iuua/yrBX9Q+w9D9Vy8m5r+kzSGor13RvBMTsk3mOMRu9qr6VHjn9/85WK9sjq4g3VInEC9BdzHqici3/nuJPCjU9p4sLivgKS4gwXD0KyxpKLAlj/4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MdA+LCtc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t8xPGRya; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MdA+LCtc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t8xPGRya"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECg8De005767
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=331mdrux2OI1tafrHNSPqWwUR3L1ry9SDrxQ/djmbs8=; b=
	MdA+LCtcuduFDT4nwhbfICg59cE6Gr5khG9N3xzvNTF4nPAUndsPO6cXC6rWbuhd
	pKbwE6geQEFHcD3AwY2hatx7RrKMOPDJNl0GV357660EGBiInL9Yhd6sPzJy0JtQ
	6lPeRgQU309st2BewnakO47kcf0gyy5+ktnuhV1UEvXfF3XwzH6MPozJsPGaFnb9
	tdymp4fj8rEaX3ecbBup3G4edk/vXTWY+2lJNkAOiOOO96BpUarF3RGQxY2VYDca
	abm0VWMw35C18cLgRr5supHbt/1iWKbGMOHYRGvj/dWPjTH6TLwE6A0dCZXTtXvS
	+5z+D/mUmjB24JgcKzAsYg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8ejc11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:29:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EFK5Ne009858
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:29:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvska41q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXp8CiwAqrEJr/8b6i2aSn6bbxKwA9vMR/MwHVo+OAqVjrn6vHtxHczsVnGM0q9Z2L0bdfgM3BI3GgI8G7AM61N/LsX8VWNgws5E3yhWEq8hzqfXQzxC1HQATI2zJzfvKsF/pf2k6BFwvK31Wrdl+5mPNld0AQ89BvoQfSeiO1IxSDfZw1Tobw0BZtLW0CwGkXL6dbcTyC77HERTZsXvPBXBQQxszyhvsmwz3gbUqcY+NDzkmT/il1j+Jd+MqbTE6LjYkBLSCUDssMJQHpL/cL1I8z7TDtI8WtTnYpx6+cFCfv+WHBVXUH4vYEEewWf/adWgF6ODANFDi0lRlSt6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=331mdrux2OI1tafrHNSPqWwUR3L1ry9SDrxQ/djmbs8=;
 b=sAW7F8+ocH6eZC13uF8sCdLRbEAjU5lWqAw07TULwtU+wz8patsUDoa6hpMHh/rfTxiGP59ZTUYZO2tk0XZtj5dAjkyasrWGbJZ5Wz/bgfs+k0f0bnem3bpQYDDDNkNnybFqQ9N4ij9bKwPDJa/RyG3Cvtw+/IC7syjGQk0xYMJwFP0nEKqCj06a1Yyyem6/gyHWy5hn/833cysZYwgve9yN6TUWRC1QOiT8YfTTbzJoeJRCyHbJOlLWaXM0OMUsOHNkw+F8V3msNJU/6jl7pP8XlxJSA8XznpdN4ypHpGG56bnfqSzu3tptVzgmDc9iq4yqLgsGKcAzQ7ROjxnwgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=331mdrux2OI1tafrHNSPqWwUR3L1ry9SDrxQ/djmbs8=;
 b=t8xPGRyaeZ/qsRJBwVhS1dxMZoRdLJQ2WxyzMGZK6A9AhKpcMcYZ/4tQfr41J/h+9fcpVS+Cgl+MIeAEPJoUTM3zkqmkaXyfoGPpglLLZ4vL/YU8+bmv4XLSbQ8tN7nhAlozcF1Wajy4d/h6sVG+D7CxjX4BO9sSUcfcONSNsO8=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by MN6PR10MB7441.namprd10.prod.outlook.com (2603:10b6:208:474::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 16:29:12 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 16:29:12 +0000
Message-ID: <9a3548cd-dde3-26ba-b9ad-0a3924839e66@oracle.com>
Date: Thu, 14 Aug 2025 12:29:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] string: ensure string size is handled
 correctly
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672AF8E9BAC559BEDBB4F7DC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672AF8E9BAC559BEDBB4F7DC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|MN6PR10MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 8800ae9f-3190-4f44-bbd6-08dddb4fb3b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHdlN2xSa3JSblZ0dXFWUkR2dnErVmtJOGtySUZOSWI4ZjBZYWlCallXMkQx?=
 =?utf-8?B?LzFNKzZaY0RpbXdpUHRLT0VuaC9HbUNYZzB3WDdwUzJ6VjN3QUJpNWxuWW5x?=
 =?utf-8?B?VVF3Z2RZY0dETEpwRUY2NFE0aVcxMWhwdVoxZ0s0RkZQTldTSUFERGYzbVhz?=
 =?utf-8?B?eVhqSFZKOUltNko1SHd1QXZzd0xhZkx1dlVVSG9XcFpwcHhWWnNpcDJtUlJR?=
 =?utf-8?B?b01wT2xtblozQWlMcklNalQvZjVWL1J0SGZXUEQ4Z2lUZnZzV0ZhZzFDVUds?=
 =?utf-8?B?aXJ4ZFFWcGhmcHB3ZTJUMVRlZEwxNkVMKy9sQjZuNWcvZUVRZGJWUUVWdmRs?=
 =?utf-8?B?OFRENk96R3dqaUsvWkZJMWpMUUtvWU1vSXpvdE5zaENnM1NtRkFnaWtyUEpy?=
 =?utf-8?B?T25ZYmhPUnd0bUVKUXBtNmFyanh5aVIzL0hYTnFLckpFRUVEdVBlT0JPaWxE?=
 =?utf-8?B?M1JqU3l5QVllVGxZa2FYdGpqMjdEZCt0TXhZRmM1V2JZeXRjd25SQk9Vd0tF?=
 =?utf-8?B?K2NDSDRPUG0rcTI1UzJldjNHLzliL0EyT2pCSjc1Wi90L2pkQUxEQ1F3RE05?=
 =?utf-8?B?UlQ0QUNwams3MW01YVoxTEJyb0dRN093NUEwNmxaMVFyNHQ4cWp3aExLcVBU?=
 =?utf-8?B?T1NZUzhRNHhBMDF0dUNYNnZIVzluNS90cGNYZkFCS0NJUWNNU3luSittNzV2?=
 =?utf-8?B?am12RFY4clBmRXNVNTJjWWNGdi9zTkJPaGZpSUNXSm9UN2gzMFhXYkJ1eWp1?=
 =?utf-8?B?a0Z0SGJISTFyYitYRzNJajkrQ0U5bFlXY1NrUWM0N2gwbHJvcTBCVE5KM3hm?=
 =?utf-8?B?eitlK3d5K2FERDIydHp3dGRxcE83d2ttN3NpTTg1TWdlWTlxSzBUL3oyVi93?=
 =?utf-8?B?ZDZGZnBJOHVZTGovc1RqS1pidXJxVDlra25FcEY4Y1F4TXQ0RlEzMTlqUno1?=
 =?utf-8?B?NkRRb2JrQU01WXJ5cWZSWVZuWmtsemxuZEMyQklYYngwZjFnN2ZjcUNzQVht?=
 =?utf-8?B?RjU5LzRycUNoWm5kRVpIeFZxU1BOYWRla2FEanArU1lqR0JqUE9uaGJEZjF4?=
 =?utf-8?B?a0owMXJzWklKcXpKd1RQVlZpcUdlcm84aThzY2V6Z1BuVi9kK3hOWnd5dVUw?=
 =?utf-8?B?NmFxMTBQMWJlSnQ3VlNoa001MTQ1bzhhR0Y2Tnk4UEY3VlN4MXUzc1RzOUVr?=
 =?utf-8?B?cjl1eXowMHhiTzk3K1dSNlB6enpSRWZmZ05XbGpDQlA2VUwyaXhZMGNXN29t?=
 =?utf-8?B?QUVOZDE4akFZbDJvZHRrcFRVOUMwdFpsM2VGN3ZlY0tKQ1FXN3gvdUh2emZH?=
 =?utf-8?B?SGV2eUovN01GcjV0WlQyZHBzL0VPUVE1bXBPZEtmdWNqR1FSWTgvVklmamRy?=
 =?utf-8?B?QitoL0NUcGFRbmF6dFBCYllvWkV6UWc0dnRSZzBIMzZyZnpBWHYrUitFWUR5?=
 =?utf-8?B?VWpXTHlpM0l4UVRWdVlubURZZ2NCdXpRNTQwWGZxVzdYRUh3K1paK0VXc1d3?=
 =?utf-8?B?TzhHd3NoczMzdDBxTzRWSUtiL2xNaFB3cWtPdUJ1NkY4S2VkUFJ3bFg3UGdF?=
 =?utf-8?B?V1BqUGQ1aFFoQjdmZFo3ZkJaQnpXdkNLbEZtWDJ6V0FqZmNpaitNL0IvOEUy?=
 =?utf-8?B?YzMyOVdrL2JlYmhjNURaWHR6eFdwd1Y2UHRyT0txM1VQUStrSk14eFllSlg1?=
 =?utf-8?B?NGt4cHQwcFJNSlNORHVlbTBEMktVeXI3dm9xNU9Yd2w3SjhTRlI4bkQxQkdL?=
 =?utf-8?B?RXpTZzgwekpEQjR3TlBIOGF2SHZ5Z25hRXNzZkVyUHF2eWo2RHovQXhRRVdw?=
 =?utf-8?B?bFlZQWs1b1VvMlp1KzhaYWZwR1BDTTJGaDVWQTJ0enBTZkdoUHpqV3FGL2sy?=
 =?utf-8?B?STFsRG1WZ0didWhuQ0lpb21GUnB0aGtTWm5VV3RFM2xVbVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnBpTytTcVpTV0JPcFNtaFBzbW9IQnl1TUpFVGQzdzlKT0RKc3FJVzJIZU1t?=
 =?utf-8?B?a2Q5dStUUjZ4bS9XVmpTbHVaN3VKWCswaTRpdDdyL2lONGR5R0pXRGplN0lG?=
 =?utf-8?B?eTRXcVc2WE5WYVJva1VaN1NOVU1BeDVkTlVOKy9sRkhKRUk2bDl1b3VXeEtF?=
 =?utf-8?B?WHNrMkxsWmcwQzRBcjBrYWtwZmg5eXZKR1NkZWxWTnVBK1E0WlJUa1VzdUxK?=
 =?utf-8?B?ZmhGVXc3eDFCclphT25zc2xKdnZuZkY5VTN1bjlEQVFLTkNYckQ3RXJDWHNC?=
 =?utf-8?B?NHlGY0NQNHRIU1A5cjJkM0c5YXBtbXUzL1BNbU4ycXNsQUhOVDNnMUJVZnRP?=
 =?utf-8?B?ZE1VR3BhM25MTWc5UXUxbEFPcGVUR1RTNmtyc2k4aGdURXBTNDNzRUJZZ1Ey?=
 =?utf-8?B?M2VoZ3Jsd25mU3JPMnM1aFhBYW9KdkFwOVpJdkhGL0prTVpZTFk3SkJ1dXp0?=
 =?utf-8?B?R21GQjdENTYvdXlVRlJFci9SYjFrSEIyTjdMTkJjalRZQmp3a3pMR044NDNV?=
 =?utf-8?B?NmRQbzdZWUJFNmJHYmYvOEk5NDRCVUpXZVIvclAwWk5JSmF3SHNaV3ZaRHFM?=
 =?utf-8?B?SWhyeWxoTTE4djhGdUJvVFJUcXNiV3h5VjZTaGtXcUtud1RFVDZKVmx3SmxL?=
 =?utf-8?B?MUsvekdIT1hFVmN3NkJBcWxyYklGTk5JR21MZU95TU9hcmNlNjJhVXp2MnVH?=
 =?utf-8?B?MGJCczVGVzAzR3dGdWh1YUU4b1FOV3pBZk4xeVRLZDZaT3ZEMzJBeFNRNjNJ?=
 =?utf-8?B?ZXBFdFNoTWtMMnRhamdEdDA5T013d2IwY3hFeVRkd2J0RHFzd2xNUGk5TTRY?=
 =?utf-8?B?VEhkRll2MmM4WkdJYVJFYThZTVV6VmxhZ283YkYvUzl3Q05OeDlWRCsrM0Vo?=
 =?utf-8?B?LzVKT05qaThkUE83UE5XWWFnMzJnUzdGbitzUnlsSjFWZGl4UVEwVXZKRVI0?=
 =?utf-8?B?TjUrTjM0dFB5dGlqTVgvYmFQbVkxL1IyRjB4YTRDbmg0RW1yaWdoVHUxcjla?=
 =?utf-8?B?eDUvRU1RV3NtV0tXSTlZeE1hKzlGclRuMzl4U055WnJ5ZHcwQjk0aTJTWEcy?=
 =?utf-8?B?L0Z1Wk5vWGZiWnYyNFk0WmcyQS9uV0FkUlB6MkFCV25IWEhZY3hVcy85NEgr?=
 =?utf-8?B?d3EySStTNm1UWW0yTUttaUEyRTJjdGozVXNRRlhRV1NqV3pYWGZpQ2U0bUZo?=
 =?utf-8?B?blovb1JieDd2dUVHei9YQkFUUk0xKzhCZHlEQzRTV2FFc0hJbWNibVp0RzZt?=
 =?utf-8?B?UlI5QU9EdEM5a2FEU1BYdkxvQUkvRkNuRlZDcTR1dlNGb0N0TGN6dlZ2bmlO?=
 =?utf-8?B?TTFlSWV1QjIrWVdGbnBkQ1l0dmowR2MvUmlCRzhheDBwYjlqMlovTVhneENa?=
 =?utf-8?B?a0xxVGtnR3lDYTJ3dUJmUmJrNUJqeStWQlN4L0d1UDVHSS9yM1A1bWI5cHlG?=
 =?utf-8?B?ZE44cS9BdWJ4T2MxZE52SjRhU0JyQTJHNk9zTWFPUmxiZnp6dnYrTXlLM0xW?=
 =?utf-8?B?Y1gySTFXcklKbmRWTUlqVWdqZXhYVDNUbzAyZ1F4UjZTSEdSZDMwTEFjUENs?=
 =?utf-8?B?RW5MT1VqL0NOOEZVTVVncCtXSXdva1BBREVKbXozci9VQ2Vld0M2RUxkbS91?=
 =?utf-8?B?NCtLT3U1NklzUlhPd3g1MmNEdEZ2TmJUTC91S1NJRXRrU0ZkN1F4VnNRaHZi?=
 =?utf-8?B?MElOOWZ1bHhkc0ZvMjdkc1VHVFJVcXlEYVNGdWxjclR3UUVobjlSRy9YbXh5?=
 =?utf-8?B?Yit3TFZuZ0RkV2JXMDg3NGUrS3dOcXdvalVJZ01qTTZEWEVhMGtraFBYRkRw?=
 =?utf-8?B?R1RzQmRJcHNJMkxhcjJNaElDeVliK0ZmRXFna2RjdHQ3S0k0c2JsTi84MmNF?=
 =?utf-8?B?VkhGNkd5M0J3UmU1MERRcFM2elNZN240R3hTbjNJOEFkeWRlUmtxYkJMbnRV?=
 =?utf-8?B?bXlsTEh0bzBLbGVLeElJRTdrbmxRb1hMUGpsOHkxRUdjbXk0QmhPdklJUUtD?=
 =?utf-8?B?RDE3U2dyTGNFSHp4WWVsZHI4WlJWYzdCYlFaWlhmdUdkcVZsTlN5UDBzbmlB?=
 =?utf-8?B?b0NYaERzdjdLL3Z3WjZ3WkVTWjlyU2Ewb1puR1dlSGg0cDU0c0FnL2tqMUVB?=
 =?utf-8?Q?240l0Rqb5ckXGoE3dc53aCh1r?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nl6k+VHlSCm0b5PTxznfh3+c/eOBzIISEdW38FrOJqFzwFqcEDct9JKoteMg6mg0ph9xm3fgu+Ype+rV8LNnIh5A8I8/y/hINd6fw2JBMJt6cb5+rCszalmBSKfNPULFsO5ZjR0XdQyX2QFId8SjmXqbTERvi6id5QhnZfgEjd7MxTcYwHDBTf+s1jaoZATWtJIY50p8+fubf76sR9EuQeeqqP7VjEtCJ5La1EmqNiDW02H2ry84Qun70hA+3oI0GiW4v1LmDdCD2Ibwypf5HgoQjAcY6jUKRfv7+4Do3iUzIVqtY5jflezsEeUOrzyByRuijP9K0CPDohJtfrmjnUfKRynnLZWT7fYSxxdfZDm6fx7c82ZW02x//LmGOd4SOaKXt5TN0aHi60a/bRarBM2D2uHMfqkW87e8LX6xXKXVrMgxEfNDyEs/lQmVZuKnG30ELpbZp9CHoHlrghgeAs3fdeinobV4WeY04iOHRt5TPW2NaVt1LFs61VoC7KlqVchyIpZ/NGFfdtTSXA4vs1XI0TGVIaOCvgWC4bKErLpGkTDAih0zSpS2sUm94/bdHlS2DYQfTIUIT4/8KKHb01Xy5Ec65HafEKcfZQxOIhY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8800ae9f-3190-4f44-bbd6-08dddb4fb3b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:29:12.2153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnpXuGiIsF8ECoqqn3qwFW+djxfkxy9x7KbUfBY9Yj2w4PWTvm7eQR/ImpwZfETsZYc7DRoMJobA/NztmFeb5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7441
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140141
X-Proofpoint-GUID: iFifSFb9q9cgebsiEtl1XN_VUyNHezDG
X-Proofpoint-ORIG-GUID: iFifSFb9q9cgebsiEtl1XN_VUyNHezDG
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689e0edc b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=D0H6PnrxYwoxWASJG6cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE0MCBTYWx0ZWRfXxCclNMil/oYi
 iXWls79UvyGiwBDZwchVzvLM/1GM9qC2htcLuQRIPKfVNR+5gCVUq5s+/S52z0GHRC7xHLPHI/U
 lqpukZiA7OaLDaonF8KpMweDrlgILkoJyMdR0AW28PXh/airDqA5amkHz91zkNUMV3rA8N/OkUz
 +BwOEB/CDSNuL9QnjB0cnAMJtQhit40VLZ3P+bf53d2ajRiBKqQpNWF7VCleO278sceuH+7ALTJ
 Yjqxgn/5Rm5PSh7/MfAwPvUaYMyq2Z7VpvJIR+xds3nQKlHzrUTP89aGLJ4HhhTKyTM1MsTpz63
 TMQq+odrdAY4aRNa+CJYUsGsRrqdojOMXe4lI3cCii9nXrfFdkfXZUJS7jkit7y1Jm1CdnxLfPA
 teOHftbNGIqi8IsV+USuvCZbWzJ2D9SRSFh2kCla+Xhxma8FBulM9pSmn60prgeROqHEIDNY

Typo:  s/strsuze/strsize/

For tracking purposes, should this patch be prefaced 5/5?

I think the .r files need to be updated for

test/unittest/codegen/tst.str_const_length.r
-         0: 61 62 63 64 65 00 abcde.
+         0: 61 62 63 64 00 abcd.

test/unittest/codegen/tst.str_data_size.r
-         0: 64 74 72 61 63 00 dtrac.
+         0: 64 74 72 61 00 dtra.

test/unittest/variables/tvar/tst.str-size.r
-abcdabcdabcd
+abcabcabc

Also, need to check test/unittest/funcs/strlen/tst.capped-sizw.d.

On 8/13/25 23:57, Kris Van Hees via DTrace-devel wrote:
> A string is defined as a character array of size strsize.  Strings
> that are less that strsize in length are terminated by a NUL byte.
> This implies that the NUL byte is part of the array and therefore,
> strsuze is indeed the size of the array and not the maximum number
> of characters in the string.
