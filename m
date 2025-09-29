Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB10B33F9
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 04:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759119751; cv=fail; b=rWh8dTDDsl3S+zaNrqt7k1769jyLhF9iMwgOm0hHevT4i8Jev9klvAXXhoRF44OMImW21V02kyNhCtr1qtlW08CkGbs3H8Tq/w+uSVd+6049lwn6fvByN4ARymsS8ZUKlzrrqu2mScqj4IH4XgZlWAlg9T6/zuAeglC970MelxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759119751; c=relaxed/simple;
	bh=piKa/9ynU4OI+DeXQoN4czKDBlEbH8UegvoiW+E4dI0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B3qWh/yi4FF7pRVnHulWvzFD12BzMKH4fRAAw5iMaVt8IwGkytnMmQec+mfem1z1rFXk7BSq7DlWVg+yqP3ZiLYvngYT2nySPVUozqmdkltsUKcaz8EDnJHpZYzAGzIsX831iPgkiMqHdPnxJvjGK3eTmlIbARvNx7OU1I5wcgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lj33Lo9o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nnjMhPgQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lj33Lo9o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nnjMhPgQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T3BLOO003510
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 04:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=t928qeVbVMARETrtsBxblgpsRP5VAy4Yac8SVrpvYzg=; b=
	lj33Lo9oyDcCrjxsSbKDPbHS7x48boHtRHBnlZ+HriWdY5vnZA2rsjGlKwGLNgUh
	+SD5i7UKKQ0EQwnbEgEdJc/akwIf3b4i/CPJ/T2rY8pQ9Epw0TAb6Y7mN1fn4nK9
	PQp20Z8NqXrEngeUOBcvEiiT83gXFyNdF/CPfvLUe73kQ9ZKA68rmO6lKadJqWE1
	M6otpLmvjXoG0D0yNdPvlEvxSxnqgr+6Psx5nRTLUWBvU2wDWvXc+90FUNWRMSHA
	NEwqgt6NnmAhA3lZroa91rMDc6/Bpors/+C6iSOQttxqQ0QEvJWUkuhq4m0Z8/mZ
	Fi7h1PO+TRgeZ+OIhz//rg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49fhy5r1q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 04:22:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58T3Fa5H036750
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 04:22:28 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c659gv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 04:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRooHlQtUgOLjVpI0bD1Q7Jsi3AQHCdToRx5fO0xSU5+8X6F0iLylTRALSh4fa2tOa/MwxN7L3MFqeh7v/PPhEI/iOG1EjRnXoHNjh4veYLlSrxoVIzxGoBtapN20KqU43SinSaaNePTKGgjPfAGgrzJJqro5lCDh996p6TKVZUDqtCPJZieXt/RwP7f6znkgldAfnrYIR5oGtiePV5dGBaXWCUNibhww6e0nibXaHgruJDhHkIoY7fNv/Hbx+SQ2M0a8XKYNpe/o/U6i4VhRcOknpBAa140imYgJWXkZ/sUSrEw5fUW5lWVNixu95bYdK0zmAtRZsRgMUk1EBh8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t928qeVbVMARETrtsBxblgpsRP5VAy4Yac8SVrpvYzg=;
 b=pSbdw3YSJTaFlT1V+RVLmLfVddmB7g0ZxPqW8NQB1g8aw3D3BfNe434O6nRyQk8I5uFLOmMoGslBBymsIIC/aTjHJXuuFXQn4dr//28H1eBHzUbMoBWFq8ns3LJc2FCY4P0gst5HpUxk7R4xSKGkeqygXqcvYxIqWFJViTvTo2m0xzF8b+AnOS+R5jbMeBjaX3kFn/2gV8dwBD6zKMYZ5/CczYcwa6unGnrOYV0gSLxxX9dc49D3ffIk3KIU40iW43yevSWLTHRXxV+nvVntTsmKaBlYXQlcnrfM3tD1sAOeLDsiUEndHP9fShExOLCI15GPkzRDL17kepuBbRYmXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t928qeVbVMARETrtsBxblgpsRP5VAy4Yac8SVrpvYzg=;
 b=nnjMhPgQiPERGdMhZdjnNyXuHgOmI9xrqDCqmdMRU9zjeE34oFMamazBnHMS1CKooucy+Ui2ytM7Jw6x7VVQ7pmhGoMJZmTAr+8ThaK/AHxU8MunAmKHUzq8rBa2u3eOL6hbJRvH+CeMqwc5ZBMkAGcVSIIGOWrWQdWEKkDiUA8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB7121.namprd10.prod.outlook.com (2603:10b6:930:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 04:22:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 04:22:18 +0000
Message-ID: <92809454-e92e-73c2-84ae-8d63e792c8a3@oracle.com>
Date: Mon, 29 Sep 2025 00:22:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] cg: transition [u]stack() from action to subroutine
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567238538078DC5066122BECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567238538078DC5066122BECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f36279-9e88-4731-220e-08ddff0fc6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXN2Z0lHR2k3ak5mbEN2NjZVY3F0S1VoU1ZrSDkvYU1XTGd4bmppaW04aWI4?=
 =?utf-8?B?aXBieGxuWTlqZktMMFg2Vi9MY3huWFdIZGhwZWpSREdCNDRadFFRS1NlVXp1?=
 =?utf-8?B?a3k1S0I3dDU4VThsZXNYV3dGMGJITFhqOE9QcGQwenBqc3FuR3JaZGhFL3BV?=
 =?utf-8?B?d0x4b2Zwc080dCs5KzNhemt3ZzlaaC9kM3hoU1lRTTBwcklabVgzZzcvMkZ4?=
 =?utf-8?B?Mk53RzQ1OHJMYzA3a2FFVllQbmVmNDlnV2x3b3hZcHBXY0tyeEpKUVZuVXZn?=
 =?utf-8?B?bk03c2ErZlNYUzlmKzBCS3I5OVVZQW16djVvOEx4YjVXMVZPT3RoSU9GUkky?=
 =?utf-8?B?OE5HSUxzeTg4dEtCQ2JERmlWVkJqbXU3VUY5blVYZEJKdmFIMTA0aUM3eFdC?=
 =?utf-8?B?YW9aY1VDVFJGNjZlVk1KUVdTZ0o1NGhPR3VjZTJRdllraG85cW1lSGJwQmlX?=
 =?utf-8?B?eUFjWkc0UE1xL3F1MG1Tc0F4bDExbEprOHRGbTViZTZSMCtWYStQQ0U2c1o5?=
 =?utf-8?B?NFN3Z2hqM0ZSSlJTMlQvT3Rrb0VFRVVmQ1hzNWMwZkZDWE9wMW5jSHVtWEtM?=
 =?utf-8?B?b0xZamxpNVhsbGJ5QXptcm43TFhIdVdCekI5SlZweUxrY0xRbEhpSUxuK0Ev?=
 =?utf-8?B?RXRHVDRPVjdDMDkxL21qMGVzZS9YSUpSYXAxd3ExYzlFdjR3c281WGVDb3Yw?=
 =?utf-8?B?cU5wS3hHMDhDV29aR1h0R21DNHlDWGZDSndDMlVIZVBhN3pxd085Nkd1bDZp?=
 =?utf-8?B?RVhTVndubE9IL0h2UFdUaTVEYS90UGRhM1NFV3FNNk1KSFlwWHJtZC9PN0sv?=
 =?utf-8?B?czdQRHlwcHhMSFZEanphelZRWVhrRTJWenJJazhJNnVQb0YrQnFMYzZZby8z?=
 =?utf-8?B?RVJJSjVYVmt0c1JPYVpUTmFHTG1EUzkzT2E5NVYrT1FhaE9iblE1UFRjM3Jl?=
 =?utf-8?B?cis3QlhrRktERG5pZFdzdDN0aHJmemhsSDA3MzVreXRhK1EydVoxZXVBUDg4?=
 =?utf-8?B?eHNVOWRuQk1NOGp0ME80VC9YSGxrbTBxbjVWbng0UURrcHdOZWtIMWlTMkhJ?=
 =?utf-8?B?VFo2RldaQndzZVNYcVRHSms3bVRBdGRKM3Y2SjNoUmRaVksrUitaWU0rNEdr?=
 =?utf-8?B?VERWcmlKdDBGVGl4blZyMmMrYXhQWG5KSW9sWTRBRXFlSVpaVFU2ZUkvNVdn?=
 =?utf-8?B?SENkU2lHZzV0Q3dGbEh6RUNhZDRTaDhLLzJYQ0dSU1B1T1EzaTU1SUZZMmV4?=
 =?utf-8?B?VkVsSXhVWUNqM0xzR3VpZ0xiSWVjUFR0Vm1zRWZkT01hZUZOV3ZzM2xTVHVa?=
 =?utf-8?B?ZUZGcEhqaWxUZVhPeDB3K211ejdRR2VXdmVqb21ZS255R3NSZTVjV1ZHMHBY?=
 =?utf-8?B?UkQ4Q1RTaE9Pb1U0Z0x2V05zS3k0eWFvWkwyNUdWaUY2VWxlMjVsUnlFMmdm?=
 =?utf-8?B?alZ6WjJCWlZHbGZxajdOdzh4Uy9OMzc4blNnVE1sa1Y3RVFFTzQ0UTBpYWpy?=
 =?utf-8?B?N09SU2JiazNrY1NKQWRlMjFUS2U3OW5mN2NNKzlDZ0lyUlZOYVptWTJjTlRS?=
 =?utf-8?B?Z3VzVjBjS1hVQlZLbFVvdVdvdUZUNWs3ekdzTlVGNFRKNEQ4aHRXUW1rYUZk?=
 =?utf-8?B?b1lGVFpadGRLSDV2U3VuOVlJZ3lNRW8vUVBhdDJRbWZFNHVPRWliL2xlQUhz?=
 =?utf-8?B?SVBlcnZMdVQxWXRFNzQ5Q1JzK2lIS3NlMllWL2F6RlJ0dkdqWmc3Z2ZKUHla?=
 =?utf-8?B?dlhwODU3TGlRaEwxam16dzlGeExWV1VORjFoMlJLM0ZJY1BoMFROSFYxOXlV?=
 =?utf-8?B?OHlZOTVlRUo2aFJjSy9vZm5HcWtkTFB1bFppRUs2TGkzQUVvZk8vZWRDS3dF?=
 =?utf-8?B?RzExU2F1dW04VVdGMjgzR01UaFNkbzVnMnZrczV4eU1EbXk2WUNOUXp2c21r?=
 =?utf-8?Q?1awl1aO9+oQo5ZqPA6yMf+JQCYvccuGi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emZrK0tZSHlPeTdQQTdyWVdPMno5a2FSd3V0blBuTVVLNWxsTHNnTXc0V1ZG?=
 =?utf-8?B?Mk9CNlRINWdBVGovVk13cFZjU3o4Q3ZuM1ZKdEROM3ZKOXRDRmFONVVFcjdI?=
 =?utf-8?B?aGR2MkR5ZW1HbTh3allrYVF5OEdGWWwwb0xhMFFEVFBzaHdhWUliZWVPUDBj?=
 =?utf-8?B?ZzNsRTFNK3RKUlNMK1BGL1dwSE1MRjJ0aXRjWlU3SzZiR0dWK0lvTWQzMXkv?=
 =?utf-8?B?QTgxSDgrQWFHejROK0R1NUprdGNERjFqbVk1b29rYXlJTS9BVlpOWXZndmp6?=
 =?utf-8?B?NFIwK3E5cUV1dC8rWlBidGJFMTlOajY2K1dyN0tUQ2hUZTN4T1NsS0tTOUJ6?=
 =?utf-8?B?WFBYN0R3cVk0NWUrZVVnRkhuUVJyUUE4a0NMZ1ZMaDg1N1VqZFB2R1ViakNR?=
 =?utf-8?B?aUF0NE00Sy8xUGxYK3N2UUlNZkpCU2FycDlyUENhYWhjMU1Sa2lPVk84dDUv?=
 =?utf-8?B?NnAxOFl1SGFrOFY3djduMnF0NEs1blNYeDFjUmFtVGF5UmE0MWc3MlIwQ0lH?=
 =?utf-8?B?Sys5V0M4QlhHSFlOdVpDTWoxeThINFZLZE9nK0l0RmlyUnFidW1MN1VBbTFV?=
 =?utf-8?B?aFVvR1pXWnE4ZUNCMXRzeXk1RmQzWTlRaDBUTm1zdytFNk1PY2xEdS9PN1BI?=
 =?utf-8?B?VXRzajFoWFVZVWlaU0hBek1YOUV2ZVlTOUphR1FIRS9vQ2JxbFJRYnZHUGNn?=
 =?utf-8?B?NjJscElwSmZVNUJVWDlBVGcvVlJFUFlSbk8vNjZPaDVmZG5YRzRXSjFyQjJT?=
 =?utf-8?B?R3B2WTVNTDNadVZvOVBSdEpPcC9BbzZib0NuNkpQV2piYngrN1JEdkJCYjd6?=
 =?utf-8?B?eWxDTElFaGZFcmxkMTBISGorQTYyeXZyT0YyVmxveWh2UncvMndWYURsNm5R?=
 =?utf-8?B?U0o1K3NVR0dJWWY5MUhCSGZ4dDV5c25taUJKcktOQ2pqSmtQZ0wrLzh3djNG?=
 =?utf-8?B?R0RUUXdDckdNbHd4Mkw5dXA2ZXEzdXNjbi8yN242cGZ4UVIyS1FYbS9XSGdt?=
 =?utf-8?B?UlpjVkUrQXp4ZEs3VWV3UkwrNU41SkxGQlJad2RHbTdqTkd3cTY2anM4TDdj?=
 =?utf-8?B?a1VzYlMrRU9NK3N4VkVrMmt1RkhTR0FWQTFZcjM4YWM5Z3FRcFdndXA3WDZE?=
 =?utf-8?B?WlBlWnJPcE5PalFlYjN3dkZ6Kyt1b1hkUm5SMUhKNzB0MWRiK2VpVm90cVgx?=
 =?utf-8?B?QWhrK25oTFg3MjQ5Y01MODhxVlBWSGs2UXlMc0hRWSttT0EyUTJmS2ljeWZY?=
 =?utf-8?B?UWRTWXlPUFhFeUxUTHhoTnk2YWM4MUVieTZjRk1RWWtrU3JSOG5KZGRTNUl3?=
 =?utf-8?B?WDlxeXFHMTJwTG1pOVV6WUVPOE12MEpvQ3o2RzRzS3hxTWt6eHIydzg5bVpO?=
 =?utf-8?B?bXdLMDdHb3JLOHpYa3laR0o4MnF4bTFxK1k1b3F0V3RlN1VUdUR4dkg2QTlO?=
 =?utf-8?B?ZzlCYW5uNjMxVzFBUklEdXV3REdVU1ZZbDBXaW55N3M3Nnd0M09xeW9PRzdM?=
 =?utf-8?B?bXFOZ25mOUZNT0d5TGdrVUtQdHI0QzdDRC96SEE3MDJhbVIzQjNPOHJwdkVY?=
 =?utf-8?B?Y2d0end4WWNJM2dPNmJ5WGlkRzFhVFd4aHEyNG8veHkyNVF2T2VrWC9lNVRm?=
 =?utf-8?B?dnFzYnBwVTc5K1IwNnJYOTNZT25SSHA3ZlJZclU4SDFQdVlwM0JIRnZCS1NM?=
 =?utf-8?B?TkFYT0VyZnRDNmJaUVpaR1NDMXdBaHRkYzg3ZmlPTk1GbFdQUDB4ZXVFR0lH?=
 =?utf-8?B?elBBem9zQm9HV0RjZ29uZ3BoaVAzdGpNN0tsNlVPamQybHhuVlBkY1JodUhG?=
 =?utf-8?B?WE0yeXQySjZrT0d3SVF1cVZGOVVxU2N5OXpOSjB0TzRCWXVTUFE2cWVwMjU1?=
 =?utf-8?B?MjY3WEloOXc2Z2VOTjROWHBqbHhPT3NmVWw2NkpVdlBlSjJqQmpXcU5IcE8y?=
 =?utf-8?B?Z3VsWTluaEhIeWVsNjBqZ28yNnZIQVlMazV3aStlMkJFWkErVzZhOENuT1lt?=
 =?utf-8?B?OGxJdnV6WWRrQmlqcy9GR2k5Z3plSnBtUmFvc0ZqbjB1aVIrbTJVNFcrR09B?=
 =?utf-8?B?V094VDZXd3ljbEtWSStVRnFhOW5DSmY1RDhTU2RGQzJRMU1TbU5EeUF1alBO?=
 =?utf-8?Q?A2yHaH4AB/++d7l0xof7l5Gp5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FOksLti/g774AVTNdFcMX5UXoyVDkc+9RVpiNUA/vMIm3XYFzNVvWxYPrlNDh4G9NEIpLqJaDoQs8UW9LO8NSBLETbq4YZmhIRB1vJaQdCueeuqaOvfxv//7CxT6WR4meWt1Zf8urwo0U72CGV/zdI0NonyHjT6UQRJncMdLPEWZY4u/NCYysQRRTtO3+c9QGzf0tTMqGTw1mevlXhM3WO3tdbGa5tZ9wHDLGvW6fcA5xP9YKyR2BQrflt6PmlVlsgygRVhc35qM6MgC/C/45amK4G3yh4lAMSAp/rBsGKGOCXsmH1gCZTmg8oK+5tlzkeddN/N7+rq5JMw6mwp8BXbH5brEWk7YwJFqCIpw9ZDnU7QqMnTY1eLbZgvGta2hM4vdQfgAQeuNf04laaVHiT9DrI/1f1hnwJQ19puujA7NJzhkdawtdmvlqmiH2bapwPVHvOUZMPN4pghFOzWozC4Z6gMY15YgEAgH6utBxjaUSy+yoqWHjYfEJNS8xgBp+aQw5zv67kVoeeNMfV6y32YGdtxNzO17odFbeAphhUP5Gi/FHSODTVj6s/FR3VX1NSUcX2GsX6sQ7iiylSCArGOmA2fOpXyLhkc5AX4PBgI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f36279-9e88-4731-220e-08ddff0fc6f5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 04:22:18.5592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5K+cKlG6G4tA90Yx0qiRJ1LpTc7VJddETZQycVNq3US4d+jNwPj+il6A3WvYuJLnijnEV++QqbBh7CA7eLO9+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7121
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509290039
X-Authority-Analysis: v=2.4 cv=dcKNHHXe c=1 sm=1 tr=0 ts=68da0984 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=LIbdzTo_y_-DU6o2t60A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CkBIyoFzJX1JGu4p-z-ojjVx-7D1hFrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDAyOCBTYWx0ZWRfX+E9zm5gYJCQm
 tTqMH+eJCNvM0rI/k2ZoL5tqmXw5ONzSQCqbjVKeVQQ7heb0S4+J6QYRdH8lu21BtaE8oNo0mbb
 lKsjNo+BpYyHFj71Nztjcmafz4OyFtOJtKlXG3qb9XAhaWn37BVmbPK/dSP3x4PqMIqaXiq/Nbk
 u9uEIvVR1Peaj3vqPg8GKwaZgt1DQfOBgaissdHl7a/gHKBZQ55NafZlwCxaZs41E8i2tTBa0m+
 9fLh0WfYgNDGNvtlmsWdcNeIDFcmHOLY8nER6Ve0vlCkWRWoJyvF99e3d946XHKe48WKQ9z5afw
 ZhQ0qE8CiZLMFQAubeUQjR5lE5frvrVkdwaKPJniiQeKaF3ZCnqD9O3d6GwuzMvQClM+mBSrC5F
 GxRgGKcnsgXbSL0casJpOYmtLOKiIg==
