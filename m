Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2F308F38
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532610; cv=fail; b=H07CTlmLOaAYff5YQEQbNaubOFJzAe831nt1XtPOpzfuMBGNufFqscfDeZZpwSzfVTFsYbVxj/6WgT+vaMG2mXPHnKqpu7Rwd1/L7ixTvlTnC43F1F6mx3KuTvVeZs6h4d3BKngmkyhpQa07C/eBPu/nUvF6KJyxho8VmCC0RsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532610; c=relaxed/simple;
	bh=a3ldyLDafon9ppEYnK7cdbmz1J7SBLJRuY7VpV4gfx4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=WdlLQ5xXqKC4u276NcsUFfDLQgiSUDbr/aVb/xY/fyiKWWQxhIfeLSBKG1Wb1HqfYHs7vNYHJ0ns9Uaf2DsOkNsMcugDP1VuU5mLgCs6NwJjoBfBVrUC+O/o6CPoMPykfeZL7BU84dvkB97ga7TKMgPq3DtEBPBaecs2blJhYws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r+GsgqDP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fEOHckgA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r+GsgqDP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fEOHckgA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEGGB3328222
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=EhRqdP4hysjLVlCBwSZddePTw2yH3RsDYsC6Tk32fbo=; b=
	r+GsgqDPUa2947hOc82ti4R/rYncCbl9Wmy6R1qwgzUcx0H6P5pi8Jo1xya1ZSrT
	CWj2WJIm/XLdQm5V0WnEH6a/8gGiSA8zPTQ1qr6wNN4pwqLryiG8alW88xLJxq+d
	9j2RBEfS+1pzI2ehN9VCwqjdhGqLNZ5NM+wTWn8i+Ilw4xLoL0MikENN+Y1j7M0p
	o/WHtoUsTk2Uy0dC2hM5Rbrn1L9ei7iCprl7ON3PoYlGrFapVAB8nNNPYyZV1kz8
	M8CkRMRVd0Dot9MUazWZrOnWqYotHQudXBOx5NGeJHLlIq/4U+a1y8ZvUa2qRgyv
	4t0xgQONWDcNgl2xAuB3xg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmny4db6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:50:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RG23C4019774
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:50:06 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmheyme9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkoFyF5XDEV2jNlFmguJP/xE3d+qhWl4K1ax6Wx6FiCHKqeGAST2MKkkJtj/QZ0QJZ8SGXIB2g+cL2nvdq4sMzQsCcmD2lVildboHDQCccfmFq2yZrYxJGGoivYlwhoxwQL9YGuYoxOyCUJKnp33hDoPC2tjrlhXyyjybujwS+3oh1ZJKA/yzCGTs4BDWgY88NrWSb0IkIP2aXDw48VoXGouukd4stiZADGM65tZPtQ7lnQraP7c+KTTDj9qSLpa4TQNGnwdjYjrq5nB3xEGXRMkvbGhnDOCvJRYUJNXc1AeRmNKfOxXbbIwoxxkh4uyNrnS5AGDVYfBp04y9lCCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhRqdP4hysjLVlCBwSZddePTw2yH3RsDYsC6Tk32fbo=;
 b=DRVhk3E18gW7YEDsLw1QMH3NzCYVgkJyyOKsnr7EGMRNXteMuls6blNmqa9Rv09hlz9j9DWxyq/x3PnnQgXWGNJ0k9XMfh88n5K9OwvX6aZypd5uTjOkk0IqlOujM1gQ50G6mK2QwtZB0sci9aZ1RSNKBBUqonsap6jQ3db0okOoggtoQt5GnR7ZMsIzodI0cw+gRmgYT5vXdA2eELIDWCbjHpGGXVnqA8R3smgBHmfv92xmSjWAfcnOnq01tiLyREWg6CRJveqs7lc8ECb7fVY1g2Gjyictub5+Cqy+nIuJqgFp/ISM0Zwn4hgXBByKaoV2r7w6lwjSbchCOoIFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhRqdP4hysjLVlCBwSZddePTw2yH3RsDYsC6Tk32fbo=;
 b=fEOHckgAOQGsXpsoghy0GMJC5GLCv1korw1xz1Syqj71CK/G9E8jYPENt/0FgfzxknCZ0RCiMx/rqfayV+gHMnX/u3taEj1+wrBZRJAn9INJWt3k4CKD7GUpq9IP6EGXuezvcYCkqxLCQcmx0chTRnWR+KihAU8QKnlJ71nXIlk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ5PPF5467E3597.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 16:50:03 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 16:50:02 +0000
