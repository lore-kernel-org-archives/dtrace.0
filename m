Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AECA346FC6
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516596; cv=fail; b=j8JBIj5jQrbhkmDpzMa2kfMPOcs9K4q8t4Re5FWn2fThIPJMLACj4mVtbGMznpWmTKTeW9gBhJVfanfknWfQnWi39+2aXwtdRoIyx4mmA8WBRbKuDlP1fWj/GQI0GkfgEuQHey/PIyupmA4QEAORFrif7U4ziYvqP7m7ubLLOpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516596; c=relaxed/simple;
	bh=CQ16A0nqkdcOKx9hirDXu6V607Dr+WD6OTSJ34UuJps=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=FPu7PnEhoP+kzMKw5FADlUslbnB1bRY1hkBj+KcNS98lYzHsrd5vGdt8Oi5wONm8q1lewA1NUNOl2TVXR+Z1nJaIvtaPicbFWRPcFyuRGwVWxq82hcOTeNMSAdCsvJasqTNHjEDMt4bULhsiwWwyBwA4TtqU0nzjOhWRn9VCRIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FGrTNDbk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gpUCgc7u; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FGrTNDbk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gpUCgc7u"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J73JBN389934
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Hd7tkms27CJPWFClSXS3YTElE7ENqLV4reywgrd4iUQ=; b=
	FGrTNDbkKqKVsSNNLQ3tg5Ps3whM1I+w6sscHEdxSDxuYD3iM+tbXnUnhjk/caSB
	USms5cXmh0+GBpT282I1VPUyzeebRRBBDOqOEh2pohuGetO0i8y+Dx4xBNIonnq9
	bt9SD6BbnUl70KSEcReyUN8WC0s/4lKpng4pSb5RbB9xyZvGEsBLaMbVmjJm8Boh
	geoxtiTVNl24NNSBBk9hER6jrO/N07/ePko2lupmZqo0czjCEPxscQFgyiwQb4k/
	6ccYUDfP73uhyjGOSSdl14ZkMY2aQlX2DHMp3oKCVF9PyGamjpnuLyc2AL5hk8yu
	y7vRoEcHAEfTPm0ZvAMH4A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj4aym2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JEInFP037146
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:33 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2a4cyx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0dgARQ5LpzsopiwnufIfBMq2Nv+wW7jsPAIhDj+1vdtdC5KD8A2ls6lvICwrTEnuXgXp4Srs8eTgWn8rfdcSKozBrUGIPfjWp4jo8rJdMHJ3CpzPvSd3IZzdOQXHY8TtTp+Nrl1Pq10NOsU2xCUi9p5w5qStmA280nan/NaZRioSafhnluD9iBEAYUDXE4c8p6Pl9kE8kDjH3Z2DqQ1fycCcHyjPeW/yzrFDb4J7wv78BRIzpdOxT9eQ3lK9bqFvn/zsQ4BcAZxCwVEtrOIrDNyQEAKi/yGY3anBT6P/ns95NKJxi7AWFgX1yPYkGuDpt+V5CCxgfN5fs2wUPzDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd7tkms27CJPWFClSXS3YTElE7ENqLV4reywgrd4iUQ=;
 b=A7SEf+XjIVZhRyhLSQxyYyxm+Cbj2vvYljM41pfjc3GU9tNPyGt7uPsMeXriw9eqz2hxtkyXQ+MIfUf2o2rrMMv1SeFScp7ThYkVUBjKEPLeb5/f2hcojr+8aUFDt04pdrTQOeX9YoHS9t2yye3skRmNsLAvl3QTb2ucGP3jiq1Av3IvPE9qLOd8TSNJKDni5nuPpHU+XOXfGTbfTBaVcmNZcoiij8lvCFIsVtsOp8zTH0KFtT8htIfGxkciux7/p76kuh9IECwWQ6GLpsGlXmciBj8jFWP8ONJ7V5WIjSpCpv3SvMLCCbN7JK7y8Z9dABDUpWJjA9UjCFhiIPAHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hd7tkms27CJPWFClSXS3YTElE7ENqLV4reywgrd4iUQ=;
 b=gpUCgc7u8q598OEnbJLu4zadgsxbpK0s4WVayLfAkTmEqhvNsiudMmMq/S3RhoYC32ghwgZJLqlWf8pqE6+w1SqiFceawidrNtaJnRz6A2YqW3QQXMTOtVqS4+TjmsqPUSKfVYH3qQlDI7+hJD1nBe/Dk0ip6VgxWOc/jn42Vpc=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA3PR10MB8395.namprd10.prod.outlook.com (2603:10b6:208:57f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 19 Feb
 2026 15:56:30 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:56:30 +0000
Date: Thu, 19 Feb 2026 10:56:28 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] configure: add support for --disable-option-checking
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522D2C2960EE7C218C971F5C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA3PR10MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 03038f77-f239-4a39-96d2-08de6fcf725f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nBOaHmakTdd65YgpXPJ0sgigDlwkCmEl9TXAzaG/5UArHG5qFQPPRjMvvVwq?=
 =?us-ascii?Q?TPWWufuuqXbGSoMc7o4yZ9zOwyts/AQ9+pQvbF4Pw0nvy3S2JwRP5KpC7ZCP?=
 =?us-ascii?Q?Q5bjITQRRuVunK5nvP0whJcj+26e78BretMmZ/L/ceKjyxtFhjo53q9UkQGc?=
 =?us-ascii?Q?lzIiedg29CNQPwdTzvnmWaLYc2H95DnFTbsUZD5Ktn7BxPSU2i4QNLIS7nHu?=
 =?us-ascii?Q?VvRJKcB2pcMJOAxJus2Ulhq7FXPvKX07U9ssQfdAypYmtVeCpp/Ng7hljOFv?=
 =?us-ascii?Q?6mbg182+RFyOfK231S1HAW1+Lbae1JPt2d13jI9dodbpPHuSrgAc6jwYpZQT?=
 =?us-ascii?Q?2Fh+J7K4KJ8FNBnGTI8brb7wBigeN+0V771pJh/ZCvRI3v0LB+k4UrwiDlUq?=
 =?us-ascii?Q?sxN+16g5+4MpLEyHtBkuZwHjfh50DzfW1yRPgGdw89l5EvyyNq34O90DbcfG?=
 =?us-ascii?Q?ONcRMpvOknfFdH2AAeNnFEAua1+S1m58sPpjjQIkM4wQgTXohozCYo0/FqV7?=
 =?us-ascii?Q?sZ9JI6CoO48FjaO+K2PGqgnIFEMzRgExvw2KTuOYgIA9A5vdoN2+Fi3/+xz5?=
 =?us-ascii?Q?GyHbZTH06NgzwqKMqNK6dBOFm+zyWf8Q9GKf27OAMVsWR7JslycHenKpqArU?=
 =?us-ascii?Q?BNV4dkvMFXgKUKEsP/0Me1Z1sCJ09zCnqcWllo+gxDVVLRxq4pfrcQrvztQo?=
 =?us-ascii?Q?b/vfhS3bKkXN8fiXpSjrDpC4+FxlSfpRlbY0dk8nV9RimXfhcNqjEe5efc92?=
 =?us-ascii?Q?NvldK2kYR2WLGwO6/E4o7XUZ4QxaxAl++kLwdWFepqPXjJCJlGuGBy8Ry9TI?=
 =?us-ascii?Q?DWmMprxqEhD9oH7GNWLhIPjRUCEq+cYnJQxkJf1OcWVoj3/WHVIF7JKBG5fl?=
 =?us-ascii?Q?UsXj47IJP2DnDyy5XA2wdyi+Xur+7XuGeY2xm3ntfET4u7i6xPyecg1vVJnS?=
 =?us-ascii?Q?oEkk8qqwUdjAXnCjhtPRbBMfUzv0CjGIpbzlqy0rDcf86oGRibH/ayBLmzrI?=
 =?us-ascii?Q?nR6qrsSdIN1UPew4oWTVsxsMSAhPn6rzaUbVckhXXLKEgKUzXiJwOBg5Sr0R?=
 =?us-ascii?Q?g2BIHVUsUVwiYTE98PcSGoGrPpq+QYb0HCujIf0fFNbrVktXHIlx3p0SGGJc?=
 =?us-ascii?Q?YwyxfYZg/96vFZIDkKAxKXAxHlHqRTjfesps/m9g8wTZiBN+GsUm65lf8pHo?=
 =?us-ascii?Q?q+QnCphQiGdbWjXKKbu0nPzWzEF7nTNYaYemdRdB9GsVc7EJJpWgVySXO8Dm?=
 =?us-ascii?Q?TgPy9Q0YXJ7JUl4+GKLI4yGRJg2AcIxq/Xdkca/cD1xu1HRPIGQvplKLutWT?=
 =?us-ascii?Q?la4eNPDlLmrHKUVfyLP9wCXPawA1lR+GDdGyhhrg024jc8lVxpGnC8UyYlJS?=
 =?us-ascii?Q?z819f16ekhI2JpVMp/jpP5+XMxz6HOorN4djVuKZ7Gyuy0rHNPAwApoki15y?=
 =?us-ascii?Q?G4lQ5vaz4feDl9lg1o2xWFQ78nLhACFAXRvqZlx2BmLmGOb3CoLIzJf+SzId?=
 =?us-ascii?Q?sXUyCeNkkb2RFpsxMpLELzP+xDLBz0Jcp3qbSJ1BI96U4L7Ug/yt0IvQRdF8?=
 =?us-ascii?Q?UdMg11C8x/P0A7DU7As=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GkbfB+fVVXcjemd//P39SCtS6BOkkeZRxASkNx1j0zHmX+U2xsi1lXS3gloP?=
 =?us-ascii?Q?vcpFWf0aNs/+E6qiEGbg6x2z/V20eZ4dpBIKmAUvcdpmvApD9XlSubrQRV4V?=
 =?us-ascii?Q?DdABioB22KCTDNdNMJekhc9JuALee0+6unoY/z8U0SSW+wrnz33qXuWbZBoc?=
 =?us-ascii?Q?MCMYqUd8vG1WRyrEcIUPJh54UV5YmcpDp/v0T5d2irkZ1CHNGJAq8rojv64u?=
 =?us-ascii?Q?1STF0HR1D6sFzVIEiupY5aoFRol2Us+GDjsOy/qX8tDKIbh5/fpcBLaNac7A?=
 =?us-ascii?Q?0R7VF36BxYbXMpRvP9zJaGja0TVgBfOrjGFm1ZXSZeISs/ABNrClwgKBu/Q1?=
 =?us-ascii?Q?Am9gYyMDKEqGhVKCkvBl8DtMoZHv93jdPDYTJ84c0nuSDTOOqIFNpaiDeWH3?=
 =?us-ascii?Q?3+PUvxe2qMY0KWVjfjfWbFUfmbdEA5z/sto2O8zFPN8BFcmthBpVZCLY8Q3R?=
 =?us-ascii?Q?pNbusP/HxJHNfyGlw9VlBydbo9LinSRYgpcPEq/JqO5jd7xtTuI8HXzx5ZMM?=
 =?us-ascii?Q?i6RoAwOXBP5HdOsPmEBft3mDQt8jDIObVj8YH1FGxqbv8cWBtN/sBsfY6fg2?=
 =?us-ascii?Q?GVQfZgJ1nSEWYyTsowazgWfCuwqs2o0sOmgsbvu2h+4NmZwERg724Up1zXvW?=
 =?us-ascii?Q?rQD/qpv6nbtJGm/CMtxHSMx7oA7hTaxmFjXSzLFRh+taXdhbJX1IVVDXesIn?=
 =?us-ascii?Q?ypFnkqmge/L1MOZo7iay6/3YXc5KlGv+fvfNgMK9E+0DmfPuSZP4iBUK6++j?=
 =?us-ascii?Q?q9+fpkFBu+xskLWhQPqZcNVKNC7uhFDoaAH754Ks4jPmFYUUdewJG0wpqwWe?=
 =?us-ascii?Q?ZVzJ6Rm8iWHytOQZe0cmVfmJTX3usutWoiT0oyXGvq7nsPGAaMpFs3Mvh6Ih?=
 =?us-ascii?Q?Xo6THZ5v33LOiSX5heJ8+eT/TOglEROw6AY82kyTHwLqGen3H8szxMycyUnb?=
 =?us-ascii?Q?19INLsyKrC0yDAp4rUqJCKyshW3dz/zrwk0zsLNR+To4MtcycI0vhefcI5D1?=
 =?us-ascii?Q?u10JIQTH0pqlECvtzLutaNVbXMV6reN6EFXayqS59LFf7wanbO1uiX4bmam7?=
 =?us-ascii?Q?sWIouTNSEVuzGrWPU6tjDzh74hUKd5oJV8R13T64dGarCQkoADyduC1bHrug?=
 =?us-ascii?Q?RccZUksq/qTqpWFQF7s+ZtaYnxdc56T3bbXsGwotv/0/HdHrS9WdeWEU9b/b?=
 =?us-ascii?Q?qA4UDlMcdd+y5nAA8B7ssFXFRd5JmX8LyxQryJePOVg/bM+Zu7ArwL5vP0Nl?=
 =?us-ascii?Q?qVzTdW9/8D37qFDx3bcayUv1Kkbmk3AhRFrmmJmFVHVKtRkVLckqcJXH2zDl?=
 =?us-ascii?Q?ydGuzNDcAloYaDly4Jaiz3Zxg/BWGhAAerQtxUT7BH7MrXsQ2sHmiakwaqAO?=
 =?us-ascii?Q?yDGmyldLVRaDZWSGwN3DZK43d527HetJV0E9t056sxrpdJZ5Ar7QeHRk5r2w?=
 =?us-ascii?Q?iTjgFqIQJnX1nZ7oYpLJmRoL2dQR3N9gj2vaOyn24knheJA9TeMdNCtGYWv/?=
 =?us-ascii?Q?fuZWfP8/7eYebWQK7Y0kRIpyKkMlk2lcSOEm/JbkAT2ulzKH+ACI9N+lGHB8?=
 =?us-ascii?Q?kekPV4mTOV183gb9r7jz03f/K6XOe0WDrSyXKPjwPxQi/wPBtsHeoIbKMonK?=
 =?us-ascii?Q?wnjnA4aYgz3vB4WLepvTKrzhUZVfRWQZr5PoZ1zoJdDXKtBJIBMYKbeqwCUx?=
 =?us-ascii?Q?fTiWoBNtvA/XY+xUqmbYxeE2Z9s5CZ13P7n8TP6mnjEgsaBvR2ky6WSTQFmm?=
 =?us-ascii?Q?tz2DQreTUw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1qX57fn1AZvFPqiymNjhIjZMThRtfpGr1klItnWFhsjcAtKwwqrgLteGLP1gOimfeMb99NsM8VJOgAkrtnoG4IPuxntbTrApsT+ZJw0t3A8nT24pm5ydgdRjQ8onGyUsepr/wQ0EZmkBmIaDWxG2XgpASIQhhOjp/I4NecreBjjva9DtqAEkrfS1BPwxHhNr8WgVvWMI91CfXgpyumMJtkiEYsIgoelox4SQV0WFs+bqhbqsLjF3RFtP/+JoXDGD58PWbZTkugwVJpRRfleBHKV4kj2YSk3vlcrjM86+T+jWdFPE29gkVPHMoO2piQJHwGKeQ27EZZVUWXYHSonXJJekRiHOir8BaX+CXCJXdp+6Zd+XyLCW5yVx+JbaV1QHhr2B1k8vL6GqQL35cGeMvz9iFBc3BKv9MwkwtZJ5a5jx60U4pMjWZ6C7Zz4+yBQ3dOTxbvEtV7Hm+342llSi5Wl7yQAmpfLK7IU37tiFuz98MnltYxDl63SImHHD/jagOWURwd1UuOyy4j3/5rOHmrth5xhTnkcKXcM22oePKvDPUWl5GJBYGCuW+7/nHfihcXPl/S+AH+5ONW4FL+3b0Lq+ULIJfZ3L6oMQWvtIBPc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03038f77-f239-4a39-96d2-08de6fcf725f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:56:30.2321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhJK7YYSGGH+dt9CyboI3LgxgiJWlqGZmEh/Y5Dko8PkNmLM3uzEeGwH8oF02C/7QQJNtRoXLkZqhoXH8i9bnGB9JmPp/eSu1WSFHU2S2bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8395
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190144
X-Proofpoint-ORIG-GUID: dmF_q13KerFtG4J24jdNi1NijUNGKASq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0NCBTYWx0ZWRfXx8uY57gPc1+s
 YjmmoGFm6CdOeKQ6oYiik/X2BRO0iKZjzWiI5bBTehp2debmJeEL6o9p/68fjH6scMUkg86Ng3k
 K8KdaLc01wuw1hAV7r44NAo0PYpNMYtxl5PMh91+fHeHE6211JBF0jGtDvfQWIuMwcUqUu7yyP1
 CTSWPcmNbr20Jr8Xm9AgKew7T7skEPfmwpaUX1ZiAsQWeF8X/6YcSysROZSygafwC67ZhbroNxT
 DCk7vLRVIzybBaktsnjxG0oU3OCWZEjkwzTIkJuJNEo0yKihzxVnGcuVPldu0Je+ZA6NapM9Z6K
 O2P8CAohVO0cksL89yoqyekZX1f5F152Jk6sC+oID1tUbH2SnU+pFkOJBA6Ts4UBUWYvPn/DK2u
 4FJzEWYuLwM3Dcdo7+Hlpm9TypLp6XUEC37TMZZJPnDoeW9uMQreEMOtvGi8Da6wYBg7Y/zVFHs
 UTx4SZcyadcxA3sQ9MR1rVtKPaM3/bujCPHj70ms=
