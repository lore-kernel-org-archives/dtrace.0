Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2F34AB16
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768591931; cv=fail; b=X0e5N9+S1n0ValJjFNUZFTH8tQ1iIFF2wHQNB8lRzpUfPe3swKWEyjnAAHtUrCgGHZFMHbkobRXCNOqbGD3RkruSrQDm9zb9S/Y+Oe5412smlyRE/RI9nOFkTgyN7YdjESMXI2CHTh5sVHQ/9AwOyFwaRDAUFn6cs9UaqrPq2Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768591931; c=relaxed/simple;
	bh=5pvNeB8m+3FO9qrwJDhn+YW4L/3ky4D7AqYykG6zMNA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WBrJm6XtY7nFCOTdQTLnkjCU9imfOwsgSxmsvYcx/FNNWXV5pXNQ/+xCIyECht/WOWSaPg4m8chS96xUABj63VhpGWVBrVar+fIn0spLX5vXhtQnLSPBUki1UskKhE/oIcWlFkHHzzgqUEucEy4BMWOBvna3D5HnfX5+VFp9IQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qf4W/YsK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TPMwyGCT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qf4W/YsK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TPMwyGCT"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDQv8t1431237
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iCc5qHiS6jXch1iQhfTFfVRC0pZ6NY+lBo7DlIfuIMw=; b=
	qf4W/YsKwztzWoeyx/jzH5LbVFyx/BBpQAf/GtFeM4YO4MIdN2nLSzfIMi427MKC
	xA4rtyl6ve9E7s+jUWyK3SSKfPuN/0iykadCQALV9Vljm9CyPqyaUgQGHc5Tw8zS
	QlesQu9a6zi+zwkqTPcVKetKofGNsrZS+v68aci+ufA/0e7Ppkf8z/01bMEBkS3O
	xIIiWqLoMtwwlYmXRIZZqJk+cjni1qKqFGz6y6uQBDTRPlewU6bcy1kfHnEi/6yp
	vMQHW18GGQK8mJexU/c8OcS0qpfxrWe0JQz/YxS4EzG8+z/h1GQFaXcEqsIwH+m6
	8rq7Mak9MjsMGnFDuP6Olw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq5ajef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GJ3CxI023857
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:07 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7h2x0g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOnLRmDIij9b4uyBjE7Iu6TUPtBu8+Ozvjkg69oSG1gh305zI4+Lroxxvx2/x9ERy1qdr1/y/4hEDjKDLudpdxq3HPujUV5FFZUqxRl72nKV3HBYSRG88Da3+TRtDDGwwA/5Qk57Z34pXdIxplTQMNDA214vbJFyMgIKNqn3lSLuX73NoFZu3SRIGl7chCWe0MfxPZ3ZplG5/tyKxu/xtYOs0ljcIclTbIMq2Rg3xZIL2sP/ZZ+B5BHSkkFhLpnNbw6vwgPT1Vfwo7ezxmmaN9tXYOClJK6BwTTuf0eJBvNEohNxlG+xUdXKgBOadu2GDesALhKDYHnmLO55X3NcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCc5qHiS6jXch1iQhfTFfVRC0pZ6NY+lBo7DlIfuIMw=;
 b=XAEuZB4s6OdIhGGD3Mj5Hcvr16xjzAUdK86efyVCMm9anNBYEzzFYHeK94ZGI8L5EYykOdMfpTdbHpQni80W9jW40NYX6fgU8at7Fg+VVMaDHTsWSCsnNlUYb0JzOH4m6oBK7yMM6gG02vl/yUx8z56QC5UCfLkJtiKiS4iIM/nDx7HqYvs5AzHI/ApUr49/tDay22xHt7JpFEK/PKeDNhPwIf3XGAtcSOQXI4p3nUvZYU0UfldyTHvAxpMNdRilrFkajcB7mfhS5MFBaBdl5gvl/eFXHyD0to64sKR8XkoJXPpf74PdtJZy4TDxZT+RWTxV/bLdalu3tMWpTZmpeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCc5qHiS6jXch1iQhfTFfVRC0pZ6NY+lBo7DlIfuIMw=;
 b=TPMwyGCTGW08rrdpN8RVc8ImdswmVtuFLU757LPEIjaoVelJsKthwbOfuKsXkdn/OWnLm4pR5zz1m5PnrZXFB23+c4zQe9dwknzX0gSa3n3zsNP3CF96JvKPycG/8/3N/7lnqwmVekfEpC5a1Tgeviajm6XHwZ+x4szjtflBTUA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4264.namprd10.prod.outlook.com (2603:10b6:610:aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 19:32:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 19:32:00 +0000
Message-ID: <1db152b0-518a-d20d-2974-cd855890f461@oracle.com>
Date: Fri, 16 Jan 2026 14:31:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] Remove reference to missing dt_prov_rawfbt.c file
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260116185505.19610-1-eugene.loh@oracle.com>
 <aWqPxU3MCeHMbvEz@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aWqPxU3MCeHMbvEz@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: c5bc60ac-6d3d-43ab-555d-08de5535eb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vzh6Y3ZGWjBKSXBlVWw5SWF2SWtxQWgwTjdtQ0h6Zk53R3VzWVpGZlNnZzhH?=
 =?utf-8?B?VVh1ZzlBUlljWFErWmg1NDYvS0UrbWlIcDZ0RERWRXVwWkhFUFIyQ0VnaWJE?=
 =?utf-8?B?bm8vNXd0MnBhaUxxeER6Q1ZNZEVaY01MYis2TnNJVkVaT2lGc1dmRnE5Y3RH?=
 =?utf-8?B?N0h3elNJRTJoWS9CYlJqUTNjZTZCdHFiajE0cHovS0dTWjlVM0dKNmY2Qyt6?=
 =?utf-8?B?SG9ya1p0RkNwZ0F3TVpkZmk4cmlwaWhXd1A0L0QvTjNpMjgzSTMxeHFZSitH?=
 =?utf-8?B?aTNoeW5VMEpTTlJDQkZ5TEVxQUZKVGVaSHlBMVZrNVJHSUNNeG1kaFZWRkJH?=
 =?utf-8?B?TGgxSDdGY0I4aUp5UGMvVGk3VXRKTG83OTFwdktOQXBKVU45dFdvM28ramNF?=
 =?utf-8?B?OFVxUUI4d1Vua01VcXJEaTBBaFRkbEFTai95SVh3NVdiUVd5THdqd2MrSDFa?=
 =?utf-8?B?ZjB1dmtPS0ZscDBGTVZPN1lLNGlKNUFJQi9MYUFYTnVZaXJpckhtVDR5bUw0?=
 =?utf-8?B?MEp1c2I1cXd1T3N0OFFCVVd2d01uVHJjaTZzY1JyRkg3OXNuTzdjZ2lGWWdW?=
 =?utf-8?B?ckpaRnIwemlNbEZhZnhLSHUrdUduYkVPRU84U3EyT0FEaERMTUF5ZzVTNDNS?=
 =?utf-8?B?ODhmNHE3RExKck5YYVhxSmk3RGp1a1ZXNlFnaGp1dEJkNUpCTkNIYXNEeTJr?=
 =?utf-8?B?Z1I3NDNhZ0M4SE5NaUo2L1c3YkZldkJQenJzazZieG8rU0NVZkIwQjgrVjhV?=
 =?utf-8?B?WHM4VmRnUFFEYnZMc3NReGhJMVIyVzljM2Z3REwxbGRucWJ0RlpYWjUrQURK?=
 =?utf-8?B?Y09PamlkZyt6K2p6UkRPRkNKeGlia1ZOTTk3aktjV3J5VzdQK001VXhnSldD?=
 =?utf-8?B?eGdLcmlhSVNHa2xremxOeUk4cDNUOVFLaHJzTUVlWkJSUUVESitBcC9sbU9u?=
 =?utf-8?B?NFVhT0hqSXNRZ2dPWlovVjFNczYzOXYrZXpBMkRwbElKc1JZQ29WdkFTV241?=
 =?utf-8?B?bmFSV0lWdUlqUngrSVpOV0NNeWIwLzVnODhBU1QzSUNSSFZkbWljVTdBeDlt?=
 =?utf-8?B?SlYvay82VDc4SDJmcXloeDIxL25oQ2kyN0J6ZWtDWkM5eVhNTG9NenIvMmpT?=
 =?utf-8?B?M2h5TEVjVWlIRzk1WmJ6WFJhR2kwREpGY0pOb21COWY0L0hlNDlBYnN6ZzlW?=
 =?utf-8?B?d3NCWmt1OFJCR01KMWpxZ3JBNFRHbmdPOXRodUk2ZWZOK0lvMHEyMjBUVkJF?=
 =?utf-8?B?czc2Sy9KR3ZOOVk2UHU5dmpZUGh4cG1JcDlSUkgySlR4ZlV4bUw3S2l5N0Ru?=
 =?utf-8?B?U1pIOEI2d3plTE11UzBzekFFNTdudElGeGRqb2xDQVN3KzBYRjNXY21RQUp2?=
 =?utf-8?B?YTJrSW1aY24vdHFkbEtUQWhrTCtnZjVIN2hlQWpaNHZOUnlaVk5GMzg4N1Z2?=
 =?utf-8?B?Q0VqQWZMSlZwcmhjL3lUT1BSM281T1g5QjR0VHFkYjk2QXJxemxvcWZwQ0Nr?=
 =?utf-8?B?M3RWZ25lbTB2azhnTUMyTTJ0VXlLSkh5UW5yTk5odW9MN3NxYXBrSWlVR2d5?=
 =?utf-8?B?N1BMNG5kZGVQVkIyVHNCOUNGaFJZNmlScUk2R0NCY1pkTEpsaUZva3NXcnNQ?=
 =?utf-8?B?SVo0TStwaXVNWXlYZXNIdjFISWVFZE5GVVRuNzNDdlMwWTlYa1RsSzhyVmRY?=
 =?utf-8?B?WWZ5OHQwUk9uMC9BaEdZVENIVGsyanhmc080RUlpQktkTTFnWGJ3L2N1c0FM?=
 =?utf-8?B?SnBVWGl4dmRkRTVLYktkSFVuRDhiWDh1YUdwcXNvd2NQN2JyM091SUdyU201?=
 =?utf-8?B?Wnd6QzB3bjBmZk5lZ0U3NXB4SDJ2cXJTNDhDNTBJdlZLMHhzYUxpRjN0dlBH?=
 =?utf-8?B?L0NFM202dzl0VHQrcmdXQ2NTR2pmNCt1UGtUeXZQNFdQL2FLMEU2V0tkNHZW?=
 =?utf-8?B?OFgvcUVtNHpXaXRiY0NseGkyK0lLSmRlYUNlZWd6WVZWT2IwMlY3M0l6SkdY?=
 =?utf-8?B?b01iRHB3SHpvUmZLT1l5SUlKMnFmc1pvamlJajRjUGRIQWV3L1lqZ0l6ZVV4?=
 =?utf-8?B?SUQ5RERCMkhLenFnMjVzU0RiMnplazBpbE9kM3FwY2xCWFpVS3lLWWlBak5U?=
 =?utf-8?Q?0U51BJLMfInydtM/ptx8hOWg/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFYxTExjSjgyWE1JcVB1Y0twaDF2ZGFsMUhkNjhHVUdlUERxZmpuVXdET0Jo?=
 =?utf-8?B?OFpzZHR4bDlmcUQ1NUlodzEvb0N1WTZ5U1F2dmg2ZXJaUGUranhQSi9hVTJE?=
 =?utf-8?B?bUxjWTRtTExWMXN4SmZUOXIzektQaVl0RC92OXpmMVFFVVJ0bnpKM2ZyWkU0?=
 =?utf-8?B?UFE4WkM0TWMyTUpBdXVGZ0FwM2xjaC9lZHZNcWRLTllWRklhaVQ1ZmV2WkVB?=
 =?utf-8?B?RlpyQUs2ZEg2TWphS2s5cGZYTWx0am1wRXg0MG5weGdDaVdlS3Rqa0V0NDg1?=
 =?utf-8?B?UmtSTzdZdVFvN0RtQThIWVovVU0xekVjaFZ5dkZiUkpqdGlDUWRobTMwU1ZZ?=
 =?utf-8?B?UElXOGF0Qmh6ZmJoN0dwbVlsN2xLV3RXdVBHem1vOHRRRk9ld011aVZ0NE9Q?=
 =?utf-8?B?Y1BES2VUWjhCTlJwdS9lanczMzZEK0x2YnZsNEQwWmljeEREZWNYRGhBcXVz?=
 =?utf-8?B?YXRqR2R2OExsOEx3WGJBU2MrUWRBZ29oMmxCNTFaMFF2eWZmS0hReWVLOVBm?=
 =?utf-8?B?Y3lqaVhFdndiZnB2S1RJelBtUUJod0dRRmpPUEFNN2l5cExrajJJQ0gvUlFM?=
 =?utf-8?B?dC9wZkNyRVBRODhpZ1JvWHlBc1V1d2cwY2ZzNE9WaGxFVlNOdEhwUXhZYzBv?=
 =?utf-8?B?aC9lcGV4SlM2TTNsN2NmYUhENnNuVG9JOUNtNWFoZ3ZVdUxNdXFLMTZDT2Uw?=
 =?utf-8?B?bHJUNGNMNi90cm44bzFNb1RlVlpveExUOTNEejl5UzBWQW4yZGdXamgwcHpD?=
 =?utf-8?B?VWY2cDY1bXFVM2doSkVSME05b0ZqWGVSWTQvbTV4K2c1YVBqK2p4ejlOOGxu?=
 =?utf-8?B?L0NpL0NrY0xmWkJ5N2xGOUJEVXU3RjUwZEkzbFBPMXpwR1NkMkE5U1Z4TGhR?=
 =?utf-8?B?ek1sSDk0UkhQdmV5R2FVWEtIaG5JSCtjUUtXTHJwOWVtSy8zN3N5VHZzaStr?=
 =?utf-8?B?TXE5N3FwdTJyMlRhTHhEdDFCN2hKZXdVWCtHRnZRQk5wV3g2bzNXanlaOFFi?=
 =?utf-8?B?M0swNnFxeXBCTGVLdXZhdlNFNVExZnl2Z2VGdHRMUDVEZGg2YkpiUVZSNzZW?=
 =?utf-8?B?cU80VGt6THl6RFp5cWo5QUxsZ1Y3OURVSWFCUWNacXp0bmoyMGtmQi9GYURv?=
 =?utf-8?B?Y0ppc1RFY3dlbW4vZ3c5dmxPaEhWRFpreFZCR2RtVnI3STZzcVlrdkE5aGxl?=
 =?utf-8?B?emRaMGN6UXNnQnY4UU4yVlBMTU1UbFZUY09QZzJtOFBBeTZ3eXc3TGgzdThl?=
 =?utf-8?B?MGZzS09xczBxSURSaU4xdEY1eW5SckQxZEJzUzU4ZVBDUm5zc1hBUlJwdmFm?=
 =?utf-8?B?aVExcFI2TnhqTFZTNFZMVmhhT2dQRjZRTytNWWFSdTczc2lDSklYUnZvWEJj?=
 =?utf-8?B?QnZpNXVONXIyd2hYMy90bTB0c21ZdDBIdjI5N2d1di84aHVHUmpURlROdDJW?=
 =?utf-8?B?ZWVoRHc5RFRQRHh6NUhIWUUra3N2bnRIRVlUa3JWMFh4ZVo5Nlk0RWtqbjkr?=
 =?utf-8?B?Sjh0ajl5eEVSYnFpWGw2T3U4UmMrcnkyT3FqZld6S0tRelIxeU5IcDN2b1BJ?=
 =?utf-8?B?R3JXc0N6R2gwWnBkbUEzVDFYczJvU3IrZUxZejRLL3B0ZFhHNlJRUUVWNEFB?=
 =?utf-8?B?aHZOVnc3YWtMVWNPV2wrTW1sWW5JdlByL1k5eWxLTnUweHh4UGVlejI4ckJj?=
 =?utf-8?B?ZnRuVEMwMHBiL0M4Sy9pMG5OR1dBU0EwMVREd0lpb0QyamN2di9mK1FSSkJN?=
 =?utf-8?B?bm1GZ1VRK1IvV2NLTWgvUEx2UnV0cms4KzZDZ3Y2NDZhTHJMQmhHNmxjOGs2?=
 =?utf-8?B?KzhGZHNHM3hDYzVCbnUyVUtNY1piNE9VRE1Cd3hNNTdvdGpCY05RRXdaM1JD?=
 =?utf-8?B?WTQ0T2p0K3h4K0VyUDJUT2ZmNWkrMVp5RDBsY01NcVBTeisveWxHZGpnZlA4?=
 =?utf-8?B?NFRWaGVJUkVKNzgycVJzNkppdWJpTU5GU1FxUzNWMDhnMlZrMEhoSGVZTFRZ?=
 =?utf-8?B?c3Q5U2pxTU55MnRGZlpOQU1NM3ZmWWpBTmVMRnBlVGFNYzVVQU91eWRMZmY2?=
 =?utf-8?B?a2JXbFJnZGl3MmgzZi9SZjdteThQN1VjcFdJMTBCMzhzVFJkN0FPZk13VU9W?=
 =?utf-8?B?d0ZaZlNjT01EVXpGanhqRmhoRkdXUU5rSGNZZUtRR2JaM2xzb1V6UWt4UUh3?=
 =?utf-8?B?Z2dXT2hNNU83YUhnLzQ5UGIxQ3d5VFhsSFdlQTRRRTlvSm1Tei9BRGlVMUhN?=
 =?utf-8?B?UDd0aEgvajIyam5BeFZjbk04UFhYTFo3Ty9RZnJDd2xpTWJVKzY5WjR1VjRV?=
 =?utf-8?B?KzNwVUtVOXZBN3Y2S25aMGNkVEpyNWlIejJjc3FyaEJwLzllQUh5QT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FW72D1XyRlSdKcl3Zydb8PqLJHAsT5Uo6p0m09JTxRgEvE+T0t8nR9Vqu4P50vRHyyY97B0lYvNnIEQbh++4fur0OTnX04FUPzBbq+bakOZHiUHyyn4hrVWLolYP2MU7K3EOGj+12R85zHckaFKpF6KU9lqofL1xIy1N12pJNhI6WCog6IvGPuQ8UuyMc0yadSHpRTQ8I4Bbx4QeWZqCzndVLJsX0WkEwpyoFm57OFg5i8zkkI5/TFXDUd2viMcEMgd+6J6b/ZaJPWdz0lPuQgkpAYUbsMuztBhF1eBZG4geGbPmK6INKwK4ynQs6sCRaMeac1dy1h4T6bghWnbrxpEWkV4ksNVMl1ntfsSdd0W0+k0anY7dEousumZRNiGtOH/3TsE1Ee90brP/T5rstPNLT4xQM2oShDZHiNDGH0MAEJaciB2HYYYLBZnZeKcVNq1nFNohxnr0R3TVtzDJPUHWrwjLG3467VTlvtnda9hTo7rvHosvbibKmfQ8hRm2/omj9k0z4Og1Mx0yOu5hr9MQaomeZISJlIviyVF7GqhpsjdAl9TLWOIPIxeh+o/nCLVqC7nw08V4AxYjaRDVxN2Fs/J6zrb+Ox7Yzz8PGm8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bc60ac-6d3d-43ab-555d-08de5535eb3d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 19:32:00.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFIQN2NPFBxE2tW/mI5u256G0aGfT1XtUDBwLLl05q3vSQ5tBLZUhRr6qofKb4vQ+/bg+I+h8F+RG4XEB4HFhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160145
