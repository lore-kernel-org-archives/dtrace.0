Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D366923C50C
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913570; cv=fail; b=KR2xze5xAdVIs5B17RSgS3Ge/2IZSvMk6FDE956DFlpOU5dHXhaqQYnFdkYe+91QaUv0InRUPZCDNKm5BqPzS8FiNXj9HdtM2ZxBXA1obqCWjIHjFYoOQkFarKY6NpkVSdoY1/Xs9Xue8vDyFcCJPrhBE1m0kV+KR+NfshhZeyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913570; c=relaxed/simple;
	bh=vCBdl9QZUxKqUKuBZwiRZ4UsFKNVApR1Q4u0E6g8zOU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cNEzJWF/xZ3G6x+baNRkGe6ei2kFEu6DLfzGVtGsNwdzy4ZjuUf7mJSV05QmEnLasDwUX0A/Qtb7J9edS6df3+cLmXcTNlJU1Y8XCQyKHUok+S9TavuJpmqL0gFzsQsdUNHj2Rvtqn/4UgWVnztkSa6vjcNNdw3o/20FqIlStWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fnuFITXS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MGuePdix; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fnuFITXS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MGuePdix"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINNrj006581
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cwzO5XfYnNCyoGejpo
	Bo7gTCdzfyVi7f1jGBwgo3j1U=; b=fnuFITXS7xks72L6khD+m9yYvFjdg2xh09
	MyxLGQE4mjQ6HZf768kl0bW+MnQmoNRtp4pkM/ukL6aThSy3OZcRWlTFa2GtuK7+
	fi+vDOZsN8UPk10Kyff7+hRIlZPulyB7SMDEzH4XUYq6xMWTW+mVnMz9w3V3YHJp
	tHsAbyWL9LytC6u+SJgTzqfxrDYq1rRYUeWww0CnS2A13u9LSRZmDkpo8qXcAYDM
	BbyTuOUSr85EvH5CkbtNopsJBL4jy28FaRuAIk6HPghTTK/spNwrZPtgpUQknQkw
	FIL/dH81s986M6dgH7xIL5izZnQYsiWkVBHkxY2oQZFLHCIycLgA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dw5a8eeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIJb1Y020812
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:05 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82xntm-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQ1LunrbC98bayfrZER3Ka1HE+dtl1lqWHxdTxbYbnYZaByGOYmhuvgv2QYIRBAGeBOqdPGPpgiPzLUyOW8zuuBA9+CszKOKP9wWwBjWrYzk76QbdDjmJU6ROEzsibdktaxzNLVb0wjwcNm8+VtcSJ5b5sn5L73FVD3BSLLbavBe3oTueQMHiGSPXYCwRsR+9uycF/1CmIkUBJDQ5snZ1+fEHL7KE4PdZBTLsie5niEAM4WNFd8xjdAcERm7cJjJ6RjeWYQXFnR8ZbytRSsPtmcW+3RDIQ0YhQQz3L5/U9iXlRgFfaKvnlWSbgsa1tHrj3eeHx6vk2pfCbeGdzXEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwzO5XfYnNCyoGejpoBo7gTCdzfyVi7f1jGBwgo3j1U=;
 b=lEPi11UBZV1S359XdC721PTv2xDGIAULnhBHEZDQjAbYWRrptIkGVaUCRyPoIqaNxqCEdQPl0xUvB/2zintpmsb33hvTz95TBF3na80M1fNJ7xHEp0wbRFU5kbS3ZOv2dG7+nbhUpSS8YAG7yiwSOjia2RknVBbJtFK4hgzY3Zwt3PAnvGUQjBS/vSw82F+Xo9GRp/IPvf2qZ159ulQ8NzVJSnBwdxQU9GtmSbAoDBirNmrLBDjCW0JZ2V6bQPC3EVrwZDpGFrKBwMvn2Gj8hRDOISuI+bfnpxPmGeJ9kmF8AVLEKNVx6EK5iLa+4k2MopZtDA1/1H9Y1m/vyLv2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwzO5XfYnNCyoGejpoBo7gTCdzfyVi7f1jGBwgo3j1U=;
 b=MGuePdix4NqNDW6v76kg66pe4Ctb+SW5FwdMNugBOTLlhp3P8RhvGlHCVAuhQY4NrMeDS57UYPK6RyYnJbsdsrZtN3eLKKELf11yjq9LJJszmksG2AaCiiydqAgkGCTEBfwhcmv0+PxBPPnZZTRHxj0k0gwkvnGAkjbtx+Ikp6M=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:02 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/20] doc: Add a space