Date: Tue, 27 Jan 2026 11:50:00 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Update NEWS and dtrace.spec for release 2.0.5
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522719EAD0A273DB4A749D6C290A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ5PPF5467E3597:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f481f0-8e53-41ab-9302-08de5dc41d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e+Qw1KeyenOeBY48EsRC7nseVFvMZ4BI70bjYACKHoWo7LGTposSiTockIbq?=
 =?us-ascii?Q?htttbLhfmHSuuVRavyISdbKxpm72qu0oG63eCK0giKVVQ5orCQ5eAo6H6ZxC?=
 =?us-ascii?Q?lIl4rjjy/fzLimPM10VDegF/NJdWHInxWbazmjAGmqD3yHMulNz3VxvvOa34?=
 =?us-ascii?Q?CksvKp9+OIjNS2ur2BJPEHyX4SyasCiG4PB3G+3CcyIGaai85aN/v1AShs8I?=
 =?us-ascii?Q?/j4FgvJkx8sm3n5zbBHdO3dH0gsHuUNneBXAeGuuifZksdsLz3iFVYyxi6Op?=
 =?us-ascii?Q?G5RHT6otsKwBISdyBKI6tPvrGlVlt5CDnYmuavA5BcnfmBhm4pTdjhQEWRQ5?=
 =?us-ascii?Q?TaJtvlNcZQ2f9We89d5BW/fUi40v9KgySb3QPIZqdf5z+LC50XYQsj6zPzEf?=
 =?us-ascii?Q?0mxuqfVAN0Ux7h5ocFHKdyAJNnQQLE2g2Bfk8ul0rZEkqm66Hwn/x5kzT9rJ?=
 =?us-ascii?Q?jPNgURdalZO+uZ1xHkAMmvLbSYgCfffj26wMu4xoTQwf8Xf5rBTUKOtw+RCK?=
 =?us-ascii?Q?vHdbOtBg8GyBT81vP7mg/ENZ9qHt97gmtoeCS59GDCjB9QO+dEjo8Mucb9X0?=
 =?us-ascii?Q?5qoNA+VqmhOj6VzaxB/H6hHwcSpptaU1ZYU0cQOQee83Yk4cGivU8/uLUOb/?=
 =?us-ascii?Q?l6aCvVzujZGPU0VVTjc8cciXeiHGC87wsxVGiRAhdk7/jYlwW7s2w/AIKKPx?=
 =?us-ascii?Q?PP7ZfzADGxhpJBlKPAgkEQfpPko83s+kLwWD8mcZ0oMKPlU6tr5uc3ZDktf5?=
 =?us-ascii?Q?aQvFW2u1QHssZD2ZwoD4ZI6iF0lxx//iuIFL/yXpX3aJGgZg8qY/SWj49mlx?=
 =?us-ascii?Q?aB95MRZI9DbHXtdZWI3iCHhrEw6CdAMTOmKQgp0J+zWeGmJukNMiSbrEns67?=
 =?us-ascii?Q?X/uZ+AWpjys8KCc7KDeLRvsEzqpkxzq+K6Yj9G5BfZ5AsbbMEpRkC4lAnbTg?=
 =?us-ascii?Q?/rjBUpaIGIbC26HtkVMwzIFD17l0Zc2IiEpvW0gORsRhZs3p6bdgfcuWklxP?=
 =?us-ascii?Q?BGkIAllwH8ZEi9AVCqNvwJCTEE5vquNO3O6ogpcqyjJ7sXdew5GY0OSMyQ6/?=
 =?us-ascii?Q?uJZ67gLUUitDCdJqwRfCNeYRiGaFoWSCwPoLgaZt1SHg8UVz7w5hsrZ2EXLl?=
 =?us-ascii?Q?FT44zIPb65fJi/rdbuVTfp7+1iUjS8+2bLr+EcnPuJILRhyCmLpobz1l5/5x?=
 =?us-ascii?Q?QqFabNW7onyxfg4IiI6UhtEaPVHQJbb0V+NAgk5FBJxgSBGsjhBqKdEuortf?=
 =?us-ascii?Q?MQlq4GvCb22vA1RdGF5/2Ui4e15Aa7sB+nyJRmBiHIb0+EmFTV4Lf027CmlF?=
 =?us-ascii?Q?iUPjYTjqIqNgrqBi0SSr2uVFbnv9FyL0VfXcD5LCflYbGYS3obnoLL5tHD5X?=
 =?us-ascii?Q?AkpCXuV8Ut2D6ZMbc15eMjVMENbQIqZ/zA3VhpvVROG9NUKhdOPqznBGE82x?=
 =?us-ascii?Q?Vz/+7Xu9/ajlDeIXBiIM13tg2YyErhA/GIC1Q1WiHj9pyBE93EmI3CbUZse6?=
 =?us-ascii?Q?P+9LE3zOsHL27zBelFook4hOMPOJ3Uyh1jiD/bN6b0gi9um0NqL8MVGh9N77?=
 =?us-ascii?Q?quxOJKFSuX6oHgFBKVA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gDzjU1VH0Qvn3Fz5f/QHaqBc1R0rdHZ/LgSonx6yn47kuqcfCX+1gu5/OVbG?=
 =?us-ascii?Q?wMMGpxTgjCmPBqDhPbt1rxbuaHjR4DIvW5A+r+3Tr7lnVD0UB8Ledr4ZQ/WP?=
 =?us-ascii?Q?OYKcs88PAGG0CAj9fEoFRr2LBWtRCmJBgFthZ1yU7KevbKJtNJOfXZ1fCEev?=
 =?us-ascii?Q?CZI6oTmve1843dZRxz7w1lohrezRbdkvPLgzGwUoqBch0RxCEg6hlAoO5Z8w?=
 =?us-ascii?Q?xRFpDiXS0lNs0Kv+FqFmQOeH6XBYKgShDT3PVsB1TNa2Y2Z3YQ2HV5ZqzVd4?=
 =?us-ascii?Q?VDTsW6sT36MULAujtOmAQjSBjMi/XFPiL3QrfMwawYkYo0QRcoBXMkN8Q0xf?=
 =?us-ascii?Q?lQmUUL3ZNfkOzracS5wc260DR3caho0/H7rCaVYphQpgGamgr6Cz7BzyjKvF?=
 =?us-ascii?Q?vxn/RmrQejCG0riTHVK67zUHK9Moc+OeSAVo2ZdrpTNOP36SsNXF2GD5oinD?=
 =?us-ascii?Q?ITFXTWUiu7JXIpqJcgRtukNvGTLR2PYLyZCnFARrad1TUFpMqOquRnP8+Jkj?=
 =?us-ascii?Q?I+RfuOaC5SYRcD+q2i9QXgHlyXAqOjv6WYlA9WUKOjL08BMu14+PPRtovmhf?=
 =?us-ascii?Q?SW8ZdL1Srt8l2LCgWgoB1e4cZbBkkXQdU8Pi8M6gxFmeu54LYhS7YXr4tS5L?=
 =?us-ascii?Q?ma+T+EYJtvKgn2txsg+wfOA+nXcYCEHfTE9U8uhhABvz7wJcoKsnr08xEjRt?=
 =?us-ascii?Q?Wz8QWPBvVCzLlWUmAh/SpTpitv6dXH/wKdyTItxa/DgIln7bnxmu6o91VAVO?=
 =?us-ascii?Q?OOkt3/M/Aics39EhMNxattQj6ha/QOQdPAUyxmwzdyjX8W8Eu92o0E3WshEb?=
 =?us-ascii?Q?gIt1fFv58LD9U7lW4Y3x7mK+rHeSKLoRrXtCBgOJmJnGccnE+38PsnE13XU2?=
 =?us-ascii?Q?M3XjiXgDbKQ9zAVE6qod99Xn2JcCVoZkdVCSae7e3VbEF7kQVzuppaJ7YPfe?=
 =?us-ascii?Q?dDwMJJgAFYrUr3y3VtISOwQFXtERl5w8VZy0eugDINUiJMVOm8oVXwZ46eFv?=
 =?us-ascii?Q?7FfBrX/ILtTOdEhL1j313uUDToGEWjjaIoBadd9I35/zBp1m1wK2UqtRfhKg?=
 =?us-ascii?Q?3xHF2uzkvpzgUXz6MSeVrY4ywRHNkvrR1iY90wsyvmnV6zK6+yU8dhpVceKv?=
 =?us-ascii?Q?bFEjRI64hAHnM6DEAl/F6VDK3nb05GfBMEOr3u8/+8A8B/GpgjdaT5SCt4fA?=
 =?us-ascii?Q?0MCB17DJCAucd5PnwhpCpSfxCHEuKBf/zI9KdMBG0Ye5u5QFaV8dLz+/uH2q?=
 =?us-ascii?Q?yb3mo4Aj7xFDT33oZ45vjR+/V/USda6rmdtxbO1Ub3dtlSrVi+2AhQ6uI6zM?=
 =?us-ascii?Q?SzWUrDvtYPBNPT7CsNa89fDKpcN7dmELt9qCYvA5+We7uq7eWXIJhblVEYaB?=
 =?us-ascii?Q?2cqlbfwGpRcB2EmsdiBHdsBkt8lA5C0JsO1b81tQ8S17o0gJ0wY7cxuWJg/j?=
 =?us-ascii?Q?7xnq7dIMa7KcvwzdkAl3itUKl3qLyxlRB5nexCpSlphD2LeU3cl3kwp27aae?=
 =?us-ascii?Q?DsJBNqUOPilcq9Vc5w6Z9vGTpdYcd640fki+B0lvsUm+uzElahN92EE5lRC6?=
 =?us-ascii?Q?7qLLYZ9D3QcqQP86gNuouwqlwBsyh8UYNn6CZ8/mzTbcZJzDKn8PJGxhJ+2L?=
 =?us-ascii?Q?7Z/SDpXGybSr8zRrEfuSq3ppqifOKpBkj49IeTF+7Dlw1v7y8UGslgiE1ZVH?=
 =?us-ascii?Q?cccy3p/TQsEJg3fO2lVLt1o0Y1xycgiWiPfXv5yhnExO96zjDQ7SPCDsauMJ?=
 =?us-ascii?Q?Ey8G34QwaGixAkyYUe9WnAeoxogv3Ro=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dsgBgQxC3lI/dAT8Bfq7zCXdKUITCc89G/Vohx3diCeeI108ApI0lqsS2qTL6auijKm9EXzoxQVG7P8WD/XkBRod6VTdilY//W8mfW6J75Q7xj2CQqPloYPaTV4MXhNCaTlcyBaUkX52lcuzDD7x9uWC/jVg6KTASjMqZNO6G+SaIQ+0FP1S0BpL3RTqz78P9tGA9jQ6xTsBM+4HPI59VNxm2XCUSxlGaLrkoZx0pgoJIYWrLiuXX1merrJjeQIruK+YWHbQzRS88uKtxaCp2VbFljc9Nbmtk2inev4DIpiePAt3QPQU0kxLIer6j1ThRY4x6IJEIoGX5j4HCEoaHeRodoXOuUsIZF0mB6Yw2g2M0np88dDblSgpKVW4EAETXYk0InDOob6tggWiSHL6XUFUwX+D9ZiC1Ng4cHtsz7ZAK5Rue4gal7x4z9LvM3YYD3ungLO090Qyg4DfO51mNI3nPxB9YV4Y1LkkpbTbvIBRh7Gf0Xt0yR7STIq7jsArjZfYljtUemu6GxNtgdsORNwsnD3IdEPvy0m8rXpViXmfJs5WJRiQeTQr5y6GqAzCBg0DQn4/JT6EUJJCsLQuYAJsZsZsSQnreHUYjG83CXc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f481f0-8e53-41ab-9302-08de5dc41d3b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:50:02.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG2l0GOImMmQmjtKqrrZrl9+mOsk1CW+2kD3ojxrGDIz7hyxdR0VgXTxOnLqEueSIv26cJZYaHh7giqbEVqo0DCMcJh8NOax8+qIPmu34G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5467E3597
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601270137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNyBTYWx0ZWRfX98Sn6yaWM5Vt
 cXlNjmZlouBqaNrY4uaQnVI0dA0nZ08m1szhkGKPW6RJk1jD4EFt9cm2ff0QEPCvdGe4VqsFzRb
 /8C8tveO42bT+CgibpLLX+/MUiTMIWi4cyHy01rDtgsVMJn9nAr9ChAL+wwNyrRIopjB/zsNr6t
 2hgXSOrvyOP1+CbN+XgPBjsxd/+FwMYKyRw/2ikrplVSi1SJBkpQxqXIP8YQ1xKiMOUq+OabneX
 iVlLMP2tej6gFzZefioUi3eY+sEd4qMrUmYOLN+ySN7Rn431WoNkTiO2LZn3woRh0lcb5CL+wCl
 bpa0/MKPkx94gnO1oKSL6LiKFv67sUSQWhclOunQHLBZWu/RXdPQntJnOeAYmNutZJQP95VPlAd
 Xo1I7f4pXDtd4bLoHMJm/uPKjFfxfP3vrnNhIF4CjLsgUiV84Hm88Dk5lqVa6z11njtdj1c9RRy
 z/YUhXEMa5Apr5omjl2pCvDOclGKpFO3C1knq66w=
