Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2135A397
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178612; cv=fail; b=gWimDWZPUUGtZSQSq1u5ozUxI8Cdn+VV3ByvJz0d383bR3Mw43yX6bqbRDgoTqHJi/dWbor3f0cVFpBG8p5iyEgnVQXvsk58fHZkUsphzjOAeUx/LnSSEFi4oQiiSHmS8/KtS7JJUdbzIBVrH9SIURkjykmTTHm3YE5ryZRtA70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178612; c=relaxed/simple;
	bh=TKeLNq+I6jGcEXt1wQ3dNqbkkSoGAg95+YvSq8esYFw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QmvkTtwOgeVbCD9M+Bw6JUo8QntNy6bcqFhHWpkB6bSp7A1PutyiuyM3StEej9jqBuWaATxucRBm0OIu5sZy5kE96JGjMNg6gkIhjw+7oIs6oUPlZFsmFxWO5++nvYrVtR+odgAqty45tc/vj0QIP0K11gG1To59ChLn8oLFD5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m+/IEEOz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mSY4dG6s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m+/IEEOz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mSY4dG6s"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIjMbW1720159
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 21:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=9DEocNi0bXnglSZ2
	rZfKvw5Hqi1gBLS9W53S0zLJaz8=; b=m+/IEEOzYQX/zpTSDvLjkCSBA9iPTmIc
	AQHNSH36xcm0uoV/fMBJkhjbcWulKZGiPWXKu6umg26nQYaEaYNhbmLnccpyPDYd
	M67A6N+xW6SqwOHqHvQiW5aMz6h+i33A/zY8QVHnuK+45YiTX5tkLNs3NUcBwYg0
	DVFAs5AMQQrGDYAxT3dr/iTNDo1McbD6ctkDRQBB3+St3dFvmPQoha49Iltqzm1Z
	F5z3uL4kvW63q2Nx52Bv3ObxpWAUMSp9yU0BXHHFX3n7KUFdQwTfgbeSH/ik0Ejx
	WtPYG0pnDik0BOWydbOxFMDFVIM2wqbpKPEqf83t/PBxJUTl1yj7Jg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cskyp3qu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 21:36:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62AL0KJB014821
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 21:36:47 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4crafexh8w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Mar 2026 21:36:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAvz8YYSJYSko07YQgQ5HJsVo3g7gzc3N8l7limga6BJm8PCsiZHrAfe72hIA7jAuYSRhMb1wMYHwrrwf2Pzc9pDWCk+aG/0TOgepAde1pVhtWKQtG/WhVICm23H73fT2J/hMrYSKbVHrmw4vhQq67psFdUez1eqmH1ojn6p9+peom3Ltzh9vHWull47S9AEhnCGnVSS6cBdK/eEwccMDb/H6QBsoMJ/Ea/MiO2es9OX1HWOBM+orFvoRgc6G7Dxah6F2I3Os5vO4nJMuC7GH0qK7Pzj+PFffo9bzpVt0SIGNvYsgiRJNOaXO4pxhy1g59/arAYWOay/5S0lhNSydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DEocNi0bXnglSZ2rZfKvw5Hqi1gBLS9W53S0zLJaz8=;
 b=EZ1dGnJNm1qtrQVryGJkk9VURLoscPWbG3lWyfsvjLHTdlWxtOj7vfUG/lZ4Ok/IBxEdzP8BjGvXW8ZVSgGUE1V8PpCSUMvQe4nAksOVJOJAC3M0GMZ/uYY1X0aPT2lNwA1uf8XuzhvReQ3Ou4YSWn7Le3cUzp0IIfOcAiz12SQqTmUk+U3qVfDRM/sswqlbPrLOb9tny1ZqiIm7n+OCa+U/sBPjFgOsNA3SEXtTjW3tTjqP6gO/l8dMErbTwirnPmWcbLR7jo5zNtGDkcjKmyCtWiNt2/s++NHzUURMpkL9bbMVrcp/gNpmRp7QVASqbJ3ILwlN/J9wsJLUqUEAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DEocNi0bXnglSZ2rZfKvw5Hqi1gBLS9W53S0zLJaz8=;
 b=mSY4dG6sVGwNTUb/ANNHs28ZMIBcDltRCZQnY7W7f0bq5vmzCtQSMaUlZpAmtSuRScstrDjg+8Mzdka9NGeVcLcDo7C64G/tfbyBguEMfJXLoN3ejeoMKekLyQJZ6CUe2Nzjs198aEFud9llPCng5CaL0O5iwL7BKt/CikSs8Kw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB6716.namprd10.prod.outlook.com (2603:10b6:610:146::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 21:36:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 21:36:42 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Remove spurious references to Oracle
Date: Tue, 10 Mar 2026 17:36:39 -0400
Message-Id: <20260310213639.20660-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:610:52::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3c9a78-f34e-4288-7d07-08de7eed1ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|18002099003|56012099003|18082099003|18092099006;
X-Microsoft-Antispam-Message-Info:
	ZHKhchUbArQnR5tHBdvi6klibNRvc47wFOwRP6HOTmafos3uPhF0YOd5hwftgH8Qigy7IFvqMruNjOzfvf6pgS6oXfJdUFObpKV7QeZtym36RjzB3SJUSGKRb/RCLCbi08XqOpdXQbRzCpjpdqEQbO5Qzfe50vcPSwkEvceclomzqGd1eM/t7jzH62hSz5tVRsVcxve8fjGaUpRaBNupLyThPD41/PZJp81nwmA3W1t2fQpXVMoeCo2tBe1JCGqZ3jscQ014UPMdt06yZmju9fmx3xTzX2U1FxJWKYcSFrzML0URRXYe++hEjcqS+e3IItVgmZv59aJ63Vgjq7LcG7sEPI6sZYEMVsILlreKAKZ79/aR4rtzxObG2JyF/YCoDQ4vn+CL8823mII82UrnU/cEcg7jnOQWSX+vamO4RKfoCOZrs9QGD9G+uDnhIvcMpNwIfVwELAWkMarE6rzFhzXeCBEQ2igqHLO1spDhISd+fZiXCqHxo5+Uupi0GGO++QkcmlXW5g3q6wQrgrUAUg+LvtdHgzdEagGZ9TUbSh23Su8jtlN1b+Z1cz0M8r8RgUi5T0DPLpxREROkHGWf23dbDwv4JIvXGZ5Y8+g1IuNAkPkNXE9wRtCVoQ3F6j6OjyRjANmDgXbia5BJk862xcx9mFtqZpgiLiMtWyn6XrQeQbUrqbDFy0QGujtpUk8WAiarOZE6NobP5Mtfx2Bwa5pVr3P3mm4iSnFm8oG7Q7ltNnIQNvWXlPsg2Ashoois
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(18002099003)(56012099003)(18082099003)(18092099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTRML1J0M0lqNjEwV3pCdkJPMzlHWkk5VzQ0UXErN2ZCanRNZWE2ZkdXSnJ2?=
 =?utf-8?B?KytWL2trTnBkSDBycHArZG9IQUZDMHJINVdQMitVTUZNQTRISWJNRHludVhI?=
 =?utf-8?B?QUt3UVJaMXpDdWVGdTdtWUdTczhmYStpc3lzdkNvSWt3L1JtM3Q3OEVyd21p?=
 =?utf-8?B?MlRDQTBGbnNFU25QZmlaZHdsTGdDQjFiMFhaTjRjNm9VOGxTakxIaFgxNkdl?=
 =?utf-8?B?MTlGcGY1YzE0dldram9TVTFVQXZMMTNpUWV1OTlVZklyOVpUSzRwMHBud1lE?=
 =?utf-8?B?ZWFQeCt6OVN5WHF1OXcxNFNrYUpWaHorTEpGUGw5Z08xVnM3L056VnYxc292?=
 =?utf-8?B?a3MvSzhJZ3h1emVYQ3Q1aFVyQXdzZVVBZWw1eXdJalVodTRNOC9WMmJOeXNs?=
 =?utf-8?B?Sjk4T2lrSGhTRjVndDU3RDdGRGlCTEVsbHphT1luN0NEOGxiRGtYbk40aDd5?=
 =?utf-8?B?endPeGIrMEhnbG9CcHIyblJZOE1XRUdiN1czTkZrRERUdTUxb1h0dlBPZ1U1?=
 =?utf-8?B?VDgxOFJ5aFE4bCttK0N6dTN4aDE1dldGeEhEMXlCSU0ybkM4YkVnV1NVWXdy?=
 =?utf-8?B?NFVNbFpkTU9ZYytscUdFUUxzZGNYTzgwQ0NQeXNwNVdJKzdidS9abEJRVlQ2?=
 =?utf-8?B?S1grR1VUU3BJSnpid251U25oVGNBb242aXJmOWJkVGU1Ym1QaWw3R1lmVHlX?=
 =?utf-8?B?RS9ZVW1aUUdST0k5NlJ3Z1hTNlNudW9mNjcvbVlwdHZhL1cvbmtRaTdVenRC?=
 =?utf-8?B?Nm9tdDR4bHBwR1hja3N6TUgzK051TEtxVGRESm14Mk91Sk9scWV6Z2huOWpL?=
 =?utf-8?B?SjhFUWJSVkplZC9qbVhoYktWNkF4bTZZem1BTU0ycERONGJEUGw0WHpEekUr?=
 =?utf-8?B?ZjhwYml1dzhIdEc2TzVvOHhGZzgyVnZWMzA5TXNOWWlabVJ1a2hsTURDdHQ5?=
 =?utf-8?B?cFhPZ2o1cGg2U3Z4Nm1vZ0JOVjFKRFhNTENpUzB1Q2NDRU53dmxiNzBEOHdw?=
 =?utf-8?B?amM5UGpvNncrZnpFSzJJUEcvWnFmdTVCY3U4eEhxcEhYWnFWNnpmSTAvbUNa?=
 =?utf-8?B?KzM4bXBxWE9pT3VCQVM2bTMzU0tzM1BWd1dicHRlRWxrbnFCWEFia3FuQmlj?=
 =?utf-8?B?UUxBTXN3NHMxQ3huQ2diSW1OUmg5NTYrRHRhaVZZamttbjVCSEhXOGxhbjhN?=
 =?utf-8?B?MUVqNGtIdlNIZmN6UTMybnBwM3BJR3NuU2JvUk9PWnJhcm80TUc2SWlRbzNG?=
 =?utf-8?B?dmprTysrM1BLaEQwVUZRQVF5YXJFQTJtV3VUYjMwR0ZteGFzS2hkSVl0U05W?=
 =?utf-8?B?enYyNnVpU0FSOWlvSlBKMitCT3BmMXhmekhSQVNlZTZyc2tJb1pEM2R3a1hq?=
 =?utf-8?B?YTVXbkVKY1ovRGlWUzRsc1Y4bGlRSUtLNHlObXhic2lYQnZJRmpNTkswV05i?=
 =?utf-8?B?ODA4eWEvTEY3Q29EV3B0TTE3TGV6QUZLZTVCK0ZXMlRzRXZJYU9IRTdZQll5?=
 =?utf-8?B?YmVzUUJZQkxlT1d2NzhIUVhSWUZaTE1oekE3Umgvc2l6QmVEUzRNZG5TU2Rh?=
 =?utf-8?B?ZXlXWXovYVFYZC9wczdEeGRoZEo2NjVOYWNQMlFBSFJrZGVnV0ZvVTk0Mktj?=
 =?utf-8?B?SkRHWkp3Yi8rMStyNnE1Qk5sMTZTQWhUQks3bENDbjhVVDVrZzNtZ2UvUncr?=
 =?utf-8?B?V0E1UzdxQTB2b1luY2s3K1R5VlJUc2twK0l6aEsyQWhRZlcwNTAyTUJEbXAw?=
 =?utf-8?B?QndUTTVCdkhGNUJVd1V3MWdmWS85cFZsMlNtOUdsQU95VkZXMzF6R1lnMk5q?=
 =?utf-8?B?WFNQQTg1NGt2K1VmMlh6S0UvV1ZnZDZvU3ZkUWovdXpyaVdVcXN5NEppN0dB?=
 =?utf-8?B?cUMxQmRpb28vZU1BZ0llOEowdUNtTUlyOU9CSXZpbUkxVzlUZHJmODJUeEZm?=
 =?utf-8?B?Q1dPUzAreW5vdUhRK3kralIrTExrYjdBVWl2Umt6U2lhSHIrTnFQUEZmbm5x?=
 =?utf-8?B?aDN4S0Z6SGxpNXFyb0Y2SlhGQm1ySlVPSUxqT2tWbzhPZ3RSUngwaUNhNlBQ?=
 =?utf-8?B?VlhyRWRMd1lXd1hsenNBWGRIa3JKRndDdVU0ak52dmhHMnA1MmxRdXlZb0hF?=
 =?utf-8?B?TzJ2SlYvRWRZN0JaWDQyb1VNRThCMTY0dERxSWhxZHRsQWtrYzZPbzVDdmdp?=
 =?utf-8?B?bDlQdHN4Z09odWlLcnN0QzBQeks5bGJhUG1WVnVaRjFETk80K2prMEYrVW5u?=
 =?utf-8?B?NCs4Z2N2aXNHQlplMzhkQWZDaWlDVlg4bEM2T2o0MnoxWWtKcWM5ZVB1ZVRr?=
 =?utf-8?B?elVGakRVS0I2T0xOMWg2NFNtRkg0UzhTUnozWkpvaFYvbDJiRlUrQT09?=
X-Exchange-RoutingPolicyChecked:
	Xl2Y92ITOAW1vnIgHiLupVUo+HMlu8SuLYn60B9cgu87Fc1kLShQclZta+FYGBQcPSwTHvddHml1lCK65Xe377m78nVfB/N2AbWb+izPt47bpwGOEm5X/KCBziKnSXHlu24kRRb8nIgMcACS9MBXPuiPZs8w8WYssPitrXSn4z4JBbCMm//3YH+btTWXn87z03ftQo/SC7H0N7tOqNTx9HjSZX5vPYUvFw1DVmsAXBfAhTMibil5Zpdy08Fg4KJT2rXP+wEdg9fCWk92RJJX39e8Bp6OAF94j/sQKtPpE7UF89Nhq+/lmjvj/Vpzq5Bf7SSaLKEMWTpLP89RWrhpfQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4V18PtvUXtqa9RA3CX2+Ix24PKzpTVpxUoIz9X/3ma8j4N2P4sAtMpYX5a0uxaw/DOUIe7uTdcZok9/KnnYx5m6Y1i4Hjh30Kzlp8tLTTfwzQD5FLhvZZl+7cTO0CqYNiaINrNHmlz6IkVZmUvw1nFmrN5Z/8YSNTACRciQROSkMxByqju0+t5GIWfgwRDnKRqDtbaf6Nzs1PTHiOStTzAN+Oyz9zTY85XMN9KX0aWBSXVcldsvWfeKQl/b/yu21F9ykisc491Ym3HY0dHxmWV1Rrkv48uHKyyMvXdAQCqUIhypuCnC5DjY6hHyBZ2AY/w5VCVGXZ6QS+RfYmLc2rEPmt0/tPWNZ5Vuvv8RDOhAtM/DT4W0wbhS4PMEnALDp38x1shMcS3VOS/pRr2MwLXkxaqF0zB7O4SplwF8R5Gevy5oTR4NKLUt9IwGofvlxz1T/vWvo2pwWle5QCNN/d9jXCM61A1HvuIjKFNkfYUNLU1vTyol9M7D4Hj7hNKC+l/AOOtkE4Cj3EV9u6AvUkzNt+wPMWc+ZCnutZhq6fe0eIHVo1Vum2CP/rTMzJxYm3B5VdK1fmR34nu/44RpSkhTsPdYRiQ4CiXk+musgqoM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3c9a78-f34e-4288-7d07-08de7eed1ea6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 21:36:42.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiAqLLDDWuGQUH0aAlFxIPhA7ctwM4llxkvn+GfwL5qJHxGtdMwbXJRFE//KD1IL2SY4TGUKTJFTWGaKzihKXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100183
X-Proofpoint-GUID: 1h49n1xAN56MkGcZ1nhEQX76jBaLjft-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE4MiBTYWx0ZWRfXzdb7fTqJOjlA
 wEyIDS+0JHe46DGjJcnnoFdCR56sYXBHetFFpUeZizeQ+0VH0wHTpFBlRxLkwXiyIPiYivjo0Sd
 RQ9K1wT1tqP+LHJTAix7BH2HGZAqYtW5ew368OvoUjJA0YS+2TZodSEDD1XDX2/w8inqgwIyFx3
 YD5z87ns3PtCCeI1hLMrQuCOBRrg1m6DHZJKEP/nmcTrcRgJ8zxHVFKTLgtN6BLbTsUX2+0TjyV
 CwxuvKop/6IpWhAvh2c6Lg1eG0jhDGKXbwTrueVOJhIV8PBoknxj/GJx7pLooNHtK8W00kNAEb7
 oLT/aJvcbjU/HKMQcjLQvCNrXaXTMlv18f+WDUMiygcVy5vfcMfcOKH3uFICYvJXXZPqnE4Jx0t
 C4KZ3oty81wExG9J+qRtBkTEsVyyvbfcaCPFj4/ZRePal2N2iwVw5mGT0/2EO+7SweOOmx5F4g1
 jS/75oOy4D+aLQHZlHxtUUBcRqIRwLSbv0+ddwvg=
X-Proofpoint-ORIG-GUID: 1h49n1xAN56MkGcZ1nhEQX76jBaLjft-
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=69b08ef0 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=uBp0-ScQ8ps6x_QrXzkA:9 a=5xYgSrfLL2HhhPCI:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12273

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 README                                        |  2 +-
 cmd/dtrace.8                                  | 22 +++++-----
 doc/tutorial/1.IntroducingDTrace.md           |  4 +-
 .../2.TracingOperatingSystemBehavior.md       | 44 +++++++++----------
 .../3.TracingUserSpaceApplications.md         | 16 +++----
 dtprobed/dtprobed.8                           |  6 +--
 libdtrace/dt_prov_io.c                        |  2 +-
 libdtrace/dt_prov_profile.c                   |  2 +-
 llm/README.md                                 |  4 +-
 llm/llms-dtrace-complete.txt                  |  8 ++--
 llm/llms-dtrace-short.txt                     |  8 ++--
 test/unittest/options/tst.strip.sh            |  2 +-
 12 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/README b/README
index c7f704ed7..3dd487695 100644
--- a/README
+++ b/README
@@ -1,4 +1,4 @@
-Linux DTrace v2.0 for Oracle Unbreakable Enterprise Kernel 6.
+Linux DTrace v2.0.
 ------------
 
 This is the official Linux port of the advanced tracing tool DTrace.
diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 1f2d48a07..778d431f4 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -1,9 +1,9 @@
 '\" te
 .\" Oracle Linux DTrace.
-.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
+.\" Copyright (c) 2009, 2026, Oracle and/or its affiliates. All Rights Reserved.
 .\" Licensed under the Universal Permissive License v 1.0 as shown at
 .\" http://oss.oracle.com/licenses/upl.
-.TH dtrace 8 "22 Oct 2014" "Oracle Linux" "Linux Programmer's Manual"
+.TH DTRACE 8 "Mar 2026" "dtrace" "Linux Programmer's Manual"
 .SH NAME
 dtrace \- DTrace dynamic tracing compiler and tracing utility
 .SH SYNOPSIS
@@ -39,7 +39,7 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
 .LP
 DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
 .LP
-The \fIOracle Linux DTrace Guide\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
+The \fIUsing DTrace for System Tracing\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
 .LP
 The \fBdtrace\fP command provides a generic interface to the essential services provided by the DTrace facility, including:
 .RS +4
@@ -57,7 +57,7 @@ Options that generate program stability reports
 Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
 .RE
 .LP
-You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIOracle Linux DTrace Guide\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
+You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIUsing DTrace for System Tracing\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
 .SH OPTIONS
 .LP
 The arguments accepted by the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, and \fB\-i\fP options can include an optional D language \fIpredicate\fP enclosed in slashes \fB//\fP and optional D language \fIaction\fP statement list enclosed in braces \fB{}\fP. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
@@ -68,7 +68,7 @@ The following options are supported:
 Set principal trace buffer size (\fIbufsz\fP). The trace buffer size can include any of the size suffixes \fBk\fP, \fBm\fP, \fBg\fP, or \fBt\fP. If the buffer space cannot be allocated, \fBdtrace\fP attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fP property.
 .TP
 \fB\-c\fP \fIcmd\fP
-Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
+Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIUsing DTrace for System Tracing\fP for more information on macro variables.
 .TP
 \fB\-C\fP
 Run the C preprocessor \fBcpp\fP(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fP, \fB\-U\fP, \fB\-I\fP, and \fB\-H\fP options. You can select the degree of C standard conformance if you use the \fB\-X\fP option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fP.
@@ -116,7 +116,7 @@ Specify probe name to trace or list (\fB\-l\fP option). The corresponding argume
 Specify the \fIoutput\fP file for the \fB\-G\fP, \fB\-h\fP, and \fB\-l\fP options, or for the traced data itself. If the \fB\-G\fP option is present and the \fB\-s\fP option's argument is of the form \fIfilename\fP\fB\&.d\fP and \fB\-o\fP is not present, the default output file is \fIfilename\fP\fB\&.o\fP. Otherwise the default output file is \fBd.out\fP.
 .TP
 \fB\-p\fP \fIpid\fP
-Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
+Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIUsing DTrace for System Tracing\fP for more information on macro variables.
 .TP
 \fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
 Specify provider name to trace or list (\fB\-l\fP option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fP option on the command line at a time.
@@ -134,23 +134,23 @@ Show D compiler intermediate code. The D compiler produces a report of the inter
 Undefine the specified \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB-C\fP option). This option passes the \fB-U\fP option to each \fBcpp\fP invocation.
 .TP
 \fB\-v\fP
-Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fP.
+Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIUsing DTrace for System Tracing\fP.
 .TP
 \fB\-V\fP
-Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIOracle Linux DTrace Guide\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
+Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIUsing DTrace for System Tracing\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
 .TP
 \fB\-w\fP
 Permit destructive actions in D programs specified using the \fB\-s\fP, \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options. If the \fB\-w\fP option is not specified, \fBdtrace\fP does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
 \fB\-x\fP \fIarg\fP [\fI=val\fP]
-Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
+Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIUsing DTrace for System Tracing\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
 .TP
 \fB\-Z\fP
 Permit probe descriptions that match zero probes. If the \fB\-Z\fP option is not specified, \fBdtrace\fP reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fP option) or on the command line (\fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options) contain descriptions that do not match any known probes.
 .
 .SH OPERANDS
 .LP
-You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fP.
+You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIUsing DTrace for System Tracing\fP.
 .
 .SH EXIT STATUS
 .LP
@@ -187,7 +187,7 @@ Options set this way are overridden both by options specified via \fB\-x\fP on t
 .BR ssh (1),
 .BR dtprobed (1)
 .LP
-.I Oracle Linux DTrace Guide
+.I Using DTrace for System Tracing
 .
 .SH USAGE
 .LP
diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
index 3236edf82..dffca17f7 100644
--- a/doc/tutorial/1.IntroducingDTrace.md
+++ b/doc/tutorial/1.IntroducingDTrace.md
@@ -60,7 +60,7 @@ you can choose which method best suits your needs.
 
 DTrace is a comprehensive dynamic tracing facility that was first
 developed for use on the Solaris operating system (now known as
-Oracle Solaris) and subsequently ported to Oracle Linux.
+Oracle Solaris) and subsequently ported to Linux.
 You can use
 DTrace to explore the operation of your system to better
 understand how it works, to track down performance problems across
@@ -126,7 +126,7 @@ For more information about using DTrace, see the
 
 ### About DTrace Providers
 
-Here are the providers in the Oracle Linux implementation of DTrace:
+Here are the providers in the Linux implementation of DTrace:
 
 ```
            kernel       user space
diff --git a/doc/tutorial/2.TracingOperatingSystemBehavior.md b/doc/tutorial/2.TracingOperatingSystemBehavior.md
index b3445ab6d..edfc89c01 100644
--- a/doc/tutorial/2.TracingOperatingSystemBehavior.md
+++ b/doc/tutorial/2.TracingOperatingSystemBehavior.md
@@ -9,8 +9,8 @@ investigate what is happening in the operating system.
 The `proc` probes enable you to trace process creation and termination,
 execution of new program images, and signal processing on a system. See
 [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the `proc` probes and their arguments.
 
 #### Example: Monitoring the System as Programs Are Executed (execcalls.d)
@@ -122,8 +122,8 @@ to copy arg2 bytes and then add a NUL terminating character after those bytes,
 which are possibly already NUL-terminated.
 See
 [Pointers and Address Spaces](../userguide/reference/dtrace-ref-PointersandScalarArrays.md#pointers_and_address_spaces)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 ```
 # dtrace -q -s syscalls.d
@@ -149,8 +149,8 @@ Use a conversion specifier such as `%-4d`.
 
 See
 [printf](../userguide/reference/function_printf.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the function.
 
 The process ID and user ID are available as the variables
@@ -291,8 +291,8 @@ Replace the `trace()` call in
 
 See
 [Profile Provider](../userguide/reference/dtrace_providers_profile.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the probes.
 
 #### Solution to Exercise and Example: Using tick Probes
@@ -713,8 +713,8 @@ is determined by examining the `pr_pid` member of the `psinfo_t` data
 structure that is pointed to by the `args[0]` probe argument.
 For more information about the arguments to `proc` probes, see
 [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 The program uses the value of the child process ID to initialize
 globally unique associative array entries, such as `p_pid[childpid]`.
@@ -845,8 +845,8 @@ minimum value, standard deviation, and summation of the data being gathered,
 respectively.
 See
 [Aggregations](../userguide/reference/aggregation.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for descriptions of aggregation functions.
 
 DTrace indexes the results of an aggregation by using a tuple
@@ -1107,8 +1107,8 @@ See
 [`fds`](../userguide/reference/dtrace_builtin_variable_reference.md#dt_ref_var_fds)
 and
 [`fileinfo_t`](../userguide/reference/dtrace_providers_io.md#dt_ref_iofile_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for more information.
 
 The [`trunc()`](../userguide/reference/function_trunc.md) function
@@ -1133,8 +1133,8 @@ number or `"total"`.
 
   See
   [Sched Provider](../userguide/reference/dtrace_providers_sched.md)
-  in the
-  [Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+  in
+  [Using DTrace for System Tracing](../userguide/index.md)
   for a description of the `sched:::on-cpu`
   probe.
 
@@ -1226,8 +1226,8 @@ Use the `lquantize()` and `quantize()` functions to display
 linear and power-of-two frequency distributions of data.
 See
 [Aggregations](../userguide/reference/aggregation.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of aggregation functions.
 
 #### Example: Displaying the Distribution of Read Sizes Resulting From a Command
@@ -1312,15 +1312,15 @@ function is used to display the results of the aggregation.
 
 See
 [IO Provider](../userguide/reference/dtrace_providers_io.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the arguments to the
 `io:::start` and `io:::done` probes.
 
 See
 [printa](../userguide/reference/function_printa.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
+in
+[Using DTrace for System Tracing](../userguide/index.md)
 for a description of the function.
 
 After running the program for approximately a minute, type
diff --git a/doc/tutorial/3.TracingUserSpaceApplications.md b/doc/tutorial/3.TracingUserSpaceApplications.md
index 1d9bf69f2..1121a583f 100644
--- a/doc/tutorial/3.TracingUserSpaceApplications.md
+++ b/doc/tutorial/3.TracingUserSpaceApplications.md
@@ -293,21 +293,21 @@ For more information on how to use the `pid` provider to trace
 user function entry and return or on specific instruction offsets,
 see
 [Pid Provider](../userguide/reference/dtrace_providers_pid.md)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 ### Adding USDT Probes to an Application
 
 In this section, we practice adding USDT probes to an application.
 For background information and other details, see
 [Adding USDT Probes to Application Code](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 To get started, you will need to create a `.d` file, as described in
 [Defining USDT Providers and Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 >Note:
 >
@@ -431,8 +431,8 @@ and a false value if the associated probe is not enabled.
 Next, you will need to modify the `makefile` file.
 For step-by-step instructions, See
 [Building Applications With USDT Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
-in the
-[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
+in
+[Using DTrace for System Tracing](../userguide/index.md).
 
 #### Exercise: Directing makefile to Re-Create the dprime.h File
 
diff --git a/dtprobed/dtprobed.8 b/dtprobed/dtprobed.8
index 2ebe89ccc..046b2a480 100644
--- a/dtprobed/dtprobed.8
+++ b/dtprobed/dtprobed.8
@@ -1,9 +1,9 @@
 '\" te
 .\" Oracle Linux DTrace.
-.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
+.\" Copyright (c) 2009, 2026, Oracle and/or its affiliates. All Rights Reserved.
 .\" Licensed under the Universal Permissive License v 1.0 as shown at
 .\" http://oss.oracle.com/licenses/upl.
-.TH dtrace 8 "22 Oct 2023" "Oracle Linux" "Linux Programmer's Manual"
+.TH DTRACE 8 "Mar 2026" "dtrace" "Linux Programmer's Manual"
 .SH NAME
 dtprobed \- USDT-tracking daemon
 .SH SYNOPSIS
@@ -61,4 +61,4 @@ and \fBdtprobed\fP, and can change between releases: on upgrade, \fBdtprobed\fP
 .
 .BR dtrace (8)
 .LP
-.I Oracle Linux DTrace Guide
+.I Using DTrace for System Tracing
diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
index db768bb72..7e2238564 100644
--- a/libdtrace/dt_prov_io.c
+++ b/libdtrace/dt_prov_io.c
@@ -591,7 +591,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 done:
 	/*
 	 * Note: DTrace does not currently support the use of fileinfo_t with
-	 * io probes.  In Oracle Linux, there is no information about the file
+	 * io probes.  In Linux, there is no information about the file
 	 * where the I/O request originated at the point where the io probes
 	 * fire.
 	 */
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index 60da094a2..de7e02120 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -224,7 +224,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 * TODO: For profile-n probes:
 	 *     dctx->mst->argv[2] = elapsed nsecs
 	 * The documentation does not say elapsed since when?
-	 * From the legacy port to Oracle Linux, in dtrace/profile_dev.c,
+	 * From the legacy port to Linux, in dtrace/profile_dev.c,
 	 * in profile_prof_fn(), it appears that we have a per-CPU variable
 	 * that tracks the expected time of the next profile probe.
 	 * Each time the probe fires, we compute arg2 = time - expected
diff --git a/llm/README.md b/llm/README.md
index 2992bf7bc..117783f92 100644
--- a/llm/README.md
+++ b/llm/README.md
@@ -2,7 +2,7 @@
 
 ## Overview
 These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.
-They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
+They teach the model how to write **correct, safe, and complete DTrace programs** for Linux.
 
 The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
 
@@ -39,7 +39,7 @@ The goal is to let engineers and administrators generate working D scripts in na
 
     -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
 
-    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
+    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Linux.
 
 3.  **Start asking questions in natural language**
 
diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
index 818e0086f..07275cb9d 100644
--- a/llm/llms-dtrace-complete.txt
+++ b/llm/llms-dtrace-complete.txt
@@ -1,4 +1,4 @@
-You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
+You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
 
 You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
 
@@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
 WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
 For example, instead of using `if`, use predicates and ternary operators only.
 
-Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
+Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
 
-After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
+After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
 
 DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
 PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
 
 ## GOAL
-Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
+Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
 
 ## PROGRAM STRUCTURE
 A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
index 19d5f73e5..7430f4ba5 100644
--- a/llm/llms-dtrace-short.txt
+++ b/llm/llms-dtrace-short.txt
@@ -1,4 +1,4 @@
-You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
+You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
 
 You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
 
@@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
 WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
 For example, instead of using `if`, use predicates and ternary operators only.
 
-Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
+Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
 
-After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
+After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
 
 DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
 PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
 
 ## GOAL
-Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
+Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
 
 ## PROGRAM STRUCTURE
 A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index d25f76af3..a6762cfb9 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -64,7 +64,7 @@ fi
 $objdump >& out.default.txt
 
 # Check results.  One can imagine a more stringent check -- like
-# seeing if the string "Oracle D 2.0" appears in the default case
+# seeing if particular strings appear in the default case
 # but not in the stripped case -- but here we settle for the stripped
 # case simply being smaller than the default case.
 
-- 
2.47.3