X-Proofpoint-ORIG-GUID: EO1vmJw5etaUIp_1CiRHLXIG3Q7fc0KX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0NSBTYWx0ZWRfX2Y2Slvk//KbI
 vmeSNV4vKWptP8BaxgWfoq+iCC0Z4trrWyMpHoSLX+UVVfZFzJFsO58OOqUn2chGmLfB2P5bb42
 l5a4TYv+RbIO8DWH4qKZkEiCwK11V+de2WMFMEMDzF8KdpuMB9UN/uQ5/RUFp4xqoEgyIdzvaOE
 M112f9dH0eYQywNyGKn35hsNroXIJlBMNm+TKh1rZBPQKss6xwH7pj6CicnKcNShSPrMIik+Qvr
 qQ8qru/T2uVnrIzmcUHDx9nt90yhyln5mr3Uvk4W1hCBq66zVCdNlC65bE/nH+jmJg9JlYzO14z
 CRg7XNSKFKNDsQklIP1bRGcEjP1e+DhEoccL0VSJUWhUG6UkoElZsJQ2+/dpL6rVJRLN+olGDXY
 fz0WMqhBWuXYWFxZ6LehN7TvMiQb5k1qJ8g4Py6JmxqSF3/wMWMdJBg/cii/EDVGseRWXnROQuq
 VOhaNi4qmdqrwOOfwGv1rF4Lam3BFKLdUzmwrD4k=
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=696a9238 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=CoIrgMtjJlQbnwlm9LAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:13654
X-Proofpoint-GUID: EO1vmJw5etaUIp_1CiRHLXIG3Q7fc0KX

