Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF571279DC5
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755208170; cv=fail; b=GWbeh3VDvMBT2EtftudaNM7hPH8eiItO7zLPU/0Quwmxqrq7ziIn18FrZ1+ifAPnzWhiIkWdJuhk9WIsGnmubyGhysN90kMxCUcRTceqVntTeT5YsDBBrhxETM15QTp5f+NS2OstFLqv4RmKbRbUXYuN7sv1yLNV7G3jPKJfOXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755208170; c=relaxed/simple;
	bh=dg3p8T8kpbsU6RGdLl00iORGIsoIWwQf5ljpI8Xj5Ig=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=No47yShYhlGl6nhl55PcSKmKV/iPXisX4jCSypG2laGBVzwimNj3h8Q0xPyg0aHLE5P1qRX8rsKle+aLDMFufsBSmxDRti0EK+NENsIXlgnjFDQXUZXkNG0dPWT6mhSMldOV3Xk8mSWg9Pqs1H5vpAOKS81TRdcWJ5/Xb1fnMR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sM/f2Gkl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vG6qOq1Y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sM/f2Gkl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vG6qOq1Y"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfsYl018462
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fTJbQUClWRiC+26aCf5f3ScL5Q7XISocKQzLyd5B0uY=; b=
	sM/f2Gkl7cp8e6BMEzSvsLIhOafJJt6bB3f9NeeKPNv6KyaBreBK2FWxyTNRLZwa
	M/L89ThMnV9BXWljjus9VK700vZXsF7uZcuPmBTpprubTkJJivB2pzMEfOqX/qrD
	FCgF7+VuTVXf0nV+GNaQJCb7wjKiZdX2BnDn1JCBVTltk/7nyCU5rfyzNY2wUmSH
	tEDZVXWZgl9KuhvL2s8RmcGbT3qoAXlWxuhSX9q97gB1FV77AevZpmP2rOf66Crg
	XkP4mKkwPK+VdOhsJQxI7qGh5aJFbXGfVk2bcfa3GUVYjcCjXCZzcncnJeg4/xXh
	KMo3TM6P1Byy9cW8nFr6SA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchbgde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:49:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJqtH3017404
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:49:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd9ddf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wdi+7RiDmfdfkKLWAqXYyKDd2WztJ3ZZKCMG/BTZMAJ1kBqwcdyDe1ECuN6ZlYY9xvpOhaF4gkyc3ZHTIaiBQgxAixwKRI7Lp/uny289rK6e6Q7OYdnnuT3AfQPbMDGvpAkvnbUvhGMazLL9Kc46Yzq5UCcQQiJvuZs12FtUzvttP+Q+PfPX26hcXAHGhmFzsesTlInJajqfxftv6UQIgsUuaiboYhgtBSMrrdUnclFYt2mW1xnMx0wpXSTHhp/w99pxQ17WNlTGyxAP6ownck3zS6Q08ulkFppr76FjqtW/s88yPdslsTKuJaHxFpp5O6JSCBhjxNecIGgkzCPnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTJbQUClWRiC+26aCf5f3ScL5Q7XISocKQzLyd5B0uY=;
 b=t1cZ0eiKl60XZ9yrsXpgpsiX8M0ZGjUSxDT6n9sUwqL16KLdqet5putt/KCY++/RRVyBpdT9T78sElw7YUXxvKnTdOhjTGGIbsepKkWmd4lr/Cm79qfUqikDtFvUJY1GTLtSK15/Pzj/UVA+sxEbVIByAAwwUcmNfdPTiRxcF0t4qu4Gk0tGyV8nSaoUGyo5YWgMV8Tx681J7RsKPlGt5xKvEDx5c05skqXHAc7VEmaryM9bV6WT+SUxzYPggi4k9hZP/b24BxA7DvLMTN9PnLaUJkinayX/KPFQmsG8S7MJvbaNQcKZYrmyF8te0P44Gh9m7GFamN0Mqh/N/Hk2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTJbQUClWRiC+26aCf5f3ScL5Q7XISocKQzLyd5B0uY=;
 b=vG6qOq1Yo51ZmZJfd18GckYunxHZUiAeJrnoNRkMoLrInvrx5liUXTRPWtDLEjpLroTLkWHEQBY++5RO2jnS7gYhd0KFnwuEVtpBgtle0MiRit0HscMXy+9FUoo+5hzLJ8XsZad+6WzJ59oF+bM60y2OIWvwH+ffskuTl7JyUJ8=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH3PR10MB7496.namprd10.prod.outlook.com (2603:10b6:610:164::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 21:49:21 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 21:49:21 +0000
Message-ID: <44ee1611-6608-c24f-56e5-d53e9a6b30ed@oracle.com>
Date: Thu, 14 Aug 2025 17:49:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 5/7] string: ensure string size is
 handled correctly
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56727D85238D96378BB2542EC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <aJ5JIVdM3rPvtN70@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aJ5JIVdM3rPvtN70@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH3PR10MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 36be8041-9b2e-4d28-bb1b-08dddb7c6d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWl2UXl2dlVpaHZjMWpaVnVxRTJmV1UxbEQ1YTg0TkZHY0FQWVhMa3VBNXVs?=
 =?utf-8?B?eHlmdU9NN0NtS1Evb1ZJYm5ZVnJQa3dCZkN1RldoRVF2ZmhKb3hKM1ZIeXNZ?=
 =?utf-8?B?UnFRc2dJZzNSRVNock5GWVcxQ2VCakpYQVhsN2lFd0RwRCs5RXBhc0pNeWls?=
 =?utf-8?B?ek0vemlpSlBlQ2VaNDN6Ky9qNWRkQlQ2d3piM25GTE9kd2dOR01PNEdnYU41?=
 =?utf-8?B?bk1vWVY0NkxvN2w3TWdSMmR6ZGtkcXRzcXVsT1F1ak45TTZYdkpiZncrZVFo?=
 =?utf-8?B?Ni9RRmhEWEJoVVovOHRZeWkxV0lZejZiLzl4dG1yQk9zZjN2TExXNXVZalpz?=
 =?utf-8?B?MUNaTzIvZkF1ekY2Nk05NHRjYW04K0VxWm5sRjNDOWJuRU1CcjBacFhwOVNr?=
 =?utf-8?B?N2xlVUVoRzhyRVFtTjUxcDhQd2lEUGJFSDZQeVNBSW56ZGtZTDhxWXJQQWU5?=
 =?utf-8?B?dm16WVVzNXROVW1TZzVxTjF1NUthZnVRREhFMlZ5ZGtZM3E3a1puRzJvODk3?=
 =?utf-8?B?UmFGTHdYQi9rUmR1YXZjRS9kSUFMSXhkajNaV01aeFhpTWYrTk5oeDhzbDdY?=
 =?utf-8?B?N1ZBTk9JK0g5S1hndmZZRTZqM0hleVB0UDlpeUtwK09RUHJ2UkNKVHU2Z2pL?=
 =?utf-8?B?Njl4K2plcjFoMWhPRGwwZ1N3a3g1d1V3dFFGUlBQMGhUUDFKQ2c5MVVXWGJ6?=
 =?utf-8?B?ZExnMXZyY2IwTWlRZEFzZEI3WUlMajZCR2RGVWJWUHhTQU5Zd20wR0NrT291?=
 =?utf-8?B?U1B6aCtUbjl2YndkVS9TZTdXT25HczVPc2VTT1AvRjYxeHp3Vndwa3hNdytN?=
 =?utf-8?B?RGM1TUdsT09PSFVmQ3lMWmpuS3dERUtWUytxSUFBK0w4Y1FBMUJ2cnBtRDlF?=
 =?utf-8?B?UTBrdW5kbzE3TDBKVkNQTWdSL2dZZEVyY0E0NnEvLzh5Z29jczB6SGk0RDFk?=
 =?utf-8?B?OE52elpVaDJWS09haUlDZUo0TTZLZFNZUEV0YVRyclJjNFhoNHlWbHlvamxG?=
 =?utf-8?B?NVhKT3JiL1c4NkE3L1Z5U3dVaEhoN2k0UkdROUVEajhHU3VmbWpCMmtBOUVY?=
 =?utf-8?B?Y29CSUhDU3Z0Nnl3dlRpR0d2dk1VQTV4Q3V6Q2hhM2ZOTHFsSC9mWEZmdU05?=
 =?utf-8?B?azJjYUsrVk9pUnZGb2ZGK3JHdkZYYWtjREJUSmVuQUxXejh6a1o5UHVhUGtl?=
 =?utf-8?B?bjdXVHRqRktJSDZZSEVybDhoRHQvaDMxUkttUmRIRHJteVJVSXIyU1ZQdis5?=
 =?utf-8?B?RXQ3N0dDR29Zd3ZQdURieWdSQlh2TG42ZW9nOFBONTBtY3JxR1Z3WXJJb01h?=
 =?utf-8?B?Y1ZsQTVybzJrU0twTVJaSmdZOGRueXhOeDFvalBQRkcyY0hOMm91ZGFRTUpJ?=
 =?utf-8?B?bVNlajFWMkx5RzZIRlhXOG9zQVd4enpuTUVtdFRhcHp4c1I2WURBQ3pPcnBB?=
 =?utf-8?B?eTg4b3B3SEpvZXRqRGxYa3NKbitjTG90Qk5kT3hzMWQvbXYvdXlTK3dGa0lW?=
 =?utf-8?B?QzVscmtoMWJLL1FQbjhjcCtsaVpyQk9HYmtmUm1vTFRqODk4UEVzQUVLU2Jq?=
 =?utf-8?B?dTltdG9zM1k4Kytid0VWdG5KYk0xNTVsTVFwTUxQQmkwOExFNFdOamNBeVlQ?=
 =?utf-8?B?Uko1Sk85Q21uUWlnU2RON1JiY3hZcHZ6L3NSbFdoeXUrTFZjTUp0NCtqTHZ1?=
 =?utf-8?B?RHRnMnlqcU8zdnNzV3djQlFua2dOcmxkZ2RGZjU3YTV5OUNtSjJJeDdTN1Uz?=
 =?utf-8?B?c3cyZE0rcjBUU1FZNWtDSStjRVVoUFV2aFJHUlVPMVdxOFBRMDM4U3hUcHQx?=
 =?utf-8?B?UWxPYXJLaC9jcE9wOUhJSGYvUlYzN2hZTGJaL2taREx5bmtoQ0R6SlZYUUtt?=
 =?utf-8?B?VHlWYlRudVhJS0N1QkxjNnIyOCsxK0taYk50Z3pDNTdsdzU1aFE2RXk3Nm1h?=
 =?utf-8?Q?rblHgXbj3Dw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTY1ajJoOHVYZGYraGVWanhWbnhhdUZqT3hKb1VZQTA1NHJZVGVWQUUwcGZG?=
 =?utf-8?B?RUprWUk0R0NDc3Z5YmtNRGpxQWpZRGxMRW1taTlONlRnUkErS0ZIRDVxZ1Fw?=
 =?utf-8?B?S0d0eXlYK0hIdE0rNHk5alpBQXVORjdIei9jQm5sU0JiUmVBekY4S0RFdEVk?=
 =?utf-8?B?MEl3VDZ0QlpjeWxNTU51QzVtUFFOZUp0T2Y2eG9MSnp6NUllNVNLbGlBbFUr?=
 =?utf-8?B?NzNGaWJXcDJNZnBkWVJsOUY1ajM0VmJuS2ZnaG5nZytLY0ZBa3Ria2xzUjMz?=
 =?utf-8?B?SjNZODY0OXZ3dExxVGhGQ2l3OEZPMW1idm85UTZPNmJrQVpNcHZNUi9udzEv?=
 =?utf-8?B?Nk40NGVXOVd6MEZXN1Z3aDRnRnh2Rm44empTUkxwRU9DRGVSVnNoNGxpNXlq?=
 =?utf-8?B?Nklady8rY3lneGVFTE9IMm84aHdkNVFwQWFyMWtPS0NIKzh6SzlHZk9tVm1E?=
 =?utf-8?B?SkdmTDZCRWhlUno2czVOclFUVkJ4RjNMSnZqNVdtd3piV0trNVRuZEhCNzB2?=
 =?utf-8?B?WDk2dnZrUlMxMzdweGlnOXVqZnNSU1dtYS9TYTRybmZtNVc5V3d6WEVrT1Fi?=
 =?utf-8?B?Ni9ESFhXSXhuMnlET3hMVE05bkZYZGxDekU0czc1SUl4Nzl2WS9WZk5XcHkx?=
 =?utf-8?B?TWROUnI4YkdGeEV6b0c5VTkxVkhab0xsb2t0SjN5azJTVnJxWW9uMzhjeVAz?=
 =?utf-8?B?VG5BNDgwbmluVTJqN3B0UW1aSGxOVENWWVhmL3RaNlg2REplRFQ5RnB3dGJN?=
 =?utf-8?B?TzVuR0ZsbUN0N2FIOEJ0cmovK1R0cytwV1NaTzVlbk5ESTRPU0JTRExrVFJo?=
 =?utf-8?B?R3JpeW1meDJOaFFFb255a3hjR09heERZblRWYmFlWGxWUjVwVHFNUDh0ekpD?=
 =?utf-8?B?UXdqWXVpR2dkemJ5TlJRdmdYTk5zYTN0N3lEVHFpTWhDWlBwdTZMQWxaUkVk?=
 =?utf-8?B?NndaU2t1VUFER1VCOG1sQ28yT1J1d05uRUQ3ajZKZ3NmMlVkTk1mRFRsYmg3?=
 =?utf-8?B?MWtCd1hVNld0aGEzVVppcWc0OTlzckZVUjBmWm5sL0FrdmpSaWlmWDZvYm5F?=
 =?utf-8?B?RkF5VVFmSXBWZnZFT1d0Umh4NXVvNXdVQUdPbXVySGdQZVU3aXdoTzlzdGh3?=
 =?utf-8?B?eWlTVkhMTGlSbUZZOXZrQkNkMHpIZ3BjdnZNdGQrS1gxbi9KTyt0LzI2NWNw?=
 =?utf-8?B?cHF3bWVGeXN1WDdzekVWMkxqaFR3ZkE2UWV2RnpvTjBSYTRzaFI5WHhxMm9V?=
 =?utf-8?B?RmxxaVNXUVNzOHdGUUJXWmpaQjdzNXRld2lIYnhtRk1BTmhXWkU1eGlPajhC?=
 =?utf-8?B?MG04RGFhRU5SZXJ6bjdyOFVOR2ZsajcrWW4wRUw2bjdIM2hZL2ZGV0VwYUlR?=
 =?utf-8?B?SGxxWEVoUHhkeit4Uzh3SXFva05PU25hTlhWTmRLSUd5empvQmJ4VUMrWWxU?=
 =?utf-8?B?MjFiM3AxVmVRQWUxYTZpSGdZU3NESlY3cnRQcFZJSFdPNkJSYVhoQllhTlFo?=
 =?utf-8?B?NGN3RW1nemNPNkprUCtWclg3YktoSTc2VHhkZUhWZ3BtRnhXY2tocjRTS3Qv?=
 =?utf-8?B?cFdCTUV2dE82TU5nL0F4eVRvbWUrUTJUM0cwbFNjaitmMVlpekRjb0REYytk?=
 =?utf-8?B?N2t2SU5KcnYrNGZ6WHRhdUNkSkQyMDdXTUtDWElkZW9mVkI5V2JLdmRxOHBI?=
 =?utf-8?B?ZmJzSS9tVnp0cjF4VGhKM3hJWVhOc0xFL0tiSE5BaGZwQTdwMHM0S255TE96?=
 =?utf-8?B?VTNlaVFTUWtNNWFxd0xDdVNvN0VoREdyK2xqSGVnOW5NV0YzdTJOdURZb1ha?=
 =?utf-8?B?cFhKOXZ5VThHeWwxUm04MGw0Z1kydzJzdXI5ZWk0SjV2TFZKRytELzl2c1hx?=
 =?utf-8?B?dGZrcHZFZDQ3UGEvc0hXNEZ3M2s1Uzhud3M1aWhUa2FRZTFzZzhRcUNySjN4?=
 =?utf-8?B?d0JORjEzZ1hWTXB1SlFJcklHY0MzMnlGYmN4RXNRZG5Ya01xRHNnZjIxc2RV?=
 =?utf-8?B?UFZLdERxTzg4OHV4bnhnM3FNQWJBTkFkaGtQTy9XS2Y5dWQvOW9uakltcDJ6?=
 =?utf-8?B?WXcrdWJwNDZEYkJqSDI5SWVPK0VxOUMrY0tONU5kclB5aEIzSDlTYlVaVlRG?=
 =?utf-8?Q?yxZJe0pe8O07KqfFEqbF1l7/W?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eIss5d2cmB5J+1RaKUHWNw9Pj3EWJ/6ozbK24WgGLm5SOF8Til7nfbiD8yKQSBzoskMinE3FK4ob2JHaEMDBudYKB4wWMTA2mCMMgKtIVZknw0oTWUsPWCzc7tz0JOqV6zMTwNEAWfenWEmql3h+r67mUJGIymZAXsTcX0f0jUngkGNucbhkfLuGWlvZ2hz3SgEf2rD+zXiLN0PherG+UCwmbTgfwk5PlUkCQ+xk5HxB/o7wkMGFwixKXLOnrChZ5GyEf7I+YPYfl3jLtQdZsR0UMqSid7ljWAQ6uSJPic9yt0xqEdmkWxcsSiFLn4ZT6wR4RBLQP6WTEg9toa9Iojn6HzUVwJ4zknL4pViCHC0Y5L+WzJdxiwhB4l13NoP3Vb8jGdxj2h0Jg69wxpDi4DGWy4/qWaATxfWWuiFeI8618qxp1iKnjDH0S+U05rmuPcuuGzfy2YKHQ7zfY1uZdeAtj7PN0dGim5qaJXxv4f7IArMXTOCykGb8W2/8/xMUW8ef3X7LBv/tk6NeP1Cd+C2CwBct3pHxYPNBXn+cAjWByT7XqViwszRsOfqbQFhYjLwsybfyjuKNBAGrTBLQ9WUgznD4cJrXqzp3OOVXMFg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36be8041-9b2e-4d28-bb1b-08dddb7c6d23
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 21:49:21.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3d2ez3ZhT/cY56bifwRHmJK1xXvMcJgbDKFmia3UwuPAUQke1nhMkMecvjcHxisFHY6JtA8KDiOYTXoqYRLKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140187
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689e59e6 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=RROptiEOarcMO5hLBOQA:9
 a=c4aZcHS9YNZo4y4X:21 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FOD4ZVi2GU8493AbiWmY5jiTAV1pJznw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE4NyBTYWx0ZWRfXwcu/oOc18mRA
 EbQ6s5C7Y8CBXIn0FVRjMRTZyBlda36KXyQiwbN9jO5W45rqEpGEVBUKspwVjD0XxHJuH49n6XS
 VX6TOfOJ9tYZEb4OU7QuFpVHZ1f5f5qjE9b78YoSaU5mEQd+AZpVeBRUrAm78voS36klnywkuZb
 ygWGAaUt5xIigPCFUR2x58PXOZhppSakk3T8Njbvguc+gYtBbbDPDIMRuobbfoz4H/0rRnJOT4r
 CLtcb0RvZq9dF4lQY9YQv7MXY0fSRVAIX+xbj3m2IMx6AMb+PMFbkCdm4UfT+8IX56Ahj/KaTPp
 fYsw+u6Xba2KeZ8LYh0iI3V+C82bsXuh+qD/ZA923Fk73S1SSnQX6zt4IV+4bIr6LqPVaiF4TEJ
 lq3qy2LfWGDBxNbwcvLH7NfrETN4+BKC1ukuHb5x98NcBlY9gTPVP8EyfCuPHu6v5XRqXDmK
