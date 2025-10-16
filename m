Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368A320322
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760577214; cv=fail; b=IobIOQlD2OLUhBQ1tkg5ObwPoHQ9slUjr94QS25ViEXWyiZV7tYWxoXDxOT3k+aTqoaYTOn5TOVCTcUIJnwQr3RgVQx57Kvxyl8dDA8F2Ic97JwNEFCFxlUnJLpbaBMxgWSprOVD48+8n41aonS+z2LUzFNJNoz9XD5lhK6CCZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760577214; c=relaxed/simple;
	bh=O6o7X0rbDea4oct92FrIKvD0B4Pb6aSkGKlxAESUSvE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IJIxh75CbJ4ao7ki+vmKqu11WpY2b/zAQzXSmKKdF53K87EmwQogWFiWMZorf9tQ/zCcqAs/pJHQUm6GIIVJNm29noqT4x3muOnJOJkYRuS630U4rj2qKA8hcbyaEmPM8aklU7KPx/M5UNqBVmVXYAnLq0lU0ZXYkNyIb5jM0/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JMq0p4zr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dzJY5YNn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JMq0p4zr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dzJY5YNn"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJxIaq027308
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3q7XcV/Qj3pYJv83fMg/7Xlgfv5nmLXSXEjPAZwDnXY=; b=
	JMq0p4zrMYa4Gezb6e3nz1NtVa9bxJc95JdnkzsfYRq0bk3KviCv3nqM0CQH5YC3
	5b5wMIS8P2OzeqkHrAkQITatFkN/Om8l8fC8pXJA3vfFP1DrlHKmL5ACmwPVnMhH
	mXmcKcQMX4Bya9qm9xMQaWfwDZAAAG2cl6NEiV5mBNO2opAbko8nSEz2yQVRvZ4k
	itMt6jfwPya7Bry+ZVv5tBzPMkXgv/rDSFHlefbya9lEDzP0K7Gz95D9s+tpLsps
	W/HQKFT3T6YSNXXcjgj2VmAtUm7AMXe79GRHnO6tT51L5VHRtVHZC1celrUUKoJB
	T6TR5mnQpEe7cjJBDtyl/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qeusyu3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:13:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59FMCYGe009703
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:13:31 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdph1n2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 01:13:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZFnH6QriLCwcJm2ilB9w/DLWS13m0jyfL0gvb9WhL3tQrVC9SE6aehE1ednoKvwCXiXKGs1cBdzkncMUGJpqeadsFdlPcUFej6MUFfIpRmJrLy/lrNYVFdA/uDhB2ZP0GKKSpR96acgbTgT8NR1AF/kyjEGpGy7JDLbpjqQ5LxS7p9xP+WYofPCUqrwd+U1m39JEwCY4iG0je7J5cPbk7zBBgM/9Ota6NBzdpw6NbEiEY/hBfT05Dtqdy+CXLgOhr6A+UwxlATBi+cZosBBH51lB2jgFcoSrV4MbS90sHBAn8Xpaafk3WcCWku0FWIpNDbJsiq7isoRHaK8OD1jpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q7XcV/Qj3pYJv83fMg/7Xlgfv5nmLXSXEjPAZwDnXY=;
 b=hdLobT2Dln+xZTJfTgKXT6QmU8vgQx7QUMy9q+LaBuil+IfB6I/JHMvwQxxhltpwyv1W48Wmto8QCFIrbAn+KGS02rJhW/wW4ZA3a2kSyJHfQlWU9H2bkLqFddEvl7UPeAvCnR62m4s+oHhKxZyMkYnRTd8CYeaxNHY6G/p/x0ZvheP/oDArYx7qJrE6SJ222vezXzBAe33GrkBM2OcyvUYK3ys/G+/QSDFLI4AGpjOiWZv5W4q9e4tKeyvZ2Qpb3xN3dP9RUB3Fqex3y7awDnbXRbwOwy2cSYz6gVS1j3uGTSkRjOwS7bNZRwD8C2WV6OA2jM1xEtMNDwFoY4HCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q7XcV/Qj3pYJv83fMg/7Xlgfv5nmLXSXEjPAZwDnXY=;
 b=dzJY5YNnike1bdxmVvmpkvu4rnsyifZLrmWBafMwAEeJ3p+cYvur62mhtgveMA7h8ls8dmvz6kJaIJ3ftRpsxaKsgjAWwRrSsGxFVS9TrpYD45fnhS59t8jo83PxymmSIm6/V09FQzOh7h0Mt/zhsEyg+o/scE+vAqneu1NVY/4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV0PR10MB997615.namprd10.prod.outlook.com (2603:10b6:408:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 01:13:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 01:13:20 +0000
Message-ID: <20e76ddc-5157-0617-3bdc-215687af0eac@oracle.com>
Date: Wed, 15 Oct 2025 21:13:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] test: skip D return() action for kernels
 without support
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987606C19FA5E4C88EDC68EC2E8A@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB3987606C19FA5E4C88EDC68EC2E8A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV0PR10MB997615:EE_
X-MS-Office365-Filtering-Correlation-Id: dd58c7fe-50ef-410b-82c4-08de0c5131b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDRmdS9VTmwxV242bUlRU1Z4K2ZGa0FhcFpocXVTc1I0K09TOGwrMW1iaG5v?=
 =?utf-8?B?a1R6RHMvNDFhMkdIcGlkM0VINS9iSURyUVp5M3IvSDZKRmZFai9wZVMwZWp3?=
 =?utf-8?B?VUo5eEN5bGthL1pPZU43TE54cDJ1bm03R1lCYW9TTjVJUjlkVmJjMU5SallT?=
 =?utf-8?B?c2thdUtKamYzeVRaYXJNR3BRUEp4SVlzdXcyZzNJUkZaQW9OSysxUGNtQVRt?=
 =?utf-8?B?eEtjWWtaaEN2ZGNMWFVFN1dnWXY4d0dUTFprQkMxdEEraFdIQWFPL2FvN3M1?=
 =?utf-8?B?ZnArdDZicG5HV1hXUUVacEU1SURjblpha2NpWktvMlhhNU1qTUNOYW5FMEJY?=
 =?utf-8?B?OEE3aTBCQnUvUVMzYTZWdHZSalMyeVorQ1RSTEdpc25vMFQ3QXhtRVZXYWhW?=
 =?utf-8?B?RmhNUW5SWE54Q09MbDN3OFMwVmYrUVJhWFU5U0E3UWNLckxJMjYraFFobzRP?=
 =?utf-8?B?VVNpamZ0TGlsRHlaSktIdXcwdUNOVEpJa3hxS0tQWE9BYWlhenN1anl1S1A1?=
 =?utf-8?B?T3JzRlB2UXFETlJVOEk0NmRVbk5DcDViblBVQURPdEYyMlI5NmpKS0c1dFRW?=
 =?utf-8?B?akdTMWNjZmlTYjllR0IrZXE3cnBlWWppUmh3WUVtSGdZS1QyQUd5UWR4a2M5?=
 =?utf-8?B?TnplUmZCQzYxS3ZDd2FoZlRoTlRXN05HWWl1SWZGanBsUWthMm5pTVg5T0VH?=
 =?utf-8?B?cnpWYkM4VGhEb2hlekhuc3ZLanUzcmhDcUM5eCtTSWJqQUZnMUFDSUE1WjN1?=
 =?utf-8?B?VFM2a2xsTkxzcVQ0Q3hrWTF5bXZXTFkwcWFrM1MxSC9TZ1FkY1V3SmxzajJ6?=
 =?utf-8?B?UUU0TnlYdkxIK3Z4NGlSSzJuaElDd09xd3JMTFZYWm1ldXZTU2hJNjJzQUh6?=
 =?utf-8?B?SXJBYTF2cFNQdjA3ZWRxalVwTWJxTzRzZDZVb2tpS2Z5eDZJc0dyOURmMDNr?=
 =?utf-8?B?Q1ludW4zNzMveUJCNUZkTDdZNmJrWE5ZaU5OS0pBc29td1J6S2p1REFoUm1L?=
 =?utf-8?B?SzMxTU93bk5tUGtKVCswS1h3bjR4eEpoYXVhSWViWGhDQ3lqVGZwcEdRNzJS?=
 =?utf-8?B?cnFHQUlSSjl2cHE3YUNNSjlTN2VnUkNKVjhrWkV0K0tncHJ6NWR1bUJ0TThy?=
 =?utf-8?B?T01tdWRDNlhSZUdUWGZoR29IWWpVamt0bmV4ZElOOUJ6dUxFLzZmRngzejFG?=
 =?utf-8?B?ZExQQ0xXWWorMFNzSlZ0d0JzK25KM3N3cEJTVjdyRXYwWERCeGRBcDVoNWly?=
 =?utf-8?B?dE5zeWhMODQ3OTlNZU9QdFZNQlc4M1BSV3FDOERxaEFCTy90b2c3dG1zd0hZ?=
 =?utf-8?B?dm82ZU8rUjk2a3NKbjlCZGh6UW1YUFFXYytibmYwS2hEb0xnb2p5SkpBeExh?=
 =?utf-8?B?UkphaUszSWZiUWhxckkvRmRoSzZlNUhpSHdLc3NMWVhadk1wNjBvVWR0SHdj?=
 =?utf-8?B?NEx5eEQ4dGZsSndYT0ZoRmViTUMrZC9SYnRCSzRwQmVFZzNGSFA4b1B2bnhV?=
 =?utf-8?B?ZjJpK0VpMnNYTDN1Q0Q0S2gxOUlsZkZHRXhZWW5EMVdQSVY0VU5DWlViaWRv?=
 =?utf-8?B?ZDZEL1dUWEpGY0J3dUZUaXQzeHdUQWZpZHJyU0F4b3N2OWVGYUpoMlRIemd6?=
 =?utf-8?B?NTFQeEVVU0I2L0hERDV3VlhLbjdDUlUwSExOanNiNWVsS1ZIdU1LNHVydzRs?=
 =?utf-8?B?QkhTUWR0WTdxRzNVb3V2anJIL2oxK1lqSVprOFQ3eVlqalFxSVJ6ZFlXUVVm?=
 =?utf-8?B?NkJOM0tSeWdlU0NKVEtkZjlQTm9vRVc4Y0RMeTBBUnlFL1I4YjJSTGpOaDda?=
 =?utf-8?B?OUFkMStDQy9GNGJSbUV5c291U3NVSG9NSktHQVdDdGFITGdiZndCTUxQMjZH?=
 =?utf-8?B?d0h2UHhESzg5UnU3VUdHblIrU3c3RE9zQVdsbllwODlicjdZUmRwTUd6YnBY?=
 =?utf-8?B?elFCWGZFVjZVSk9KR2ZQaUZzaENjZjlmdk1OMENTckxocVRlNmJJQ2gwQ1F0?=
 =?utf-8?B?WHY4UTI5MmFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0h5Uk9RaXZXR1FKY2lkNzc2dGpITHNUeU1jY0VVaUdnd1ZydjNSclpnWm9l?=
 =?utf-8?B?MUZVLzR3WjVaRVdSOHEvS014Ymgrb2NkVmdYcUt3OEY4UlQ2dkZlb0JRdWE1?=
 =?utf-8?B?VFhHNklkQ0w3eFB0T0UxVHVaVUZ4dzlsWFNvNWJMQklhWVNVVmVBS0lNUUxz?=
 =?utf-8?B?RkhkK0JuZEZPRW9zblV4VUc1VHVNaW1aRHR2eUt1SHhLTm5YNUF0eDExOEU5?=
 =?utf-8?B?NWNpaUdITnBKMkFseE5rL0hWQWRKWEcxZUZweU95UC9HRU5NRzRXMzFJbTcz?=
 =?utf-8?B?RnI3NDg2VFJvMVdpeXkyeGYxK1h2RmVsSjJ4dHJUSy8yRUlBS0NxWXBFcXNq?=
 =?utf-8?B?bVF3RFlNa0hQZWJBTElUZFFDZFFXcnU4cHUvd2Jtb2M1VVlEdzBTMnFPaDlp?=
 =?utf-8?B?d25kTlJLd2tESng2YVBtTm1MOXpDK2tUVmJLY2txQ2RnVEp1MXFnSkR1NVM3?=
 =?utf-8?B?djhGeXlaZXdRdisxd050RHlZbkNxalZsOFJtNU1Kc2FkM2NzSXBIMklwc2k3?=
 =?utf-8?B?dUxkaEhONDhiVDdWREhycUlvWU9TcnUvZEtnK1h2dFF1Y3k4UnhEN3VmZDV2?=
 =?utf-8?B?SDczUHpzV2RNdVdZazMxU3ZpTVRJSEExRDBFRHNPeisydTA0ajNNUkd0WVBM?=
 =?utf-8?B?MnptT2RPZHJmakt2cms5bzMyc2F2eGFlREJTMU9pblJjbU02eHVQTi9VNWhJ?=
 =?utf-8?B?bjdHVVhUT29KVjIrWmFkWEF5dUxJbFNCcDNBQ01kaW94bmRMd1pTa3lCSWxv?=
 =?utf-8?B?MVI0aFd2VVptU2wyc3I1aCsvKy9uM2dRdkZJWUpNZ2p2ZXFEb0JwenUzdWYz?=
 =?utf-8?B?cnBjU3krbmpyV2pyNkZMT3hNQm1sZ0tPWUI5ZFRLbHBJQ1pYRFd5QWd0cVF2?=
 =?utf-8?B?RWg0ZHNwbmpNMTh6SXY3Q3hFTGdkZnJJT3FkbGg3MnJxS0xHbFJxK2tldnJC?=
 =?utf-8?B?YlI2WVlaZDZnNVZTRmFpYUF5MS9OQXJKUkQvOUp4ZVhVenNGUXJiMVFRVVhH?=
 =?utf-8?B?cTZBOGZTcGtZWm9CNjlneGxVQ3NwYkdRSXRJL1QrU2ZEeWdXVjBmVXF0MTkx?=
 =?utf-8?B?dVRSMjJPNzVCVFdHMjBaUGViMkFnL0RQY1QxY0hXUlhEdm1SVENlWnpVL1o0?=
 =?utf-8?B?ZjFrMWxZUjJqMXdKeTJKYXc1d0ZLZTRheFBGd1dQRjZQNUl0RGxpL0F2cjZG?=
 =?utf-8?B?NVdiLyswUG9yR3hiSVRVVTRmakY1RlVpanpwbnhhUTBDZFdEOVZWV1FjUCtM?=
 =?utf-8?B?MVk3VFBFWFRiRTFJVmg0TnZkdHRFdmpNeXlPUUtNaUhNUGZ2eU95WGpXdHVJ?=
 =?utf-8?B?OERmMDA5alp1K0lpblBLeS9VRGdZZmZ0S2lIdzVMODhsK0ZmUVlIbFRzMFU2?=
 =?utf-8?B?Tit6ZExSYlg0cTRnK2puRkN3cGg5ZTF6U2Q0REllaTlUMnZWaDB1eHFXWkZM?=
 =?utf-8?B?VjB2L3hZTldOUTR3Vk9NVE05ZU44MHZiL1VUUUFzWk1kWnNQdnFGTkVpcHFr?=
 =?utf-8?B?YmgyMzlRS3FwNE1aNTVvanZ3VU5xczBKbjBYeGZiVFI3YWIvN3FOWmJjMFdk?=
 =?utf-8?B?d29ja0RMdXQxR0s3UTdxbWdVbEVpbERqbTY0ZGUrMU9kaVl4dm1CSHl6NXAy?=
 =?utf-8?B?MWwxMzNIR2RiOFVDTTlFRHJTaXhMdjJtS1c2VVFmTEhuK2s3RytjaTJLS3Zj?=
 =?utf-8?B?Vzhka2dwV1htK1Uvb1dqQzdVcXdSN1pMNUFGVmMrbk1tUGxrS3k0YTVDSG1x?=
 =?utf-8?B?VHg3eUo1UmJEN1ZyOEk0OHJIanh0aTB2NGJCamprVFZhZkljaHRVOTZMZTBQ?=
 =?utf-8?B?UVVHcXpNRHozeE53dFZ1cTQxS3U5dzFFU0J3Vk1iTktNTnFsdEsrUUhxWEJL?=
 =?utf-8?B?RzJFSnNFZHRCcW5lSkdra2kwUlo4dmxHRzIvOWQwMVZINy9kU3g0bElQeXNw?=
 =?utf-8?B?YTZoZ3Q2VDVGQWRHNGVlQ1crcnB3azlqYTlNZUNHRDlsSWM0c0R4OFFkWjhw?=
 =?utf-8?B?amxxamlGSVpORFFlRi8yQWZ0ZzNvbFNJVUl0dThNUUhjRFZoZy80eVVWSHg1?=
 =?utf-8?B?bWtkM2I1M0tDbHZvMGhrSjdXa3BpT1hGRExxNDJ0THRTaVB4elNaV2U2TTNZ?=
 =?utf-8?Q?Msd7qAU78ImsMoAwY6rvmTIU6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ucrfRWVYuFe0xLqm35l1CqjCkmT3IdHKThNxoCzXjQTon3b1dELJ5BZfab+n01ia24q+5zCPXhO08358PitsSHF1uAAmZt61KfJjULfjYBmBRbM/hbgozOU3kaXi9X2ur56/dfLTn9HpRNY1wFjUIOL6XD1IMgD3uasN5XPT2dk/fgBqHttBKAYgrvc/3ZCWXn8T2KNswlzaZiL8J90lCNcmK/7mABKkD0lb9eCaJ0pUStcSDozR2WanuqgPmnsY2rGU11kd+A9ySW6x46bOwpFMbaMrCeHjd7eZBMNDiaabF15NWr2YuDdsbkojEodShZt1N7AUPlRKepisYgoY3wbBYrUx8ON3PVkNIu5VPg/Vqx+iURHcLS5HOHQq1wLXCkTIO46rnvubMdXrH0lveq4Ri4PjX8/fYYOQXL1uhYNLX0dC99Puv9RLuYRO/vUAZFlRQQKIhet9roGem+Ru7zpS2L01HaSBssBqV5aCxqEYHjOwofvL3oYGfnljoaaaGia4IpW7mS4YUj2y1e6FW/cQ+VckAZt246XD5k25ciogP1cIWo9RM8H3SqqoD5JKzTNarelAs0Aq0J0VHMZ6pMPWVNCzVzDp3GETcU7WWPs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd58c7fe-50ef-410b-82c4-08de0c5131b5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 01:13:20.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CO3h29rqM9T75PJswlFF9xMWlV9nZlA6zJk8LEgBT8lzrjEjAEsiQeg+lG9FF4YgnEvamlehZ8/ETjKm3ldbqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510160007
