Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EAF286410
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 21:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759267912; cv=fail; b=W2ISnS58JddRapOLfO+/TQtbcW8XpwpvK/8fyVEyDC0iPvv/87wXffqFMpIfYuX6COncE7GfV9PtPBv15qc2sEjqQsr3A7GR+z76+vmyJl6hGSdulIgYBs2zWbUvGc+9I/FpBcJxaVU/+m/8CnrSJgQ1G6DWqd1dijO7IaXf7a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759267912; c=relaxed/simple;
	bh=AGNJ0f5cV4rz+vTdO1XBE1igeDQF2YWp6VuWFcGNUfw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LLBqV4vpe2f8rxr/tF9rpjvM4zyTDLvTJddDKJ6LacUPm/8fKNv68ehs3obUqEF/Bo5t0SZBCYkQSghQ66Qva6OX8Ta19fsgBhZ0wm9+BxuxkV8ixw9Mm4HtyKQ4o0sPOx/sliBEIoeC5VY8VIAw1nH155kv5tbZ1LycQLCi5vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P8RfCeJB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CKoUavET; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P8RfCeJB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CKoUavET"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKN0df032708
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 21:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hvgIEpjm3IP1k6M9NhKUj47qSbAU6Hc/uADykdtVSaI=; b=
	P8RfCeJBcbkCQfYkxwvx7+rFyKJOdT2UDpMmNLW5BVdzezLREQ1Vs7XHlAJ3BOE0
	ODB9GRbbCwLhG42byOYqPGbVTopFf5mMb6CgO/qKVkPK4Q1nxiaYdqhAm/VyQ4fn
	QWGfC0vJg0A6jav0Fac8Mv7quG/iPx0d8+Y1THYjFO29qVBDJVmjT7+50sJzXYtk
	EpmNNpePllSMziqLy38dWxa81SUVxnFzMIb6P5GUrQ3yI4nmmUO2kY+U6KSMG2vF
	T9KuAKyBoeUs+R40Tr6JBjcgOawrQ0ae1TEsOAmSGzWUM5o03T1GJDhaR7FhTPBt
	XPFjmgFJRPvqZfkDZ3D++g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gksx8d96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 21:31:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKFDG6036416
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 21:31:48 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c8p0ty-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 21:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj+btfn3wZYE9+adwVDkOEY7AXgrsXhQbwZjTgMUgv5jBuyopMssxKHCXiITDSDUsbPViojiBqMIaIZ3ud78ejV2ah7ejVSMs1pYdyqO8ZjRFxwke0S7/3+Bwi/2SAJwGaZSrxdKUcPMxz1hKmeA+D6D+UjBZhPxuywl576od/h6PtPV1dYO0sBra1irIZIJlZjrzdwKSv4Jy+HKvzOAkIEDfGE2Kl4+TgfO/W3OK2ARUYnDRxn9LPchDdaUFjzAy15KQQVWxY/uc3S6+OxVMxkoZEiGkvt9c4kWH5/PDBvoLKDPi/r/5UyY3yF9Vj++3GaiVFxR+Tq4ug0rBL9kYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvgIEpjm3IP1k6M9NhKUj47qSbAU6Hc/uADykdtVSaI=;
 b=HbYy3sifz6HAZJApc/NjsnROY+Sd0kApaMhseKPOLIo+E+878UgZrdk8hvxGpnzC4Mw9eNwZPrFyxPamdtryZ5WqPYJ02+Vt2AAMnN2Jj1xrCryPiH15X8BriO1fLeAeygfQw8ofj19PcMd6RxMc6ujE54fTE0KJ/EYBP+AaZzpG3lP6998LhKQbv1nfji8GxzeKslWYHihWcc8m6HNz8OAevUQ0Unax4d4TTRMlm/e2xq66r+Kpy+R8KGPdpnuiiyWNQsiVmSjd7BcVFphoyZQPd06dNJ8DLdsxXbd8IWGKN+GePAqTdxs4voczRGB3d+zorhRr5XYUt39Tmn29xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvgIEpjm3IP1k6M9NhKUj47qSbAU6Hc/uADykdtVSaI=;
 b=CKoUavETcT2rFcNwPo8r4hBrFqYk7WfQ+OVldNVP9rs/RcN0a398upeQtERpfoJw048FgQkT5PoJsTIYceRKgide3c9K4ZDiUdg8XbZulu5XdyOtqSCKioPH4uhtFsyUzFRPZRJbUrO95Q9qO4SeqzmcLF2CvC3QkCGp/g/wnDA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6185.namprd10.prod.outlook.com (2603:10b6:208:3bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Tue, 30 Sep
 2025 21:31:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 21:31:45 +0000
Message-ID: <6da54d77-dfe0-ad6b-f9cd-b042ad2d632d@oracle.com>
Date: Tue, 30 Sep 2025 17:31:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] options: check *frames option values against system limit
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56725A609D3CFEE2E6011B9BC21AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56725A609D3CFEE2E6011B9BC21AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: d74680eb-8c64-4f40-d61d-08de0068c0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTMwYU5sMzdBTi94Y2FpT2VZMXk1bVVPQU1FYVdiR2lmWnVxWlVxeWNQbkJW?=
 =?utf-8?B?cEFWMGJoektmMG9zNUVpQ1V3VzdYZlZuRzgyMTlFQnFnVk5iSU5QU2owcUpE?=
 =?utf-8?B?NENaSXhyY3VYRzdhRUxHT0RMQVNLR01TMWVIWjk1Y0pBbFNGc0JGUWhmQ1BZ?=
 =?utf-8?B?QkZPRkszSElKTFRobVJ5YVZ2ZnVrZkJKaFNKUWFHS1ZUWFR2ZTdDVDBLdkk0?=
 =?utf-8?B?ZktiZ1lRQTEwOVBjZE82Zi9HVU5uVzhPVGpiRjBxN3FYUEtzSkNhNk9SYTJ5?=
 =?utf-8?B?REwzaTM1TGY2SHgyUVdUMHRncnc3Y0w5bCttVzZwWnJPSE1aUjV0MnVVYVUx?=
 =?utf-8?B?WC9yNXl5VldzbzZJb2JDdk1wQjJBR1lmMnoxVW40bG83ck1rblNCU0s0QTdM?=
 =?utf-8?B?U0llN0hGZ05nMWt6bjIxZ0I5NnFsWVNwTHZxd0l6eGdCdGhmeENkVXhRN040?=
 =?utf-8?B?TlhzcElOaElOZlA5Z2M2YVJML2o0bldwU0h3K3MrVTFiL3JVRy9lcVhtRE1S?=
 =?utf-8?B?TGc1TWxVRnQ4YnNXVE5zR3FXMnRIczJWRytvR0Q3QysrbFM5Nk1xRUFGSDIw?=
 =?utf-8?B?M3lyT1pDcVB1bGI4OFB5Zi9RcStaZEwvdjRienQxV1NDdmJ0SzZmdWZGKzZV?=
 =?utf-8?B?OHlvMkNTSU5URFc1MkZBRGVHTjVIbGVYcFVQRGFkd1RBNk9ML0NtbU5BUTQ1?=
 =?utf-8?B?d0JiVFlCenJLb1ErM0toMzJFZkdQVUZ5WkozT1AyZloxbkJkaHhSazVsRVVN?=
 =?utf-8?B?TXVyVHFQcXNWcGdyLzBtdG90VFY3WXNxc2NXZUMyZUl2UHREa2VyMEJYNTho?=
 =?utf-8?B?Z2dxbGhhSFZRNkluL3ExajYrd0twQWx5aTNjUGMwZGxldmNvY3lkcGpMeUJq?=
 =?utf-8?B?SU13elZXZ2lWRnplRUpYTmNJR3lBU3JUMUFaZE5rRnFuMFB4UVRJUWdJNFh0?=
 =?utf-8?B?VGJjNUxWZzRGS2FYYWhjekJHQktQVGx6Z2NyS0dBN1hJRTh3Qk9nakMrZ0Ey?=
 =?utf-8?B?L09FNjZkKzZTRWxaRTl2TXN5WklxK3o3UGpFWWJvQkYzcHhldk9ZQnQxSUhh?=
 =?utf-8?B?WVhCMnhua3FBUi9Vb0JGR3c4d1g4QUZkR2JFSXExbkpNa3pGWVdEbDNiY1BV?=
 =?utf-8?B?UUJaeDM3N2lXTHJERDZHTzFzODhINW9RVkgyb0FJdnFSRy80anV2SmRBWDY3?=
 =?utf-8?B?RnBPbWFVTzRMYTlWZ3BqbUVTSlZ3NnVUY0FzSlUxVXVMQzJndUZIcHA1dnJJ?=
 =?utf-8?B?VGRVV1E1b0orQ1pUeElwdnU1dFlsRXJGbTMzK3VkTVltc1VVR2crU1ZNeE9p?=
 =?utf-8?B?TURpOVQvd2Q2bi9CcnVKQUd1VjVGTWk0THhuYW1id1Y5TnlZUHR3d1VYZ25x?=
 =?utf-8?B?aWlldjRKekFHR0dBTm5DbmZkTUVQaEV3dGx3Wm5UVXQ0c3BoSWIxUVQ4WE1u?=
 =?utf-8?B?TitzbGd2WE9lUFEzODFVR1hHNGhhRmFUTDB4dDBhRkxrelRoRnVFd1NFdUZL?=
 =?utf-8?B?d25rRUZjWHpTRlllZS9RVDJ3UzRRRGs4V3AzTHppSElYeGdaS2hQNExYdXdQ?=
 =?utf-8?B?OU96cDNMUkJCSmpkM1IyNVpNOFhzdzhOaFNKRmlWb0pHWmhKUlBjQkY0c3dx?=
 =?utf-8?B?QWdzaTl6REdMVFdmK0lHVzVibis4eGRSN25aQVZjdDNuYjVIVzFlRnBhem0w?=
 =?utf-8?B?L2N6YWg3cTZFN2NySS9JdjBJaXlkczBtQlQrL0RtMHdhSXBIbXF3ZklCQ3FO?=
 =?utf-8?B?WU00YThZMFdkdWFsdUtHWCtCU2F1RDh2SWJITGY0NkF3T3ZoSFA2NEVGVmRn?=
 =?utf-8?B?V1djdDdjNkp5anZodVR1QXNHSGgvcnp4WnUvdkRrRGFvNG84a1hvNTBmbmFY?=
 =?utf-8?B?N0hNTUYvdks1TzZ4bGVUWkREY1c5UmFyZGlrSVpveHpSeFQreUR1aFBPVkow?=
 =?utf-8?Q?8RsAuat4wvhUwEcZ9WewjYnFsKv0UNQR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDFoUTI5UGVxbWV3ZXRoUUMzTXVlY21QdWRZbVlwYlFxVVV5c1h4b05MWXBF?=
 =?utf-8?B?SWdNdWlKbWZtSG9PRFNmZmVoYXNnam5KSFdpN08yMzUvRUxWcFplS2VyR2Vy?=
 =?utf-8?B?NnVLTzRHQ3g0Y1dxSS9HM2ZQNmRQeWRkUTIxMHNJSGg3MnlteEgvVkswQ09D?=
 =?utf-8?B?VDR3dWpSNGljUFJ3ZVliaXhrMjRXTXlseWVDWnBlU0JRZmhFRFdpc3hQZTVC?=
 =?utf-8?B?bWNES3RsR3YveVVBWDd5MVJzUUw5amxsN2U0UnIzTWZ5aDlSSk4xWkh0RDhV?=
 =?utf-8?B?MkFud0doTlMzeVpJTHN3TzJROGNSdUVucTF2ZjRXOXpKdzMwR2xEL3RIMThV?=
 =?utf-8?B?ZHBMWUVZL0ZMQnJFUCtRNCtVVlk4R2FzaWNhMHFuYkJoeWVCbFZuQnh4T3hG?=
 =?utf-8?B?OEVnRUt5T1dPYktBM05vVmZCL0dCVllEOWIxSkxLeWQ4WHBpVno1K0h4Zm5x?=
 =?utf-8?B?dGdBSTJaWTV1blZYVWlDV3lsVXExR1BtZkRsd0svalcyYXhmMjhhbFFOc2NS?=
 =?utf-8?B?Rm93V05wZ2pCb1BVMzQycFRHTlBZS09JYjVDQklWZEthNFU5ekN2dmRsTXd0?=
 =?utf-8?B?R2tvUkFxR2NWRnlXMVRiWjdnR0h0KzVudERvYUJIWE1aWFZKZzY2TWd6bjNq?=
 =?utf-8?B?R0w1a2RBMUFQTnFnazFsR3Y5R2hiNGRVenVrMVlKS3ozdUh3WitPa2pjTExR?=
 =?utf-8?B?dkoxVWlHa1FrYTVIemhUZ203bVhwa2M3Mi90RkJxQVNnQzRXTlNuYnFYZWZj?=
 =?utf-8?B?bW5RYVJDUTFkVnRPQjJiSVMyeG1lTDI0V2RJeGUvTWRYMitNZXhHMFRNZ1VQ?=
 =?utf-8?B?bU1RU20xUGJqMThqU3p4MG4vQTNZUnMxQVVYK081amFYandrc0xTVzU2WW1n?=
 =?utf-8?B?bGpVd1lHWkJlaXVJWE5UWmRCR21hWUlEcnc3UE9FNmhNMkowTnpseGM1RVVC?=
 =?utf-8?B?ajFKa2JEeGpOdFlIaDFMNVZnMUZSby9NVE5KTUZva01vVlpRS3psWDNod2d0?=
 =?utf-8?B?T084Um1qa1duZDFIYlRXTE5uM1AyTExXeDd1K3dRZTJlV2hVYnczOUdnWHVJ?=
 =?utf-8?B?WjJCenJsSlNLd1I1RWp5cmxYeldqRG1GUDFXcy9nOFJxaWVnNU5QSmx5KzRu?=
 =?utf-8?B?Uyt3a01WaEZnV3NGYW5yY2RRWEhIcENESFYyYUZIaG5KU21rVXp1bVRaTGtG?=
 =?utf-8?B?MmNOUkF2SVNqR3Zla0hUaVJvdC9IRGp6QjBBUkRGMjdtWUZRYWxnZWVUcVFu?=
 =?utf-8?B?RnVQVkdIaThNRmFSTzgyZm1Rd1NDNzNSMDFtR2I2cVNyeWN3Vk9JUHVWRTVU?=
 =?utf-8?B?OGdrK2RnaHdrVVM5NHdxbEFnZk5wZ0szc0FNTlBPQ0JWcENoQ0hBY3VwbmVY?=
 =?utf-8?B?RGhENkt0SmRITzBXellNNzBLNnhZRDNFM0pHeVJDY1IzcEVndXc1eEtqNEZJ?=
 =?utf-8?B?ekZ5cGtTcUhidmtLblBocWo1TEpzbWg2QWYrT1FoVU5SYlJTY1RUb0JXR2F2?=
 =?utf-8?B?MDRMdndtQU1PZ3BYaGJTcVNYQUg5b2gybmRLMDAyUWxKNFQ2OExlWnUxOFly?=
 =?utf-8?B?Sm1hK0t0VDVySk1aeXRVbzliSkZkWEIwL0xJVk1aak95dEp4UEpQN091VjNS?=
 =?utf-8?B?TUhRRWVZaGdTMHArWTFLK3ZNSHhMSlZveHd6dktlUlV3aWUxU1FVdHdyRS9M?=
 =?utf-8?B?dFh4SnVtcUV3OXA4L0dOQk1SMW5aQUNwbzBkN1J3SjB1MmIxNStMbk9oMlpS?=
 =?utf-8?B?bVRsL3R5WnFnS2VpQk9aT2N4anJQRG5qM1N5UTc4d29vTkpJN3p0cnZld2V3?=
 =?utf-8?B?cHdtWDZMSmxiN3lzRE96elAyTldZNlRhSVRPMHZ0cjJWS0pFZ1d2Y2RnK3lQ?=
 =?utf-8?B?cjZvR29nS1NzK0o4akdNbVBwZHBaTHd6dC9BTkxXcjJzKytXN01sY2ZXVWNY?=
 =?utf-8?B?RFUrNVRFTWtlKzU5OXZyWElOQVNtMTNYNVQ3cDBBak5QRm5rZzhqUTU4bnZK?=
 =?utf-8?B?ODlkSGJTVHMwK0RBbTA5Y0dlVUlSOGxoSjBYK05wVVRoZ3V3UXZiMDhIOXZT?=
 =?utf-8?B?SnkvVWs4VDNTRHc1anNoN3E3THFObzd6bUFRSmtUWTFuUGhXM2xrMVl5c3JI?=
 =?utf-8?Q?kYmN3HRtzCfToArR4fkrQeKAh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xKuCqiHVbWdL69ltKtSOFNJrmRw3skHsnOyUr0nW7Ooc5XJyx3vHmYdi29lIS3g7K4W1uOaVRMySHLusBoGtNCEvMr070fZHVZs70Jc+6v/ThueBLONtDvJiK3Gal6yAUuOTAVPk7WR1CgH3gLGI0Eku5iczJK6e/85sc8Ua0PJDrjQcVf49VS1fE6I7muuTO1D7gXJY6DIT4MY7WB9t+rFczWN7SF0pk2bAO2ljomzQxIFnqFyvUOHeOZHp5n5faP0f2Exfn/FclRIH9UMoIVE+aFdx7bWCeLeuvsg+J21qx1V1s6FvkP7xjLRs0xBzBX7/V8DlawiPz93juBQ8Klgm29uSptDoy7Sqg6E3iPNi6N2dGPjAxXvn3tooUd6Sz1xEo/M/3icu2MA6jONgzRmCAARkgP0DjU9sAbZlqZZn8iR3B+7Kdo71lQzk2eOSRIfZoMUCXOyiKiz3xKhzY0rc69ybiOinUhpVoBA+alI8ygtuY04Yr9qVK7CSZP6KEf/WKMnAXKwrsYu2u7+h5ggrTPIucFxxAliIBeJRXFav0Vnup7cbVZFG5Tan8x4ajr8SeVEhi5NWiO484y3Hpv003WE2v/FoqligTht812I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74680eb-8c64-4f40-d61d-08de0068c0f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 21:31:44.9178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5X0my/lJu1cT7UsuVGT9SdzIeHtmyfq6FMQq0cGRgUKNHXSyWKNl2BxKqsJQLL+73AvVR3TKo/bFor4lxpxgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509300196
