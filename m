Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD94C21FF35
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768589720; cv=fail; b=Ae/kClx7t0qZsLRBk7KXo0sHXKCdRvXzRwdKUUiSOfGRS4tk7Y/BRn0gtxQLM5LquAJP/PvoWd2xe4+J0kqO+7mXGeuPH2C37j1paYIxAUeGD0anVHvO5kVIl5L+mCjt+x0Z9URPl/M6H6VZ+WnxMglXlWYDyryHV860CIXr2sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768589720; c=relaxed/simple;
	bh=1hB7KEvODEIgaRVH6Q2UQzvlTfNLFjadN8TVZ0dWE/8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=I3nEYqxlvOoBd/AaINFQjOfDT9mrEn+9XmVRvtiwtp/r5wTYYFJgNXs0/D2m5YHJGZXb04ikP19T9iJAnGHXzJwndhPnxmDH/7kbj8ocJxUyE9HJ8WjYa80nyjZOXysbrclaUHYMHQ3Yga7PdR98HKW/kRWxpBsY6DfOlejJ37Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ovn5nRux; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bo/uMQZc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ovn5nRux";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bo/uMQZc"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDsMvi2455524
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=iVITAUF8RSF0SM8A49+8wUMHL3pHIiEhTazER4hkUhU=; b=
	ovn5nRuxZWK1NdzYSLyPEr5vvjgbY4rEyvhB7l62d2nFSubZazvmWZs4ybMNewyU
	QslxpWybvjwEmGym26xysWWG0RrHNucVgvPbdXiL31z+lviEnEDRZ6Ave3tw0TF9
	Cq9w0EOw86/gHpUx7fGddiAQfhVEH1JO4B+w4HLUJPJ4+f+70+lyx8SWJc5dkY8/
	jOuv26/X3l2cOCu/tzkyXYvQB/M9JnZL/JRWRj04A6w8KM2ivfH5lAO3eMuyVYi6
	JU9LCi0i7wkFLtmlY09JS22Wqt130qOjHLeAYipN27lzSxdj7xh3WU2JP/1BmDeF
	OisH6nuMACirwYzPHKeCDg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5p3dv4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GGnpEl032801
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:14 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7d8mky-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJNQRhIO1/hYd6ZRSoXtCXrRcpFFBvOtpHxS8g0mWNI1774syFfloMsx+r6RcHjbTjgmLCd05rXklh/CYJhGD7AKlDrbAGqT6Kd+AoV4gPZfMuKEiuswaK01QQrna0i5Zw5Gg1UWb33E5IIkr4uVfM5O5in9OOC8EGQo7BDJmM+MvlPN4Zk85U4mCxmCJ0gVvSiBlOMPGXK0n1wkHsdZOrwB6tnyYe/nRX/ly3P3PZRr8MAW7676kqweX/dQJ0CQsnogDWzFaI3jmECyMYdUhR7kFRz41Lan3IDW7+pEksWz76P3uYHSu1mx6lwDGyp6zJzoJoa8DTJF2cR8peE4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVITAUF8RSF0SM8A49+8wUMHL3pHIiEhTazER4hkUhU=;
 b=O64zI8vt44Wdcz5qn/9GneaTLJdC1t8YalujbvM5/zEAf9Mi7D7fZKI22Cvm1yXFKxOKBBuBIu1oBmYsiwGaEgPOWDbqpNymzrEc66RVmb37NsiH/u0PBHIQc8QsCA9Diyqs/FVcsJDuzziXvIvW2lxaDQGIr5K0kzgcyHS2rDyny5jqIOGY4ZlFCJvTaW+irEPycZaxeW0jq9EKgtlgepojS9D0TkqkhLTnWhDdG2nlAQVk35HrI3aa/x/0QLXYtQSScXx1gl/3EMOIVlPoANvF3rsuZRKHlVP5Emflb81/7FB9oS83UZC7wSFuyaPTEoqWIx1oYNZJiV3CjblICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVITAUF8RSF0SM8A49+8wUMHL3pHIiEhTazER4hkUhU=;
 b=bo/uMQZcURT/nYatt8+EtLZMvN675JWnRk4mbxj63hgCIc5rDcZdvSr/5drwQVGS/lCpyO7w9VTruf9FGx11dmrRh5C+9RJFoH34DI1NKSf9MQ3CUCJagmWT6/jyyjcv31cbChu4MEEF7C8elaxJWOX0mqX/RXJIOZLgHKTJNl0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6911.namprd10.prod.outlook.com (2603:10b6:8:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 18:55:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 18:55:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Remove reference to missing dt_prov_rawfbt.c file
Date: Fri, 16 Jan 2026 13:55:05 -0500
Message-Id: <20260116185505.19610-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0016.namprd18.prod.outlook.com
 (2603:10b6:208:23c::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e84ead-12d2-4d16-c59e-08de5530c598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D3OHMD1ybzfsieuYWeR+gg+w1UB/9MhfYqtMyQzc6CVlPvZbVTp32QMdAV8F?=
 =?us-ascii?Q?ieu/CXs+cKR8nBucPtwymcs4wSRIJqMJQnNQZiLQ/fXc15VMxS3Ron67YCsy?=
 =?us-ascii?Q?m0hYj2aiY4yL3GCgpbe/eRb3N5+DlanBfOL12zN7oOB3X1Wj1BZVbzffpdZM?=
 =?us-ascii?Q?m5fju3MVHs8J4R3fkTBTDzGA83qHFTs+oD/9YLVq0Yv1X8jzu02zDdhLIsVo?=
 =?us-ascii?Q?jI84qk49hVcMKWLi7Y2lbJr51sW6ofyzY1QDQbMas8lHFbtHo6w5lgC4kfov?=
 =?us-ascii?Q?cLHSivVpGp7TbfPRfmcCsNWE++msvcc2hcfJuGj3MS4lqOszHfQBWtO0Oqkv?=
 =?us-ascii?Q?2p9rYP0ZyM8x4+Syh0Jj7XukQp36/zwDrNtZ78aIJKCKrXszf1ZwHpjAad+4?=
 =?us-ascii?Q?EpzFON/q00xbI+hCWHN3hBDGvyztVeRM18kpPjlrpkr5D5n+yNk8asNUfy8Z?=
 =?us-ascii?Q?ptKEd7QYJlDSJIYhcHyYCGeiZpCnsivpx5mt55rqsRvU2usdCex6rOm6sWUI?=
 =?us-ascii?Q?fq7QifkqqR+isdLfvKO0xaZT0gBejV4KJKA9yOP/OZxvot/1yYU59y5fUw89?=
 =?us-ascii?Q?4bohHPP5Ht1/jhdzpL8aifR8Qj4jAESiOD2jx6D6nvzP953inNh1XBDflmzm?=
 =?us-ascii?Q?yk064eU5zYmwHOuTjyubxRZPHjxRq2s3TijaWIOYcUWteB/N6ZEjaa1Lv3Ev?=
 =?us-ascii?Q?zHghF1GlPFsBDtbwPtWGj3xNSeybuzJFJm1G7SwFITvycs2rdhqsedxq+NkO?=
 =?us-ascii?Q?A5aiB6F27cKb4cy2WgSbhsblrWsAGDsHZvGgGNyPWijNrtwOhBzVcp7ZUQNF?=
 =?us-ascii?Q?gYmzvmbzb9rfxLtor9YKvyq4ErFKmAfYr5fnIfyBK5HX8p/2XBkbbM5muBV0?=
 =?us-ascii?Q?lN3O8ASyqjaKkj2INkuANz+ULvZ3QPDRgc8hxCD2u2eHdjfZwGB4anvPM1e4?=
 =?us-ascii?Q?JopToYaezt4Wblcs/esphhm64vMK8OKHJYCRFZg/Rxi46YaHygFARcb1K5K5?=
 =?us-ascii?Q?euR174PBvmdiLZs1TdGvUQ0vgMi266DBSiyj6gAZN29kurgUlVZ7SDgYnLE7?=
 =?us-ascii?Q?MbxYnh7bra0xBYje33nSC6yssVR3+zp03uvnsJkeCSbdHOaqXuXAuIP4lfSk?=
 =?us-ascii?Q?DETCRb07iU59UvX6b+mWLKMDOAxgL0urWM+phCdgLNzRnDolWn/uR/MRmO35?=
 =?us-ascii?Q?LPLu7oegXF69E/6XgObZJkDwC+soVwqlCRFCvkua1/nsGSJ7HDrHO6MEjPKW?=
 =?us-ascii?Q?dvUUL8Zql22EIHgLvqGTh0ghoyB50jyET2y3bx6qZwI+mErSYZdH3R83Pu54?=
 =?us-ascii?Q?/H+xaeQ1GudzkFO4d/c6ZIbeZQsOuyKI8UczyenfYZ5LEJw+y33SdRtUbe4z?=
 =?us-ascii?Q?NnaWiU/6DYnwysieoHr7s6qnWCOYWdIRwZ9LjtiOW/F//NMgxPhwubvORJXC?=
 =?us-ascii?Q?0z57jvEp5glFCF8Ub7CtbbN+gsR5uQpB7Gu1nRh8n/IrR/oItJybsVjOX6HP?=
 =?us-ascii?Q?+oXV/tPv+w2/cngSMvbJXyNxmvABTr4jL0zWVsA5A1M0FwIXbkHSp2QI1py7?=
 =?us-ascii?Q?CcgppqzYzf/V0Vy8/XrxmqhFRKnpD2dxO7n5uhEC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jQWbbaijjbJx5pSdJH8RUcRpI/r10AwlHJl7SngXt2sInO0jkzoqU82y0yi8?=
 =?us-ascii?Q?Uu3e93edL/64r+I6xMLumyo29z8lAN/FjkxoPfRgeUV07PqSizQVFsCKnA+F?=
 =?us-ascii?Q?fnOqWtGvaZGLff/1Yi2wUWtLsXm+Hvj2ourLql4UxAHJ4B+ozJHuePc9+jt2?=
 =?us-ascii?Q?cOHOUn5S0dryIInD00a4LhySNTUScdW6qmaDnQR+zEe3y7cCFent3RKC+b8o?=
 =?us-ascii?Q?4fzM84Xi15sv3GIdpWXerHEtfVXBLChmERv3ffqCZrN3uRxJ74K6K5lCy8GP?=
 =?us-ascii?Q?ONH45Kb/rsWH/acS9g8Hfff8aEkSIirKPXqr9T5XwVTMA4j4kWYc1IXgZcGN?=
 =?us-ascii?Q?iK2VDoN+Ty3xaGskNTqCZoOu8QqIuKDxuf+H1TuotqTBpKiQ0P6Oml1R0DrS?=
 =?us-ascii?Q?cpxx2/RdEXvXb+1q+tsT8adiWzDlDjTNBdJ8i6zHm9K3Bd1K7njEpfI4C33z?=
 =?us-ascii?Q?DllFXGCMaS6h1Pe6pUQPRQ2QqZAhtBAdIhFJnNbNa0piBCwJSRLLz5J0vCoZ?=
 =?us-ascii?Q?CJ105OQjd8dtSmtJreRJ+KfT9Ys755EnXve83dxnZR4b9jH8i7IsASA8DZko?=
 =?us-ascii?Q?ljQSBfpexUm238qDMtOr5QTX3O5qhP13wmnVzVdXjlza03ZruGgk/lI6E2Mv?=
 =?us-ascii?Q?e0bgils9ulsfHEQl/IZ4gBHjfhodlTEd+PP2zn+ZB9j09QUm+q0pDLP9HwKL?=
 =?us-ascii?Q?JIWknffgeYnhWes6kfI1UhfjWJdm3bqK3h38dPznFdo0GcDJksaDHHcmXb3G?=
 =?us-ascii?Q?Bpmi//EfHNYO0un+69lNDgfIKoVSyQS4XZGwGLi18RYXAtrteKFFR+OAtSgC?=
 =?us-ascii?Q?ExeUCas2sBdzEe9L5i+x82jqIx/MyzbqTs0DaZFFS7CD3rI1VcFrCiCRi5+7?=
 =?us-ascii?Q?DQ4QN8JQjNt7qHsaQR8029+Di6Dxya/hFq3U9nteoA2pI2fNGj1tNv/+ihLL?=
 =?us-ascii?Q?Pr9uGUO/XsSfwh6AtsUrIOPbf94pHeOwAp9icwS1K022qztrpv+ZScuUOSVC?=
 =?us-ascii?Q?VJtgbqseU1vIdcTV8Kc2sm2h61+OPjwfHCz6osctH4AWX0y7Va+enIoIjJdc?=
 =?us-ascii?Q?SjokFiODroXdQsGrOHzANnFWuoAIhFEoeSKg3iWwzicOOhlVQSrPmq4O/UF1?=
 =?us-ascii?Q?Uv6c7J8plPRPaWXyOvywEw1h6zoWccROkevXmY0azWX3TTT6+aN4DdTuugmC?=
 =?us-ascii?Q?zyAd/DMxLUTmbhgJ0H9tkq514aim13i/UL68CL6KiAl2QlGS5gzC6NcFEfgy?=
 =?us-ascii?Q?Em7VfRvAeZMwd92zz4xSR40wfT/246Wmd2YTZpYbhtD+zP8pcYfpAch6m8r+?=
 =?us-ascii?Q?3Mucm5kvNIcMj+XrCFkn+Spvc+kSYtsnMnX6uV5mUaw+Vqq9foAsqRW5K3mf?=
 =?us-ascii?Q?0zia3xOXsC3k6tYYLhQlS6ivbWwURi/yuCVCUCAjvgx93a+M/BBtSDHJj5kC?=
 =?us-ascii?Q?dQzsbyd4K95vdC2jApHGObqTUIswYSZ2jF3IPhRn35oovvypT7KgRP8xsJQP?=
 =?us-ascii?Q?4GNaJBoHJ1qUyfUBV0NH/5lzcxFv0ZsZzWPHPOYhmICekWV5ovzRvb1tySU2?=
 =?us-ascii?Q?MSB/SJOIjaiE2tU4PorNGoWvweU8T6D0sasK308H98pm9pWQaJN7GUU6F0qm?=
 =?us-ascii?Q?dn1cbaEmVlAeoBzDG3NqXTVvlsmUDEcI602DqslfMQcxHj92q6n9DrODdz9h?=
 =?us-ascii?Q?rygdRHDGERvXZKByOGLnm5s604PBmpOCqKBMl7vu99qCTlmrHQK6uTpBi9vg?=
 =?us-ascii?Q?sM0pyDHP7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9pFdzXht+ObsWETP3GnSCQ3N3if59ka34v66GrAuWFw+PKbA7D2Oqin6wSMoktxa+bx/nC67XLX8V2sT6P4YP3i4uBRqkR8efR4jDCJkdFtO59HbDh6+CSYoccUmfA+kVphpiN40CJBVGOueyMtnDuPYWg0kZdDGO9ktar8mTRaWnVWWPV29CYs4FH3A0iXzBUZAs1yuLCxsLDZp7gOw3BaTR/rZmSavd1Xp3T5QKp029klGiU+ldoLv9fstpDLrAvjqf6oypIBO7Vw60I3YMd6pl91caWGhUI0lJQ3lFeiEtopEUlUYHyJ0IUyvUIa10DrqV0GUfmDbjUx/72i3GVGZfd9OoKV3OrkHFWen0x/mnXOwNlfIQXY4Zp93KWjhTpfK+rw4tU4JS5HGuuNObvExzcZtmjC3NGrbBFghn3+1Bwcpy+isipA6vkD/yHFLW9OIOzAncf8WHivDlMTuB0Ho2VPuHeB07GOptac3pvgctO/PK3XNjwS6vxXcmUKjPLWTgWVf5KbefnG6uXmP3HSSz/SOO0dQzTFbvclef8oABtZwjAxycAFPVTuyB0jzcM96DXP1wnsVUGxZ/+FBmTJAA8t6DxWeLmP+hgXPWdQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e84ead-12d2-4d16-c59e-08de5530c598
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:55:09.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZ7W+bloiAA2r5pGeJKWqYzFqbVpiTNY+wn1baYM3uzqx1KjG6sM5kde1OiyU3yXQyGMXbdire0KT3gvKvvqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160140
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696a8993 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=6R_V80ZCcWGX8p_av34A:9
X-Proofpoint-ORIG-GUID: 8aTqK87vFmIoBxl6RQQsaugCvHEsDkkZ
X-Proofpoint-GUID: 8aTqK87vFmIoBxl6RQQsaugCvHEsDkkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0MCBTYWx0ZWRfX7I+v75mNatuw
 3amr2mqofFWD33RWGjiaUTmoSIt4GfAurccAKLvsoFjSYDTBLMppcSZkj8BaRBCq5/bB1C8+j0V
 HOczTxFBbn40IMVcinABgtoFFntgliT1grmTuyuudjYbuopM7W3hC6sRpiAoFCzzl7gu/KKyhLc
 f+oXodJEHjxE1NhbvgqCW1eJOz3buLfWRAv2k3up5zbiujY/hijx526mfhZ7pvFPgfp/FNBpnRi
 mjVph5Brt9+0mKtpoDh8TfXWeh31TiNM1LE45LtOcDnAwFb0Iaxb46Em2zqrC+RRAHu8G0r8+F4
 yQ03hge8AWS7NzffI4fvhHYZ9CudviSU4CexOZHyanX/ktdd/46jTl5qhUZxQmbkY+vFkyvU78r
 ZV/IDgoDUJPqAXUvUxoYjKBjbSPSYkyykDj2kZS0TMXJPdQl2S+2+s0g6/lfe0JAtQWoQPEbs2E
 VrcFi56Mtx3d91FXMOw==

From: Eugene Loh <eugene.loh@oracle.com>

In commit 0b7c5a6327 ("fbt, rawfbt: consolidate code to avoid duplication"),
the file dt_prov_rawfbt.c was removed.  Remove the remaining reference
to this file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/Build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/libdtrace/Build b/libdtrace/Build
index 90613e9d7..3a6c04664 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -115,7 +115,6 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
 dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
 dt_prov_proc.c_CFLAGS := -Wno-pedantic
 dt_prov_profile.c_CFLAGS := -Wno-pedantic
-dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
 dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
 dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
-- 
2.47.3

