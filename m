Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB602C08D4
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761532056; cv=fail; b=T6CrqtAJWjW08vVz6BBTK0QOqBcbUxWyfW/dppSGAnt0HJrovQXGmTYMCGZEdOvdNVs5B6JY3uouPMWl7LiZf5sexQtA1hZJYK/ZdkB5s4+lcjFnQ88O3xJiAYFCqKehIEAYryzCkNs4tm430Np37WtbP9/DtRC34bOVMHHf31M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761532056; c=relaxed/simple;
	bh=DPukY2LiPBKySC9QW06BwsIGAHgPuKTh6WI5oqlTzWs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CM+SuJnpcxnmdhXo/JyxuV92viP5GP50X/AnNLPy5iq1NSl+LvhdDZV3vMQdFRkVzrx/HenJI4E2hsj8UrwTOdbI0v4TCpzam9npOKdhrkM4N8x/bjVStVHcJeNWKEF5pJ0Fe5fwMfxspvKYxUgj2mkHZ55tqCXeF3nogsEPgbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M+aee7jR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WKuMJz4V; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M+aee7jR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WKuMJz4V"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59QJHmuT008759
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xPwPR4jTWm/4R2WrbEU03xWr0yqTrWh614/uFcl4S2E=; b=
	M+aee7jRC/qk5yyta9c8pSqlJz/lA10FIkGRQWhU6uoEQ7aKlwi7rdx+sF6ngpuK
	eYZ4UIh9RlayZyW/n28ueK63IexJJ0SmiUouKaZMTHk/1zFrGR2LHRvqVjejNGcL
	m5ShyJ90FkcYp7P/d5RQXpE4foLztwdNDPw/nQoLzU+Koi6cdJ8CV94yT41PLSPM
	z8CgQ6f11pQH56897sT6Yi5frUqIE46UwnVuS6gAH2U+DVs6/rqt1dtSutVCIwPE
	pamiHpzczdO+4G0UnXrcZsUoW+ya/pkVTKIgrTBdrOyvlzLzwg2duJBXI3jF+t94
	5taMftX3Fxqxzvz9tUhaSw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a0pe7j876-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59R0fmNe009221
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:31 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n0dfke2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0AwddKWDPlkBxB6zeBicokidglkpE7PeaHez09GO4YxWGxKYnDFVUJkncznt2+zqJgSeKnbfWH0U+9nsdodj5KAlcpVlDtgsdrQDJxDjG17n5qZXoFQ3KDqZqjbmiqkU9Q5VBp97rPVTxSiqieuBZZ2dekY38z3hj0xE2cCkgAozrjG5uIVFlCYV5Ar41EkazJNn63XzPuo1qr2YLvI1UN0joxfNrikxWgRo/3QKDZI/eS9yP9R3pcUN0atYu/i3TjEanH96FmEBcE8KT3rwd/h2FEWCokd0DFuezBoZvqK1D62Zgb6Up8IvcZG7C3RR4xHUoaiywpUs2IMptb7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPwPR4jTWm/4R2WrbEU03xWr0yqTrWh614/uFcl4S2E=;
 b=OQDDkUk3qx7ylFkkLw2LyCkUUdykRRvBPXBbY+i0P3cLvxWwg/OcgVqMyx/SQmS1n7g2agvNSSWGGcRrRCutHdxxyZtcYhbhMrRkgoZMi+mYcJSmphs0ARyuK5LTPqugtyeKAh2GoiTX4cSFysYuiot0eKNn3jHs2T1J9TNwInpYth5g8fDpOtX7rVmxoFYmTT9MA79wSpMewZE4oogBrT/ziq9UtzUIGD3+6wVDnqibCBginrP+fxPBle+4f+eHkDRdSbicsjv7UIkC3pBOovbckbOMPR6ppVZR6E8/8/Bu1Vp2fHigTI01K+SM/hvILtLwO8Z9DlVO6lP9wUvB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPwPR4jTWm/4R2WrbEU03xWr0yqTrWh614/uFcl4S2E=;
 b=WKuMJz4Val6rstRUiTfB6G1rlQbi3QSBTyWChaEnMZoUWaVsIFd4cSbKoLSszDi84R9U5zFjmQ8BRpqXaVJhrmE9y++qgX0hTFEUc2AG7AJgjjkaQYNBJ8EjRHJ9JBEnqsoyXlFEEutByDp6tgh6Rc0DB4FpRmlcFmV6AtdeodA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7007.namprd10.prod.outlook.com (2603:10b6:510:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Mon, 27 Oct
 2025 02:27:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 02:27:27 +0000
Message-ID: <e43a3e04-5766-4b38-05dd-d528d7001d43@oracle.com>
Date: Sun, 26 Oct 2025 22:27:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Bump up the version to 2.0.4
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251025034446.5894-1-eugene.loh@oracle.com>
 <aPxPZG4QJkAwS7fu@oracle.com>
 <9d62707e-595c-975d-3674-cbc172ccd32c@oracle.com>
 <aP2KetXx/ChOiCov@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aP2KetXx/ChOiCov@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:5::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 98515fe1-8ef5-422a-dcfe-08de15005eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlZVcHJCcVRhakxKdEpJQ2d1blBlTy9DbUVseGJ2VCtqRUxhSER1WWJqQ3hr?=
 =?utf-8?B?aGRKWCtkNTRGYmlsUVFGWTVRY3NhU3o3cFZtMG9VdEdkSlVCS21VYVp4OEln?=
 =?utf-8?B?aCtUcjhJeGhwSUREQXBJZTk3bXJYVytQZ2R1L1d1TDZ5UU9JQmJNank1N2c4?=
 =?utf-8?B?aGdpWGhDSXB0OVIyMlVJbHhlR1MzK3grVWc5ZkV4ajZhdlpuZ3ZxWVovdVpM?=
 =?utf-8?B?b1FwVmxUT0dUcWFWYXBVaFdBRHpwWVgwZmliMWVObzNSTjlIbzFnL25lSkxp?=
 =?utf-8?B?QVU0SURUMzF1MDQzc3ZWZ0ZpZ3JNT0FpSUo4eGJENTZhYlBWekpsZGdLWGF0?=
 =?utf-8?B?UFhDZmFQR0NudHVCM3U2YTFPNEVxVlM3SmhWdy9YYmR5cXdFVXUxWFRnVkFF?=
 =?utf-8?B?Z3BQQzB2enNVQ2s2MXB1VzN4bE5JS3VDOThmdHRFK1lDck40TktpVDZpYkww?=
 =?utf-8?B?NFF1ZURETlFUYkQwVzk2V0x0ODBpNi80a0pBc2xobmkydVM2eVk1OS9DQzl0?=
 =?utf-8?B?c1hJaERyb2k1YStSSE56S2VDL0NMdFpDS01XNytibWlBRUlzYmxDRXdtVVI1?=
 =?utf-8?B?RGxKdUVtZGxFNVVhN2s2Y3Q5WjJYVVJacTFKTmtLMVdkaEplUHovYUJsZ09k?=
 =?utf-8?B?SVdVdENJeDdXbFBSSWtGUkkxV24vdkdsQS9yOXRHWjJyY0xqcW12RmlnT2Vv?=
 =?utf-8?B?cVRvUTVZYkFuQUxPdkpiblVqY3ZuSkgxeHI3VHN4MktmdkUyV1ZtbHJUekFO?=
 =?utf-8?B?NzJWQWVBSDNpSlBsam40akpkK1R2VU1hd21YeEY5Umx1QmdrSkNwRHQ0aCsy?=
 =?utf-8?B?OW4vb3BpZTQwcksxMlp1Ky9JYk1SN3EvL3hlUE1IY1FJSTc0SHNkbU9ySHRZ?=
 =?utf-8?B?SmR1VGJuZzExTlo4Q1hsNzJVVHNJY1AzVm5WMjFWL0x4bmc5VFdKci80SnhB?=
 =?utf-8?B?a3JnNzZ2ZlVqcXQ3eW83RnJuYk5tUFp1Q01sMjQxbkJGWjQ1UmFwWkJ2YUxt?=
 =?utf-8?B?K3d0T0JKMTRzSmQ0SzFQejhSV093VmtBVGt3K25uMEpQQk9IL1pyOFlQallj?=
 =?utf-8?B?NmdHTlh5aGhEOE81dER5elowY2xXZmhBQlNNSnFuOHBEODV4RW1MdklKeGhl?=
 =?utf-8?B?a3h4bWt4U24xMG4yREJpbmpHV2N2VkJkUU9uRWNjQUlrUHJHcS9XUlhmVUw0?=
 =?utf-8?B?OHJuY3JNcndTV3JrN3FUaFpXL1BJNXh3WkMzRGxwZTI4WnVzK0tuUndCOHJR?=
 =?utf-8?B?WDlLVzVKK20wZk1UWldlY2NySVJyRS9QZHprd3p2SjFPTm9GdGZqOU4zTnFQ?=
 =?utf-8?B?WWhjb0ZqV2FFUWJEWG5CVWkwemRZTnBLREJINHZPZFpxZld6ZngzbTFvT3My?=
 =?utf-8?B?bFJJZG5UWkhiaDFKQ2ovQjZRSlNSUkJKRjJGZTFrdXlVbzU0MUpXLytHb0FP?=
 =?utf-8?B?dzZCR09Iak5LbXc4Umd3QitUdGFBOCs4T0dUZXNCOUYrcXA0djM5ZmZhQlVn?=
 =?utf-8?B?OXpTVVFXek82TGlWRHVEa2ZZNkRtSGRzbDJUQU53Yjd4T1FQdzFuRHNENmJM?=
 =?utf-8?B?T2dOb1RlV0lJejdwS2tIVkZZaFVSYWFtblR1VTdyWXJFVnlhamt1SGZrQXYv?=
 =?utf-8?B?ZHd5LzRobTdCajdtRlB3TjVRWW5wS09WbS91aEZ2S3dsWGpORlJzWmIwWm5D?=
 =?utf-8?B?Y0pVOUZ5dVZ0TVlSQy9DMm4wN1VNM0w5Slhvb2RWMzRSa0RhSzY5YmVXd3Yv?=
 =?utf-8?B?ekJNTHNFZWRxMlUrai9xdm92eE54YTdESHBQZ2lxY3VOY1A0dUxQRjcrL2dP?=
 =?utf-8?B?bTdYL2h2dmxPclc5VlcvaU45RXZralVwTWNlZTA1UnArNGpkYkFkZXpjWjRW?=
 =?utf-8?B?RjRIN2dWb3kvWVV4ZFY2TFNrK1RNVGRUS3dMcTVDcGIyYUF6bmFqcWtsRG4v?=
 =?utf-8?Q?4KoXY57QpY0pyY7gmdzRshM5gWXGmR1+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzB2a3E1U1hpbFI0cHU5UW9UQWRORW9lV3E5U0xnZzRpUmNST2RseGNxNHVC?=
 =?utf-8?B?Z25KeG5VTHA3YThHQytvRUt1NjUzaHhoODVueUpUZEs1QnBISnRjc2hOUVdU?=
 =?utf-8?B?K2JCcWN1MlZ5WjlpeHBtdzRxTGR3cHROMnBJNHFObXdrWVAzMG5adzlYOFhr?=
 =?utf-8?B?OThTcVU0cGZpT0ZIdnA1Q1Y4UzQwSS9OY1BOMkZTUVVMYktHNzg5KzYrV3l3?=
 =?utf-8?B?SE9HQmlScU1EUmdKQkNOZUVERnNRV1VnZHpCc0ZHZ2tRMzd6QVdWS2xsQTQy?=
 =?utf-8?B?TlNUUy9MTjlYcTN3Nk1STU1uc0l6VDRiRWlJQkNDdG5pMG9oRDkzNW92Rmw4?=
 =?utf-8?B?aEkwL2lqZDJrQ3B5UkZZcEs0YWkreUFWR0ZUQzc2L3JRRHJUSWtFUmZhakxt?=
 =?utf-8?B?S1VaMnYzMjZwVVU1ek9DcWFqaGZzY0d4VHV0Y2d3bDVnZzArSVNrM1FZNFVt?=
 =?utf-8?B?aHhFMW9aamNGeDY2YS9NS0xrV1FCUFUxS29PNTh3NjlHUWNLWjZUQ09vTzRX?=
 =?utf-8?B?dks4RVNodDdocXlJVE1MaGhEbXM5MnRuNFVQOEFQOGc5b1pZNUlzY3VIdEJI?=
 =?utf-8?B?RVZiTDBxc2ZQTExJaUNzOFpick1jZy9Hekh4RnRIeExQSSswaHpiTXJ1a3hJ?=
 =?utf-8?B?dzJGaFFhMnZUUEF3OCtlWU5OR3ErVVZpc3lmMlptcm8ycnNaUitlcDdwQkMx?=
 =?utf-8?B?Z3F1NG5UTnZ3UGtJMloxSmdOaXAvQXl3Q0xNRWdtWDkxRTBTUGFWMy9Ccmdm?=
 =?utf-8?B?VndIaGNrSk5YejBPTXhsRUgvTlJZU2gvQ0gzc1paOWtVOWlxeUxyK3d2VUdD?=
 =?utf-8?B?Tk01V2pOWW5qUlN5cGtnamlMVmFXRU02YVpzVUtBRXFUajRydlBjeGRXYWtx?=
 =?utf-8?B?VmIyb05rOUpTbVN6QU1WNEFhS2xvZG5GOHF4MEhnd0RmVzlkdGp3bHBDUldN?=
 =?utf-8?B?THozUVhBVTMvM1Vob215MUdvNWs3RHdIcmVpNXJueWhRM1JVRjFLVWVVdlZX?=
 =?utf-8?B?bGM4NTZrdnhOblZ6RHRQUmhpdFU0eUsvNnlxT0hmek9FWnRXTFZMRFpaaXNh?=
 =?utf-8?B?WTA3c2tTaWY1VHVPL0NwYldkcnNTeUZHOVVDNnA5ajJ5K1I1WEhkemNMbHdN?=
 =?utf-8?B?K0JlUXBqSzZ4SWdxT0Q1cFdaNVNVajdlTnQySmR5YS9CVkxNcWV5TDlWM0tr?=
 =?utf-8?B?dUN5ckFhd0F3WDdmZ3FWNnB5ZEgrQXhGWGg5RWQzbkFDb29NdzV1VklmRE9y?=
 =?utf-8?B?ajlzNUJBODRhdTk0Q0NSU1dxdFNFYXIwTnlyTTVVdllSUWk3L29sVUs3WmdJ?=
 =?utf-8?B?KzlYY2VOU1hPRG1kREdpTW9KTlNTTDdUZ2JabEp2T2R5MGw4YkM3WUhkNE5L?=
 =?utf-8?B?QXR4bkVHZVoyMnZOTXZHY2xLek42dzVFOVVvNDBqY1VqdVRDNGx0K3BXaDZD?=
 =?utf-8?B?VWQxZURtaEJnM0RoMzJ4OS8xd3gvaHBQZWJQMkFtZDhMa1JYbHdrUktpdVU5?=
 =?utf-8?B?R3RJYjFKMVI1R0R3eEh2YzVqNSt3bW56UUZUSW8zWkw5aUVnUzIxRmtKcVFu?=
 =?utf-8?B?RTNrVDFMNXhTQW45anpKUUZrOVN6MjlhbWhjV2E0WDR1VCt0ekdoSjdwaDlu?=
 =?utf-8?B?d21jeGlZM0NjaVJSQk5MMGF6RFBpSUhVM0YxeUtGVXJPNElwOVN4cUZIdFZa?=
 =?utf-8?B?SlYvSzhzVzhhNjFWNTJHUkkxYm5RVVBtOHFycUlEZFg1MExpZzE2QkdWaFJN?=
 =?utf-8?B?SUJPQkJkK251N1BwTzZuNDY2WkVRNlVQbU5SbXhnbDdXdUF1eDBnNVNtVFU0?=
 =?utf-8?B?NUJ4L0F6K2pQMnpNS3RuVWRHWTBENHkvRWtUVmtweXdDVFl0UU0wQmx0WEdY?=
 =?utf-8?B?VUtRL1pjUHBiM0ltVWFsYWZKUThGenU2RUtsWEJyU3VHWks3aW5MdkdrMVcw?=
 =?utf-8?B?K0xISkdKclc4cERXSUpIR1Q5bHZnckxJOHNtcm5zVG9ZcGxvSjh1b1lFNXln?=
 =?utf-8?B?N2ExUlRXYmhMOE9ibVpaUzg4WEVyUmVZWDBsbENjVVdHT2g0YzQ1bGFMSGRt?=
 =?utf-8?B?NTJ3WmJLa2RKRVdwQmN5ZlNvWTRVekxNWkFiZk1Ddld5VENTcG0vN2JiRXh1?=
 =?utf-8?Q?Zja1ue7pP5yGLY/R/10fR0VZA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gp3jPlW8lsVONQXngSfFPEj//MYizLny+IORTMPA3cZbxcwdHvHxj2EumHPEeQRcVMvQ4ZQ1XWb9bon9Ns/xjJY8w70cXsjQTmnsxxN/Kuio13PGgUxdX70bf7oY8Cs5vNiFVKoDPY1VCYqQyuxc4IG21UFtTQfvZAFwGIlgnWc1jpjWVlP7mdla4BwDY5yTfyJi1hmdxTvXCGEm27RGbYJLjK+t4CYp2Vn6fDEgy7pNOaYQC7oTV17PD3tZ0eUWL21U6HtlTfIjaZmx+DqacCc9KhCJNxjrG0+4rH18nKikjIShpaqt1jMuGxcY8VJrlQUeYS+JnqcYzCfVxSwV1eVyheR1CVxmqymOV1j64SPVCtj4kvJ9eFA6RnatsZki8FaoCThJgR5IMjV16zJOT5DufETCTAwXTrQYJbuCk3GD0Wt9E6OiMrBG/L4hq3W9pUcNEiD8qzqJiEPDRv1p7CwjBuM4D6l430N9Pfw+AmHC3xIRWwHwBN97tGxdYa09jekUArbxejGKf/rvuJHmoB5+CYNs339RPm0i5CisL8FRNKRNLLr42vIME/rVpyAJwuW/IJ5qCR/BihuOnOGkTuqFO4SJhb8JYDhQEzvq2QI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98515fe1-8ef5-422a-dcfe-08de15005eee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 02:27:27.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc0Rjx4Myv2kmpFoI2kqfrHvVBPTjfqS6GaEMh7ZkszcxCtCnUEE9Ne0X2im0oru+OysED7fTmIENXeF3Jjt3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510270021
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAyNSBTYWx0ZWRfX6odrz+EYa6V9
 u3+jHvxnfimqCtCAVGlcp3+WOlA/u2hPBH3KjOYiejXCNtm0K8uVHeDrjB2BkicM8r6tCIV8nS8
 o6BiUN3s6nTS5vrlbjPnnavF2bUywwFL2K82z1ozS+vDuhVqy5vpgi1KT6qiv3s8Jj/pbU1FxnZ
 tkJGJC+qcoDbaS9qhl+4EGh2EJ5Dcs/PPkjjS5QdCuhkaqYmjdikGtJ8M+EQ/E3SdVLXg03uJVD
 ym+wbHjWraafLHi4turBfdzvuK/sQYqXHHPlbgYyAPrUPohHKvgCy7E6XKuO/D+ewOkx2MoceRH
 uBdHDfI+eaMed9BLHogU8lHUUMI4azlMVqAdNbLGmD3Dq5UqUfkX5gAuWoZVOHxoI8mU9BTkpMb
 q7Bbjp3N6IUEn2ZUnLLG/ElmC5C1YY5kIHw8NyN+hpGAhnPEtYQ=
X-Proofpoint-ORIG-GUID: DgP0wGCgfkiNCgaFu6sS7ywVk39vgnoe
X-Authority-Analysis: v=2.4 cv=JfyxbEKV c=1 sm=1 tr=0 ts=68fed895 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=eesEqMBzaco5S_6szLQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12091
X-Proofpoint-GUID: DgP0wGCgfkiNCgaFu6sS7ywVk39vgnoe

On 10/25/25 22:42, Kris Van Hees wrote:

> On Sat, Oct 25, 2025 at 03:02:34PM -0400, Eugene Loh wrote:
>> On 10/25/25 02:05, Kris Van Hees wrote:
>>
>>> On Fri, Oct 24, 2025 at 11:44:46PM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> Note that test/unittest/preprocessor/tst.predefined.sh checks that the
>>>> __SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
>>>> message, and both of them simply use the last entry of versions.list and
>>>> therefore will be consistent for in-tree builds.
>>>>
>>>> When RPM packages are built from the .spec file, however, _DT_VERSION,
>>>> used for the "dtrace -vV" "This is" message, comes from the .spec file.
>>> This is actually not correct.  THe value of _DT_VERSION is always provided
>>> by the GNUmakefile, which takes it from its own VERSION macro, which in fact
>>> is set to the highest (most current) version of DTrace based on versions.list.
>>>
>>> So, the version that DTrace reports is always provided by the highest version
>>> listed in versions.list.
>>>
>>> The version that is specified in the spec file is only used as version of the
>>> RPMs that are built from it.
>> I'm confused.  E.g., with the 2.0.4 RPMs we're testing:
>>
>> $ sudo /usr/sbin/dtrace -vV
>> dtrace: D 2.0.3
>> This is DTrace 2.0.4
>> dtrace(1) version-control ID: 1ac1d4aaf8fb2ffa21187eb9e5227a487f7fcd40
>> libdtrace version-control ID: 1ac1d4aaf8fb2ffa21187eb9e5227a487f7fcd40
>>
>> The "2.0.3" is _dtrace_version, which is DT_VERS_STRING, which is the
>> highest version mkvers finds in versions.list.
>>
>> The "2.0.4" is _DT_VERSION, which, um, okay, yeah, is set by GNUmakefile,
>> which I guess gets it from "mkvers -vcurrent=t versions.list".
>>
>> So if versions.list was missing 2.0.4, then how in the world could the RPM
>> build report 2.0.4?  Where does that value come from?
> I think that the issue is found in the following line in GNUmakefile:
>
> INVARIANT_CFLAGS := -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 $(if $(NATIVE_BITNESS_ONLY),-DNATIVE_BITNESS_ONLY) -D_DT_VERSION=\"$(VERSION)\"
>
> For regular builds, that seems to be taking its value from
>
> VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
>
> whereas for rpm builds, it seems to take its value from
>
> make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
>          %{bpfc} %{maybe_use_fuse2}
>
> That is the only explanation I can come up with.

Right.  So that version number *IS* coming from the .spec file.

> This seems (to me) another case where versioning cleanup is needed.  I think
> that the version string should be defined by the build rather than the
> spec file.  The version in the spec file should not be anything but the
> version of the packaging.  The version of the implementation really ought to
> be handled by the source code tree itself.

Okay.  So, the .spec file *shouldn't* be specifying VERSION in that make 
line.  I'll go with that understanding and post a v2.