X-Proofpoint-GUID: CkBIyoFzJX1JGu4p-z-ojjVx-7D1hFrh

I don't follow all the details, but I guess this looks fine to me.  I 
did have a few minor syntactical comments.

It seems that dt_cg_subr_stack() and dt_cg_subr_ustack() are virtually 
identical.  Might one combine the two functions into a 
dt_cg_subr_stack_common() (or whatever name seems suitable) and do this:

static void
dt_cg_subr_stack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
{
         dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_STACK);
}

static void
dt_cg_subr_ustack(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
{
         dt_cg_subr_stack_common(dnp, dlp, drp, DTRACEACT_USTACK);
}

The win is less the reduction in lines of code and more in the clarity 
of what is being done.

Also, a few others sprinkled below...

On 9/23/25 12:01, Kris Van Hees wrote:
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> @@ -3987,50 +3996,63 @@ empty_args:
>   		uint_t			nextoff;
>   		int			is_symmod = 0;
>   
> -		if (dnp->dn_kind == DT_NODE_FUNC &&
> -		    dnp->dn_ident != NULL)
> -			switch (dnp->dn_ident->di_id) {
> -			case DT_ACT_STACK:
> -				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_STACK);
> -				continue;
> -			case DT_ACT_USTACK:
> -				tuplesize = dt_cg_act_stack_sub(yypcb, dnp, treg, tuplesize, DTRACEACT_USTACK);
> -				continue;
> -			case DT_ACT_UADDR:
> -			case DT_ACT_USYM:
> -			case DT_ACT_UMOD:
> -				nextoff = (tuplesize + (8 - 1)) & ~(8 - 1);
> -				if (tuplesize < nextoff)
> -					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
> -
> -				/* Preface the value with the user process pid. */
> -				if (dt_regset_xalloc_args(drp) == -1)
> -					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> -				dt_regset_xalloc(drp, BPF_REG_0);
> -				emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> -				dt_regset_free_args(drp);
> -				emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> -				emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
> -				dt_regset_free(drp, BPF_REG_0);
> -
> -				/* Then store the value. */
> -				dt_regset_xalloc(drp, BPF_REG_0);
> -				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> -				emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
> -				dt_regset_free(drp, BPF_REG_0);
> -
> -				emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
> -				tuplesize = nextoff + 16;
> -
> -				continue;
> -			case DT_ACT_SYM:
> -			case DT_ACT_MOD:
> -				is_symmod = 1;
> -				size = 8;
> -				dt_regset_xalloc(drp, BPF_REG_0);
> -				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> -				break;
> +		if (dnp->dn_kind == DT_NODE_FUNC) {
> +			dt_ident_t	*fidp = dnp->dn_ident;
> +
> +			if (fidp->di_kind == DT_IDENT_FUNC) {
> +				switch (fidp->di_id) {
> +				case DIF_SUBR_STACK:
> +					tuplesize = dt_cg_act_stack_sub(
> +							yypcb, dnp, treg,
> +							tuplesize,
> +							DTRACEACT_STACK);
> +					continue;
> +				case DIF_SUBR_USTACK:
> +					tuplesize = dt_cg_act_stack_sub(
> +							yypcb, dnp, treg,
> +							tuplesize,
> +							DTRACEACT_USTACK);
> +					continue;
> +				}
> +			} else if (fidp->di_kind == DT_IDENT_ACTFUNC) {
> +				switch (dnp->dn_ident->di_id) {

s/dnp->dn_ident/fidp/

> +				case DT_ACT_UADDR:
> +				case DT_ACT_USYM:
> +				case DT_ACT_UMOD:
> +					nextoff = ALIGN(tuplesize, 8);
> +					if (tuplesize < nextoff)
> +						emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, nextoff - tuplesize));
> +
> +					/* Preface the value with the user process pid. */
> +					if (dt_regset_xalloc_args(drp) == -1)
> +						longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +					dt_regset_xalloc(drp, BPF_REG_0);
> +					emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> +					dt_regset_free_args(drp);
> +					emit(dlp, BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> +					emit(dlp, BPF_STORE(BPF_DW, treg, 0, BPF_REG_0));
> +					dt_regset_free(drp, BPF_REG_0);
> +
> +					/* Then store the value. */
> +					dt_regset_xalloc(drp, BPF_REG_0);
> +					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> +					emit(dlp,  BPF_STORE(BPF_DW, treg, 8, BPF_REG_0));
> +					dt_regset_free(drp, BPF_REG_0);
> +
> +					emit(dlp,  BPF_ALU64_IMM(BPF_ADD, treg, 16));
> +					tuplesize = nextoff + 16;
> +
> +					continue;
> +				case DT_ACT_SYM:
> +				case DT_ACT_MOD:
> +					is_symmod = 1;
> +					size = 8;
> +					dt_regset_xalloc(drp, BPF_REG_0);
> +					emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, areg, -i * DT_STK_SLOT_SZ));
> +					break;
> +				}
>   			}
> +		}
>   
>   		if (!is_symmod) {
>   			dt_node_diftype(dtp, dnp, &t);
> @@ -6968,6 +7070,7 @@ dt_cg_call_subr(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   	assert(idp->di_id <= DIF_SUBR_MAX);
>   
>   	fun = _dt_cg_subr[idp->di_id];
> +assert(fun != NULL);

Weird indentation?

>   	if (fun == NULL)
>   		dnerror(dnp, D_FUNC_UNDEF, "unimplemented subroutine: %s\n",
>   			idp->di_name);
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 509f263d..9dd8956d 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -175,7 +175,7 @@ static const dt_ident_t _dtrace_globals[] = {
>   { "ipl", DT_IDENT_SCALAR, 0, DIF_VAR_IPL, DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_type, "uint_t" },
>   { "jstack", DT_IDENT_ACTFUNC, 0, DT_ACT_JSTACK, DT_ATTR_STABCMN, DT_VERS_1_0,

Add DT_IDFLG_ALLOCA?  (Of course, it doesn't matter yet.)

> -	&dt_idops_func, "stack([uint32_t], [uint32_t])" },
> +	&dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
>   { "link_ntop", DT_IDENT_FUNC, 0, DIF_SUBR_LINK_NTOP, DT_ATTR_STABCMN,
>   	DT_VERS_1_5, &dt_idops_func, "string(int, void *)" },
>   { "llquantize", DT_IDENT_AGGFUNC, 0, DT_AGG_LLQUANTIZE,