Okay.  I'll post a different patch to replace this one... just the 
one-line subject change.

On 1/16/26 14:21, Kris Van Hees wrote:
> Maybe change the one-line description to not refer to a missing file because
> that seems to imply that it ought to be there.  Perhaps phrase it as:
>
> 	Remove obsolete reference to dt_prov_rawfbt.c
>
> -or-
>
> 	Remove reference to dt_prov_rawfbt.c which no longer exists
>
> On Fri, Jan 16, 2026 at 01:55:05PM -0500, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> In commit 0b7c5a6327 ("fbt, rawfbt: consolidate code to avoid duplication"),
>> the file dt_prov_rawfbt.c was removed.  Remove the remaining reference
>> to this file.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/Build | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/libdtrace/Build b/libdtrace/Build
>> index 90613e9d7..3a6c04664 100644
>> --- a/libdtrace/Build
>> +++ b/libdtrace/Build
>> @@ -1,5 +1,5 @@
>>   # Oracle Linux DTrace.
>> -# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
>> +# Copyright (c) 2011, 2026, Oracle and/or its affiliates. All rights reserved.
>>   # Licensed under the Universal Permissive License v 1.0 as shown at
>>   # http://oss.oracle.com/licenses/upl.
>>   
>> @@ -115,7 +115,6 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
>>   dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
>>   dt_prov_proc.c_CFLAGS := -Wno-pedantic
>>   dt_prov_profile.c_CFLAGS := -Wno-pedantic
>> -dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
>>   dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
>>   dt_prov_sched.c_CFLAGS := -Wno-pedantic
>>   dt_prov_sdt.c_CFLAGS := -Wno-pedantic
>> -- 
>> 2.47.3
>>