X-Proofpoint-GUID: zlXuJQAB05swL2MDUQMA1NjlMHzJydcU
X-Authority-Analysis: v=2.4 cv=N4Ik1m9B c=1 sm=1 tr=0 ts=68dc4c45 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=yIN7QxDfcAqKNYYaJhYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zlXuJQAB05swL2MDUQMA1NjlMHzJydcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2MCBTYWx0ZWRfXyvC5M4F3W4nG
 tq5ShfK4F9YgSMKeM2wk5Yc8Gbaftblh0z9SpnTylM4E/u3sIgjYvNLtO5bPIWUvMSzWE/4NUPi
 S3+6c/ENHwC7cxrjHAUc5UJSj7NniEZPY3FYzhlSmGkJp5FrPPyisPfcMVqaRD/Yotd5uk/3aNO
 X/YzTRv+7J1vQ/SGu/zrA7uqsC6LTmlyfnsdT26JlsjNeHU4r6oTtFfNegFNi9MRI5rbhbJoD5r
 RRw3A8XXCi1CgOjkcm9GlPmiqPUai+R7fB+sqpRkuBlYk04NZ44VsJ7qpVFqIX52AykISFl5Pr4
 n3npJDZJOWjyBK7vz4GShgItLSZ5OzzKdteWdGVIb1tPMtXswhK7DuKMt7rUNVoArTqFDJLTsz6
 bz50E/vYpaEkjruNrzmTwtVgEa7kgw==