X-Authority-Analysis: v=2.4 cv=SI9PlevH c=1 sm=1 tr=0 ts=699732b1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=7JjCn9bmj-kuPwuGg68A:9 cc=ntf
 awl=host:12263
X-Proofpoint-GUID: dmF_q13KerFtG4J24jdNi1NijUNGKASq

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 configure | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/configure b/configure
index a3107fd0..cb2f585a 100755
--- a/configure
+++ b/configure
@@ -101,6 +101,7 @@ EOF
         cat >&2 <<'EOF'
 Optional features:
 
+--disable-option-checking	Ignore unrecognized --enable/--with options
 --disable-dependency-tracking	Suppress automatic dependency tracking
 
 Options controlling the compiler (pass on the command line):
@@ -126,6 +127,11 @@ rm -rf build/.config.new build/.config-vars.mk.new
 echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
 trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
 
+# Should we report unknown --disable/enable/with/without-* options?
+if echo " $@ " | grep ' --disable-option-checking ' &>/dev/null; then
+   no_check_opts=t
+fi
+
 for option in "$@"; do
     case "$option" in
         --help) help; exit 1;;
@@ -177,6 +183,11 @@ for option in "$@"; do
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
         --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
         --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
+        --disable-*|--enable-*|--with-*|--without-*)
+           if [[ -z $no_check_opts ]]; then
+              echo "Unknown option $option" >&2
+              exit 1
+           fi;;
         *) echo "Unknown option $option" >&2
            exit 1;;
     esac
-- 
2.51.0