X-Proofpoint-ORIG-GUID: 1Ymx1NKRY_hhx2lDmm-iDK-ftUryqiWU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX7LzDVxubNxys
 +pleA6NoijAH2IE7ptCx0jDtEqCVX0kfCuxGk6icUNAT1suuvONHQHq2oMOA4R/Sus7RCKXCqrt
 nt1Xh+2VTaYvJPOsvOWc3AQFQJfYAkg18fqjoPYVadbft6x2y94hJCWL4jtDlNNPkmsfMg5E2Mm
 c8O9ye7tYBfjksMeCUXjoLguNfI17bvIku5bBWJWKwgTWM2J/MJnEyc0RYbejzr3PfgVZV1w2kB
 zr2WnoDml9zuZpqt64cDykiS9af9t8mVFnEc6YhfZJRakUkYlSl4b1s8mAWDZfeQxAMEkOfH+lx
 dEGxxkEoUC+7XGd9pOEe2bWzxzZTNvJshSUNeWpmoB1w/AzWYg7mXwUSmOAB3iAtWPwXvLQxNUl
 j/5gz5F3Mv0YTJ2BOjjDFUzO5cMT9IQU1PRLknqjUyY9nZVMRxs=
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=68f046bb b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=4TGv_ezsAtKJsSQttCMA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12092
X-Proofpoint-GUID: 1Ymx1NKRY_hhx2lDmm-iDK-ftUryqiWU

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 10/15/25 12:13, Kris Van Hees via DTrace-devel wrote:
> Most of the err.* tests can still be run, since they test other failure
> modes.
>
>
> diff --git a/test/unittest/actions/return/err.destructive.x b/test/unittest/actions/return/err.destructive.x
> new file mode 120000
> index 00000000..36e16002
> --- /dev/null
> +++ b/test/unittest/actions/return/err.destructive.x
> @@ -0,0 +1 @@
> +tst.destructive.x
> \ No newline at end of file
> diff --git a/test/unittest/actions/return/tst.destructive.x b/test/unittest/actions/return/tst.destructive.x
> new file mode 100755
> index 00000000..3157408b
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.destructive.x
> @@ -0,0 +1,15 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# Verify that the return() action can be used on the current kernel, i.e. that
> +# function error injection and BPF kprobe override is enabled.
> +
> +if [[ -r /sys/kernel/debug/error_injection/list ]]; then
> +	exit 0
> +else
> +	exit 2
> +fi
> diff --git a/test/unittest/actions/return/tst.override-getpid-entry.x b/test/unittest/actions/return/tst.override-getpid-entry.x
> new file mode 120000
> index 00000000..36e16002
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.override-getpid-entry.x
> @@ -0,0 +1 @@
> +tst.destructive.x
> \ No newline at end of file
> diff --git a/test/unittest/actions/return/tst.override-getpid-return.x b/test/unittest/actions/return/tst.override-getpid-return.x
> new file mode 120000
> index 00000000..36e16002
> --- /dev/null
> +++ b/test/unittest/actions/return/tst.override-getpid-return.x
> @@ -0,0 +1 @@
> +tst.destructive.x
> \ No newline at end of file