I'm confused.

Is this amending an earlier patch, which introduced dt_opt_maxframes() 
-- a patch that has not yet been applied to the dev branch?  If so, why 
not rework the earlier patch for a cleaner commit history?

What observable change in behavior does this patch produce?  Why isn't 
there a test?

Also...

On 9/30/25 12:47, Kris Van Hees wrote:
> Commit 81e99397d ("Add support for the stack() action") added code to
> retrieve the system limit for stack traces and used that value to set
> the 'maxframes' option.
>
> However, a user can set the 'maxframes' option from the command line,
> which would allow setting the option to value beyond the system limit.
>
> We now record the system limit in dtrace_hdl_t as well as setting the

In general, "now" in a commit message strikes me as ambiguous.  Does it 
mean before or after the patch?  Not a huge deal here since the patch 
quickly indicates that this is new behavior, but I'd prefer avoiding "now."

> 'maxframes' option to this value as a default.  Options processing now
> ensures that *frames options cannot be set beyond the system limit.
>
> Note: 'stackframes', 'ustackframes', and 'jstackframes' can be set to
> a value that is higher than 'maxframes'.  The existing immplementation
> in the code generator already lowers their value to 'maxframes' when
> needed.

This seems to contradict the new comment in dt_vopen(), which says you 
cannot set to a higher value, and the behavior in the new dt_opt_frames().

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_impl.h    |  1 +
>   libdtrace/dt_open.c    |  7 +++++--
>   libdtrace/dt_options.c | 38 +++++++++-----------------------------
>   3 files changed, 15 insertions(+), 31 deletions(-)
>
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 4dc4c9a7..723aac8b 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -310,6 +310,7 @@ struct dtrace_hdl {
>   	uint_t dt_maxtuplesize;	/* largest tuple across programs */
>   	uint_t dt_maxlvaralloc;	/* largest lvar alloc across pcbs */
>   	uint_t dt_maxaggdsize;	/* largest aggregation data size */
> +	uint64_t dt_maxframes;	/* system limit on stack traces */
>   	dt_tstring_t *dt_tstrings; /* temporary string slots */
>   	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
>   	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index ed0b14a1..ba5463a0 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -764,13 +764,16 @@ dt_vopen(int version, int flags, int *errp,
>   	dtp->dt_options[DTRACEOPT_SCRATCHSIZE] = sizeof(uint64_t) + _dtrace_scratchsize;
>   
>   	/*
> -	 * Set the default value of maxframes.
> +	 * Set the default value of maxframes.  This is the maximum of stack
> +	 * frames that can be requested from the kernel.  The *frames options
> +	 * cannot be set to a value that exceeds this limit.
>   	 */
>   	fd = fopen("/proc/sys/kernel/perf_event_max_stack", "r");
>   	assert(fd);
> -	if (fscanf(fd, "%lu", &dtp->dt_options[DTRACEOPT_MAXFRAMES]) != 1)
> +	if (fscanf(fd, "%lu", &dtp->dt_maxframes) != 1)
>   		return set_open_errno(dtp, errp, EDT_READMAXSTACK);
>   	fclose(fd);
> +	dtp->dt_options[DTRACEOPT_MAXFRAMES] = dtp->dt_maxframes;
>   
>   	/*
>   	 * Set the default pcap capture size.
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 7508f044..97516517 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -913,40 +913,20 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   }
>   
>   /*
> - * When setting the maxframes option, set the option in the dt_options array
> - * using dt_opt_runtime() as usual, and then update the definition of the CTF
> - * type for "_stack" to be an array of the corresponding size.
> - * If any errors occur, reset dt_options[option] to its previous value.
> + * Set a *frames option, ensuring that its value is within the system
> + * constaints.
>    */
>   static int
> -dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> +dt_opt_frames(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   {
>   	dtrace_optval_t val = dtp->dt_options[option];
> -	ctf_file_t *fp = DT_STACK_CTFP(dtp);
> -	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
> -	ctf_arinfo_t r;
>   
>   	if (dt_opt_runtime(dtp, arg, option) != 0)
>   		return -1; /* dt_errno is set for us */
>   
> -	if (dtp->dt_options[option] > UINT_MAX) {
> -		dtp->dt_options[option] = val;
> -		return dt_set_errno(dtp, EOVERFLOW);
> -	}
> -
> -	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
> -		dtp->dt_options[option] = val;
> -		dtp->dt_ctferr = ctf_errno(fp);
> -		return dt_set_errno(dtp, EDT_CTF);
> -	}
> -
> -	r.ctr_nelems = (uint_t)dtp->dt_options[option];
> -
> -	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
> -	    ctf_update(fp) == CTF_ERR) {
> +	if (dtp->dt_options[option] > dtp->dt_maxframes) {
>   		dtp->dt_options[option] = val;
> -		dtp->dt_ctferr = ctf_errno(fp);
> -		return dt_set_errno(dtp, EDT_CTF);
> +		return dt_set_errno(dtp, EDT_BADOPTVAL);
>   	}
>   
>   	return 0;
> @@ -1194,19 +1174,19 @@ static const dt_option_t _dtrace_rtoptions[] = {
>   	{ "destructive", dt_opt_runtime, DTRACEOPT_DESTRUCTIVE },
>   	{ "dynvarsize", dt_opt_size, DTRACEOPT_DYNVARSIZE },
>   	{ "grabanon", dt_opt_runtime, DTRACEOPT_GRABANON },
> -	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
> +	{ "jstackframes", dt_opt_frames, DTRACEOPT_JSTACKFRAMES },
>   	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
>   	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
> -	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
> +	{ "maxframes", dt_opt_frames, DTRACEOPT_MAXFRAMES },
>   	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
>   	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
>   	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
>   	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
>   	{ "specsize", dt_opt_size, DTRACEOPT_SPECSIZE },
> -	{ "stackframes", dt_opt_runtime, DTRACEOPT_STACKFRAMES },
> +	{ "stackframes", dt_opt_frames, DTRACEOPT_STACKFRAMES },
>   	{ "statusrate", dt_opt_rate, DTRACEOPT_STATUSRATE },
>   	{ "strsize", dt_opt_strsize, DTRACEOPT_STRSIZE },
> -	{ "ustackframes", dt_opt_runtime, DTRACEOPT_USTACKFRAMES },
> +	{ "ustackframes", dt_opt_frames, DTRACEOPT_USTACKFRAMES },
>   	{ "noresolve", dt_opt_runtime, DTRACEOPT_NORESOLVE },
>   	{ NULL }
>   };