Date: Fri, 26 Sep 2025 15:05:39 -0400
Message-Id: <20250926190557.8485-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: f13cbcec-60c2-4f83-0f01-08ddfd2fbc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OEJrCHwPgJgCcO40mzQ9UcZRY9RDh/Pbo+/apQljRPYp3oiQBW4lDova+NQS?=
 =?us-ascii?Q?Zm+TqciPiNHlloPgIrPs5dgVMOC7a5kEMN+qyDw+NK9Bpawztyhin12kPuO+?=
 =?us-ascii?Q?JQUJnunUbcxET6r9x/zq7zhsYgyMQKNfLcjz1uX7oM/B30+TkmAVevJblT+/?=
 =?us-ascii?Q?JZJBuyap4COCOMRCzY5zKtDXbXaeQl4Tg226Lk1ZjM76kkGbLKSDPMWXv7H6?=
 =?us-ascii?Q?sAz7FiyvZnZJSO+XZ9VqVCnfSd45OCW8FnR6iYBaCbqOWc4aoi078Jzr07Mx?=
 =?us-ascii?Q?ApMBcHLUDk9075tvZgf2VuGW0LtOcHMP8f99nRu6BfCv1OkbWtIGSgexXaX9?=
 =?us-ascii?Q?llLyYZemBlwugIdQuQ+RYP5PR2hdqzB+1kS+6wsubh/8FVK0iNcC/n40TWBN?=
 =?us-ascii?Q?KpdHtKrhj5uDtpIDD3CEL8Jt+yyGks+OLEkoTGL28uhjhET4JFnr/doQ9+T9?=
 =?us-ascii?Q?n2LhajOvZVgGHE9UmTnqGCGuj/TrIKhaslJ8j+xLAGD7ICW1v73cMvOdskum?=
 =?us-ascii?Q?ETGOd3WcaVYTun9coE69Eg+w1tIR2tikPjjBLo8EURn+Oe5PCrdZZW334YRV?=
 =?us-ascii?Q?79a4nXMYAUGCDgG9fBJXzTVm7dqE8J8th4chKvKdKj0l+lqOSRNUQvlhjvNq?=
 =?us-ascii?Q?lnuOuRRYT2h31f5xlEM7gYI5W3RXaWPdn5bZjf0U2zGBUop7ejU6we3sYhWv?=
 =?us-ascii?Q?vaKPU2LyyqBAHM04/jMUQ13/KqbptGbvZqX6g4DSwcdtb03c6oXMe9jn2Zhr?=
 =?us-ascii?Q?9/E/9AjgfD/wR8FiFvqyZ5rfrAk+yjDcDfUELBWSb3Ant8P74znq2Lyvctuf?=
 =?us-ascii?Q?LQbf93aZ/mcyj5+Vi42Bhda5ECj1l5Wx3/RIcItvZHWhZ0QkudKrE5uijRjv?=
 =?us-ascii?Q?8u6w31nnsXOPjjuAsiMr8rME81eIZEemMjYvu5en9ijSdE/yx16yt68rDC1e?=
 =?us-ascii?Q?+8rQj5lExnG35V11bl6ePrfc3ILfaIVRdroNr1NXqYuTSmBw0McpOdOX0TUH?=
 =?us-ascii?Q?uPxkSMZ3ZL53EP9cW93VlwdRyrKXF7lOHMELYUL0+4QZoUxPPu1fuBXdKbKh?=
 =?us-ascii?Q?hUBTe47LAtn09+G7lVB2i4gPxO31naDd6mHtcn90OtbxqsYnLQvKpNEuai+1?=
 =?us-ascii?Q?FU65CQ3vNV1wTUSkc4SlxQptYKrw3aOMNFfCrEHi2g/gKEvGRrea9ZupD2zI?=
 =?us-ascii?Q?UONMBQzpN9P1nKRmP8A4ovUX0iA4m3WNf8E73ArY49P++A79W93GFydl64So?=
 =?us-ascii?Q?Jwsy6kxMMjk8UXgkBGI2dS0HWhxNDP5U8UJ9cbGVM9oHTDR61Sves1Mu5K4I?=
 =?us-ascii?Q?UR4LjqotwdsctzH8p4ak4APhuEmKroEQGLHBnm7KVFoGMQ5ERX+MMU8hH40y?=
 =?us-ascii?Q?E3d+3txeSGdQy8+OY3I2265W5yDTyKGFWCpbhJxEB4C+GKYt/hPE0BMqdb/E?=
 =?us-ascii?Q?ODrCCde0f86o1t1ey/CsjVXDRftkvDOz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PlOd/RoeasSB/Z8XV+qDlccTZMIV3ozMI7Z/VGbS44sUxuyppwNoKqnmyCW6?=
 =?us-ascii?Q?9EktH2+Vk0k9paEYAgjJY5MNhWlFs8+f48OpsjYVWjErvy5qgs17jeKwnnzv?=
 =?us-ascii?Q?i2CA70CLH7pQnw/M1iuTLJ2y1hR+75Me39qZ3UrUT9rYL458squX+30soxao?=
 =?us-ascii?Q?i+IFMfsnzQ70aG/2GlNm32IRCU0t9IfpEZ+KXDzQUFJbSYiUOe9f28o7lQhG?=
 =?us-ascii?Q?gXEz+IhU8TvUo3JUkwHew/sz+lOsxyFeIkQQ+RtEqx14q08Q88STtgVkpID0?=
 =?us-ascii?Q?HX0su/6Bb8Yl2eC3IpRtgDCEDX8OAlmS6KjMS6JhOjbN+B7LWhmAFG8yy+TM?=
 =?us-ascii?Q?FpBtFrZOTqgHJzgB1qCtl1Fa73pOFTGUgrOVtizd46rP5J5Yt8sBywihAt9A?=
 =?us-ascii?Q?T+uNIkXVo86M71HBuzYGSMy2CzeXiKOFRuq9Smb5yHgsTeCKPYLTGL2RqsXs?=
 =?us-ascii?Q?kjmdGZk9tkZX3jJmP+RPA3UgjQ6ltFrKsbYz4bBmKHN6aeyoNvjWSiLqU2Hl?=
 =?us-ascii?Q?PpCHqYeIbM4jbcLH8ZV52LJcD/5jjKRfwjMg5tf/MOV1+OD7GiquhUtM39A3?=
 =?us-ascii?Q?N6/lsNyTTKcZIeICdDDeN7XPJJLehrEKLCy0ZA4pKI9VPJZevu8jIUoHo911?=
 =?us-ascii?Q?r5XDHwcKvu8gzthbz3yEPWC6bshCj+TSfVs3nXs7nCmEMBlgT1aPHer1lDZo?=
 =?us-ascii?Q?MP4BVQZp6XXmxm8i9URFVEXQ5jaaphmgf4Y5B79guuCtzqWqnDSUJDitVqRC?=
 =?us-ascii?Q?CaDZseDY/V2aKGpiMrt2Y+c97Pv/Cy/kPGBXtxa8aYxYYnNP4W5fpnlPjiJr?=
 =?us-ascii?Q?rNVrQ8qRxhp6w9D2WBb5ZPhTQxTjIgOuU3flyXXk0WlMM34YIwUJgN/SI1Bg?=
 =?us-ascii?Q?mH3qql9jS9fLPh84yQCBX8g8TVd+K8gW5jmY2jTAQa4hsbv5dqHRuopY1xUI?=
 =?us-ascii?Q?52vj8ZY3k3dnJyJ18TIcgctfdMiRMu2ztVXnknJGtZ+bkEQhRy2NeaI+djoc?=
 =?us-ascii?Q?ou4jiKE2bGATnLmszJ4mY1CADEzTli/p6aNtjigY07NODrM0VkEOCeIGfb/B?=
 =?us-ascii?Q?lxdYKb+IMNRvI5uLdj8Su/9ARHOCXFgbLg0PpV2acC18AZBeUXc/am6aqgxQ?=
 =?us-ascii?Q?9+ZJkiQgiGREzwzXpDOdORhg3Wq0elLAIlxOfS7rMnGS777TEmIq/pNjQXse?=
 =?us-ascii?Q?M9/udC3E652Q5d6+GR4O2EPp987jFS1LT5US5dkV5cBrA1chW6p6cxt78WlJ?=
 =?us-ascii?Q?R2UyCOprkzbjUBUuV+LBdE8hFyu4k/RtlzYA3iskYFItEHLrPD3coV+T+vur?=
 =?us-ascii?Q?03eCI6SdV3UFDjfSgNBy0065m1Wi2LDoteiO9TUf4lMcUKzyDuz3VyIn879A?=
 =?us-ascii?Q?i+mjhV3d/Rv+i7rP+lGz2Z3CoYj9zT0MtjZH4Vc2/f+Nz2pbArTKrHP/9qnO?=
 =?us-ascii?Q?NMhkO1Urp8TPX+xpRiBHuCQLN503/lkXhk2sv+5E5FYqlJYch/oDLV0tUXyk?=
 =?us-ascii?Q?E8Pipcx3EiTDjysgZymlF7bj6CkQAthYme8YwU38RQTNrq4S7MQp4BcPjVcS?=
 =?us-ascii?Q?l9MgB4Y72SrTOCzMQ4INKdPyXZ75EHtmsxCxkl3k?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RLvNByKy+IXDh+rqXhwRp/HlJHTe7wzEixqmn11gxkt2OZKNLuz8p//A2tm/8h7mADKhelFP429zg2HiEHANqQnHjIIxE0VCbIEvpUvTmkzEzCJEjmJeMODiNisLd6EBac9vMwEHEKujP7Xd4u47RfbxcIItq+zbF9MoQmUUeORIC2nz9ccZn8pkdpYFKsm51pt5AFdN04wJLbQD9eM5ony0hjawGZmdDuCen6DYEESGiJfPB3o+M2CtRux5Yl3PjYRUWrbI+7opQkez2nNhxjD0kUzNULx6++/UW4Qyj/oPgAwOTxpcW91YomK6thHyX/3+gP+DJoYMdxZ2EfXWJXw2YpTQk9LLpSh3G4U9nzaSgOAUqpUE23wzvAnNQ9I78W9a9A7kSLLvH8/7K8tKo4GAx4HoF0rXbbdwMRFwOyv2CXQR3KvppGI/gDI6/tE0ZV72zXaoCMU3FTCQ7RcmOfX7WNHL8y6XAH4XIwkpsVrPmSd7R87z+j4fWGigKIbL0jxGGyn8PL/bZb/tD5Z8fsGJ51LUbhofaS5aptrFhmijuPVmw8WLpuc8Z3kzPdGz7+/nQ+A2kYCEdEBLPpNWaL3VLStMcTYF8dHVttAtc8Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13cbcec-60c2-4f83-0f01-08ddfd2fbc3d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:02.1181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcghz67ZF7vApqpo5/qgeAwnPW2ChPTrwbW8FEbei3vgFjv15Pae4FuEsMIbplsoRkkiiIkgkUX4kzukbtYeIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEzOCBTYWx0ZWRfX4ZAlNkhzvkLq
 Ltksv8Svbp4LDZH19J9BOgVymCDafMEZXvH7foJHxsLzfhcyWw7jt++PQnvmZ0G+BtlLYZYfd7f
 AqD/ZbWAKNGtgIqmljU+T8tOBAVCVp2iDjYh+vexrvSHwBYWrQlLnsqvqwL1lKW8hIKQpCCpyNx
 sjESozc0Dqo3U67F6BFNai7TYAZjOGpoSLLPz68YGttmnAT5I0bAS9dmPWfC3+bRUIa1qCUmdRD
 ljF+D+rvubK33+kABMktuUsNdwBQqAwK2fSY3HAwNwgaHl/0sYHKUnj6iRsPN3Vwjx+Mh/CsTIO
 90pm7Bxhu9lX1E251B4Nh5xZGZE0iR/GRcWEF8z4F9dLtp1aGzEsia0D8Ypx/vgJFYifp42Sr6B
 vkmndUgrK/oLTHfhu8vQC64OcxgCFA==
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=68d6e41e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QCgb1ef_-NtiyYw8EiIA:9
X-Proofpoint-GUID: sKfbD473DCZj-5ZEjq8Dw5U69U8fekcE
X-Proofpoint-ORIG-GUID: sKfbD473DCZj-5ZEjq8Dw5U69U8fekcE

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/dtrace_providers_sched.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index 29f8ad8fd..d4cd546ce 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -245,7 +245,7 @@ Probe
 </td></tr><tbody></table>
 ### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
 
-The`lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md#).
+The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md#).
 
 ### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
 
-- 
2.47.3