X-Proofpoint-GUID: s6p7dX5kHnn9O_zkxFI_5jAfRALu-nhq
X-Authority-Analysis: v=2.4 cv=cZrfb3DM c=1 sm=1 tr=0 ts=6978ecc0 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=FbnbwcnlIVneOwnL-3kA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 cc=ntf
 awl=host:12103
X-Proofpoint-ORIG-GUID: s6p7dX5kHnn9O_zkxFI_5jAfRALu-nhq

New release will be 2.0.5 instead of 2.0.4.1.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 NEWS                    | 2 +-
 dtrace.spec             | 4 ++--
 libdtrace/versions.list | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/NEWS b/NEWS
index 9348c01e..8f9ea6f4 100644
--- a/NEWS
+++ b/NEWS
@@ -1,4 +1,4 @@
-2.0.4.1-1 (Jan 26th, 2026)
+2.0.5-1 (Jan 27th, 2026)
 ------------------------
 
 New features:
diff --git a/dtrace.spec b/dtrace.spec
index 9c01fdda..5d84f324 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -72,7 +72,7 @@ Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
 Summary:      DTrace user interface.
-Version:      2.0.4.1
+Version:      2.0.5
 Release:      1%{?dist}
 Source:       dtrace-%{version}.tar.bz2
 BuildRoot:    %{_tmppath}/%{name}-%{version}-build
@@ -229,7 +229,7 @@ systemctl start dtprobed || :
 %{_libdir}/dtrace/testsuite
 
 %changelog
-* Mon Jan 26 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.4.1-1
+* Mon Jan 26 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
 - Implement PID-specific uprobes.
 - Allocate the buffers BPF map to fit highest CPU id.
 - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
diff --git a/libdtrace/versions.list b/libdtrace/versions.list
index 29c95dd5..7cb2ac23 100644
--- a/libdtrace/versions.list
+++ b/libdtrace/versions.list
@@ -66,4 +66,4 @@
 2.0.2	D API 2.0.2 Linux (BPF)
 2.0.3	D API 2.0.3 Linux (BPF)
 2.0.4	D API 2.0.4 Linux (BPF)
-2.0.4.1	D API 2.0.4.1 Linux (BPF)
+2.0.5	D API 2.0.5 Linux (BPF)
-- 
2.51.0