X-Proofpoint-GUID: FOD4ZVi2GU8493AbiWmY5jiTAV1pJznw

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/14/25 16:37, Kris Van Hees wrote:
> Apologies - this is v3
>
> On Thu, Aug 14, 2025 at 04:33:37PM -0400, Kris Van Hees via DTrace-devel wrote:
>> A string is defined as a character array of size strsize.  Strings
>> that are less that strsize in length are terminated by a NUL byte.
>> This implies that the NUL byte is part of the array and therefore,
>> strsize is indeed the size of the array and not the maximum number
>> of characters in the string.
>>
>> Tests are adjusted to reflect this behaviour.
>>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> ---
>>   libdtrace/dt_bpf.c                                    |  4 ++--
>>   libdtrace/dt_cg.c                                     | 11 +++++------
>>   test/unittest/codegen/tst.str_const_length.d          |  2 +-
>>   test/unittest/codegen/tst.str_data_size.d             |  2 +-
>>   test/unittest/codegen/tst.str_store_var.d             |  2 +-
>>   .../funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r      |  6 +++---
>>   test/unittest/funcs/strjoin/tst.strjoin-bordercases.d |  2 +-
>>   .../funcs/strjoin/tst.strjoin-capped-size-2.d         |  2 +-
>>   .../funcs/strjoin/tst.strjoin-capped-size-3.d         |  2 +-
>>   test/unittest/funcs/strjoin/tst.strjoin-capped-size.d |  2 +-
>>   test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d     |  2 +-
>>   .../strlen/{tst.capped-sizw.d => tst.capped-size.d}   |  2 +-
>>   test/unittest/funcs/strtok/tst.strtok_long.d          |  4 ++--
>>   test/unittest/funcs/strtok/tst.strtok_long.r          |  4 ++--
>>   test/unittest/funcs/substr/tst.substr-stored-len.d    |  2 +-
>>   test/unittest/funcs/substr/tst.substr-strsize.d       |  2 +-
>>   test/unittest/funcs/substr/tst.substr_nonDPTR.d       |  2 +-
>>   test/unittest/funcs/tst.basename_nonDPTR.d            |  2 +-
>>   test/unittest/funcs/tst.inet_ntoa_nonDPTR.d           |  2 +-
>>   test/unittest/funcs/tst.lltostr-short.d               |  2 +-
>>   test/unittest/variables/tvar/tst.str-size.d           |  2 +-
>>   21 files changed, 30 insertions(+), 31 deletions(-)
>>   rename test/unittest/funcs/strlen/{tst.capped-sizw.d => tst.capped-size.d} (94%)
>>
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index ddf703ddd..31781ac9f 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -910,8 +910,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>>   	while (buf < end) {
>>   		uint_t	len = strlen((char *)buf);
>>   
>> -		if (len > strsize)
>> -			buf[strsize] = '\0';
>> +		if (len >= strsize)
>> +			buf[strsize - 1] = '\0';
>>   
>>   		buf += len + 1;
>>   	}
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 88dddb087..cd9e7f4e9 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -1741,11 +1741,10 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>>   			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
>>   
>>   		TRACE_REGSET("store_val(): Begin ");
>> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
>> -				 arg);
>> +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 1, pfp, arg);
>>   
>>   		/*
>> -		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
>> +		 * Copy the string data (no more than STRSIZE bytes) to the
>>   		 * buffer at (%r9 + off).  We depend on the fact that
>>   		 * probe_read_str() stops at the terminating NUL byte.
>>   		 */
>> @@ -1754,7 +1753,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>>   
>>   		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>>   		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
>> -		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize + 1));
>> +		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize));
>>   		emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
>>   		dt_regset_free(drp, dnp->dn_reg);
>>   		dt_cg_tstring_free(pcb, dnp);
>> @@ -1765,13 +1764,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>>   		/*
>>   		 * Pad the rest with zeroes, if necessary.
>>   		 */
>> -		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
>> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize, lbl_ok));
>>   		if (dt_regset_xalloc_args(drp) == -1)
>>   			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>   		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>>   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
>>   		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
>> -		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
>> +		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize));
>>   		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
>>   		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
>>   		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
>> diff --git a/test/unittest/codegen/tst.str_const_length.d b/test/unittest/codegen/tst.str_const_length.d
>> index 1c58ba13d..bfdd00a2e 100644
>> --- a/test/unittest/codegen/tst.str_const_length.d
>> +++ b/test/unittest/codegen/tst.str_const_length.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=5
>> +#pragma D option strsize=6
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/codegen/tst.str_data_size.d b/test/unittest/codegen/tst.str_data_size.d
>> index a928e8299..c93174a4f 100644
>> --- a/test/unittest/codegen/tst.str_data_size.d
>> +++ b/test/unittest/codegen/tst.str_data_size.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=5
>> +#pragma D option strsize=6
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/codegen/tst.str_store_var.d b/test/unittest/codegen/tst.str_store_var.d
>> index c14714c01..cfd37404f 100644
>> --- a/test/unittest/codegen/tst.str_store_var.d
>> +++ b/test/unittest/codegen/tst.str_store_var.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=6
>> +#pragma D option strsize=7
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
>> index 5e7d49b03..8090daad6 100644
>> --- a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
>> +++ b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
>> @@ -1,8 +1,8 @@
>> -fe80:7060:
>> -1080::808:
>> +fe80:7060
>> +1080::808
>>   ::1
>>   ::
>>   127.0.0.1
>>   127.0.0.1
>> -::fffe:7f0
>> +::fffe:7f
>>   
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
>> index 253b2d6ef..1ac5ffd12 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=5
>> +#pragma D option strsize=6
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
>> index 625c786b6..44a6acd88 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=6
>> +#pragma D option strsize=7
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
>> index 52718325a..d2982a70b 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=6
>> +#pragma D option strsize=7
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
>> index fe5b323f7..b54fd2f29 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=10
>> +#pragma D option strsize=11
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
>> index a1816f975..2b700a5a8 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=14
>> +#pragma D option strsize=15
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/strlen/tst.capped-sizw.d b/test/unittest/funcs/strlen/tst.capped-size.d
>> similarity index 94%
>> rename from test/unittest/funcs/strlen/tst.capped-sizw.d
>> rename to test/unittest/funcs/strlen/tst.capped-size.d
>> index 4e473236c..676ed185e 100644
>> --- a/test/unittest/funcs/strlen/tst.capped-sizw.d
>> +++ b/test/unittest/funcs/strlen/tst.capped-size.d
>> @@ -11,7 +11,7 @@
>>    * SECTION: Actions and Subroutines/strlen()
>>    */
>>   
>> -#pragma D option strsize=5
>> +#pragma D option strsize=6
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.d b/test/unittest/funcs/strtok/tst.strtok_long.d
>> index 1fbe415dc..254a65485 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_long.d
>> +++ b/test/unittest/funcs/strtok/tst.strtok_long.d
>> @@ -9,8 +9,8 @@
>>   
>>   BEGIN
>>   {
>> -	/* 256-char string ending in "XYZ" */
>> -	x = "_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
>> +	/* 256-char string ending in "XYZ" (255 chars + NUL byte)*/
>> +	x = "____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
>>   
>>   	/* check whether the last char of a long string is seen */
>>   	y = "a";
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.r b/test/unittest/funcs/strtok/tst.strtok_long.r
>> index a752554e8..4b172ca1b 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_long.r
>> +++ b/test/unittest/funcs/strtok/tst.strtok_long.r
>> @@ -1,5 +1,5 @@
>> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
>> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
>>   zyxwvutsrqponmlkjihgfedcba
>> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
>> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
>>   Z
>>   
>> diff --git a/test/unittest/funcs/substr/tst.substr-stored-len.d b/test/unittest/funcs/substr/tst.substr-stored-len.d
>> index 97d2b0f61..fa3e5337c 100644
>> --- a/test/unittest/funcs/substr/tst.substr-stored-len.d
>> +++ b/test/unittest/funcs/substr/tst.substr-stored-len.d
>> @@ -13,7 +13,7 @@
>>   
>>   #pragma D option quiet
>>   #pragma D option rawbytes
>> -#pragma D option strsize=13
>> +#pragma D option strsize=14
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/substr/tst.substr-strsize.d b/test/unittest/funcs/substr/tst.substr-strsize.d
>> index b4d0cc63e..04eab4297 100644
>> --- a/test/unittest/funcs/substr/tst.substr-strsize.d
>> +++ b/test/unittest/funcs/substr/tst.substr-strsize.d
>> @@ -15,7 +15,7 @@
>>   
>>   #pragma D option quiet
>>   #pragma D option rawbytes
>> -#pragma D option strsize=13
>> +#pragma D option strsize=14
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/substr/tst.substr_nonDPTR.d b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
>> index 9d847ab6f..3e10af08e 100644
>> --- a/test/unittest/funcs/substr/tst.substr_nonDPTR.d
>> +++ b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=13
>> +#pragma D option strsize=14
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/tst.basename_nonDPTR.d b/test/unittest/funcs/tst.basename_nonDPTR.d
>> index 4f93685f7..cecef827b 100644
>> --- a/test/unittest/funcs/tst.basename_nonDPTR.d
>> +++ b/test/unittest/funcs/tst.basename_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=14
>> +#pragma D option strsize=15
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
>> index 500c53e86..f079c7ef4 100644
>> --- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
>> +++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=14
>> +#pragma D option strsize=15
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/tst.lltostr-short.d b/test/unittest/funcs/tst.lltostr-short.d
>> index 969045667..65a5714c2 100644
>> --- a/test/unittest/funcs/tst.lltostr-short.d
>> +++ b/test/unittest/funcs/tst.lltostr-short.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=7
>> +#pragma D option strsize=8
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/variables/tvar/tst.str-size.d b/test/unittest/variables/tvar/tst.str-size.d
>> index b4ab6ea2b..bd8aac132 100644
>> --- a/test/unittest/variables/tvar/tst.str-size.d
>> +++ b/test/unittest/variables/tvar/tst.str-size.d
>> @@ -12,7 +12,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=4
>> +#pragma D option strsize=5
>>   
>>   BEGIN
>>   {
>> -- 
>> 2.45.2
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
