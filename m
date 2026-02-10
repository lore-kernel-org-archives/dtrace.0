Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D238A9AC
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744944; cv=fail; b=URwDALbi0MTdnuA8NDfnRkQzRGWWKn0AuI7O/JOmsucizT79qWujvY/gniA7EjKEqGJ0L9u4JzPyv/fKqV/55UUNTwrxdCwQafFGRCuP4CxFO0LzOLk99zJVUzve452SpEKlWJjMltb43jlnd/whel4BjmwmVETpoAHato3XIas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744944; c=relaxed/simple;
	bh=kTwmGRCSxYZXk8CPWhgPQmGaYxjVKkGdUjg/mHy+FpM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=W6I3pmh+3JurmCz8kNHrGaf2ysg5ztxtbAgh30Sh6TW0tBkctdz7bfSwa45vd4b3Up7mJgkHpdpGpTNz8FYbVrOsV23e/PdT8GfZaE7Fu3QJDLLLfWSIXQTQ8wTIB3V44eICTaA3021J6A6rhSSAK8kSnutFlswYKEJq7guTQgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jOkf/zCa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GRfabQ7Z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jOkf/zCa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GRfabQ7Z"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AGjlZo3810117
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rVESl/sxNXo5JWQ8tO9CvQ5NE3Hp33UQqFkE9KthS6Q=; b=
	jOkf/zCa4k9HG7CaGboo7N7BbmPONJtvLhZYAUBxA1XnZYiNY2lGU8iFzxYwSyVX
	N/3RM/GeoYt+A0A4YKG8hGuY/f8ZKNCDFuanDF7KF7u+zmcO3IJbuhWD6vu3/XxL
	Ip7t26eLX5g6rBZd02+gad7KtJ705gDZK0qXOA2piQ3KrwpuxbzY+rSBlR32Ig+D
	zG6KcXMJZ7678Tq2Vd5Q27hze+cdK/oa/jkYVv2KPLpVXmH2XKK41kELuzgtBr+h
	IVMigprA7rysey0XIHV7ubwvUHkihxp1Qusa4EJFy3kKsrBtquwxRMA0NMZxgjGa
	wSPEJyJLVMRSDGNeUc9Jrw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88fv03ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:35:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AGIljI008003
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:35:36 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8234jvdp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:35:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0I0HqtfbwyoyrV2DdflEcsVa2TFQY3nwxd8zw5tQrMCqNa6aSZFVWG1CHeaQv844wRisGwGuwqNkiMN1zqZXVb5gOsC8L/sSnAn3H01ohF5YMpvUy65A9Pi18euPDGc2C5BVQ1n+PnxAsqQJgitqAxD+1aMkuJMtiB2M4j3LwxH7TWITvM0g2HExGPewee45fOgC95MPyFIeY6wCK74h1Db9Yvdu+DlHGkWpA/yeUk+P7IYRkZ2PqIDioOfbEiUZaL44W0uuQIg1ECU+ijwXBVE2P3panQ4Y0YHlrRx9pa7Ml+JtzpRQgHkY/mnvpdcjHR3TdLExGRpC9Y0e/7TPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVESl/sxNXo5JWQ8tO9CvQ5NE3Hp33UQqFkE9KthS6Q=;
 b=U+coj0LQDjZbYtZGYqU4Lp6QGDLzGPhVdW0TQpBFAlpBefUHu8zzW/8QnB0nIk+JcLV8PnEmdiZQ6m21JiTpj1cOLdhfvuqUIPxOS0ZvlC4f0xuHXJR5hTnscZTGqy8ukooDYVD6L8/b8c4e3nNnADhWw2ZCvKYxVuR6uKu5t/xTRy40tBmdFkmQBuwu5Kd2003VNXD0cFkBoOgSP4JIyUIevZYhntO/dmaK5VxFjn+qgcHrijhn9/aMWQSgeW/hQZWmSDdOBeJguxfeq0ootVAphjJh/ybdosXcYk9C7amluJqnyhtdgoEY41gwjixkoGw8R/M2dB3xbsi8ULvHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVESl/sxNXo5JWQ8tO9CvQ5NE3Hp33UQqFkE9KthS6Q=;
 b=GRfabQ7ZS23BcFTJtxE7PbOJdHzO53KvzR6qITTRdr+nJRYo7Hl+D6Uvk41Xr2eP60L76iCE1YT+XSoBZV8nmLu28Lc/Lde/JOO9Iw7lQ+eUfxURIOGW+haGfwdogSEFToCI52BVh/vCSy1Q79rAPntJ+tTZ8QkgDptTd8L5YUs=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB6351.namprd10.prod.outlook.com (2603:10b6:a03:479::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 17:35:26 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 17:35:26 +0000
Date: Tue, 10 Feb 2026 12:35:24 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] test: account for member name change in mm_struct
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522BEBEF1650BD20A9A7214C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 8201feed-5e83-4966-0d1d-08de68cac69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0yNF1NeG+ba8bJNG6PBozFJ6dP4nj59aQ3c0rid6Ye8DefyO2krKtkXqa9T3?=
 =?us-ascii?Q?2OP9R0prWIyRljrfHXTUAZgeJG1j4pFKTLpopHph9Iu+1YuFeEcSAmoLUtfI?=
 =?us-ascii?Q?kpnHjyc2ZxJqvRu2RzUtWwYfcGkzzHU+nfskr0GpYIKUZH53RO15l3GxGURT?=
 =?us-ascii?Q?i2bFpDPKMT9RV7Qyf6AvJmeOVSUihXUXxz0wA72n4ByVZ3iEzP3CXuYIgjLv?=
 =?us-ascii?Q?o/tvAZe5t6sQIlhPriiUegYZoAx/ycquXj3Nu7TSU1g8Uwx7h/HbBLeHJy+W?=
 =?us-ascii?Q?OIqNiHYH0UFIG/P3UWqJWxe4nCc/T80m/QuhAz6Npr4bDZk1mmqFXzYYbUON?=
 =?us-ascii?Q?X1+kNUJFoegBeyPAodA03z4hni59RkT9zA64pSxeQDCQ6A8P/NoPdf2uF7V0?=
 =?us-ascii?Q?rtWIuWX+DEjITFEv/Ly4up0BVjTRAS+meKxmwlvEQZjzZ4i5MMP6AY9XmWqG?=
 =?us-ascii?Q?snqhBW1ZtG9EkLyzDG0Q1ruirGQsvrXyljnXdi4W9i0261iBe1Unf8YlziHu?=
 =?us-ascii?Q?hpC7Uv8x1uUoXhhcJNHRf+h1o5+IRqDT40M6dXpOEpkvAdV/ubzxq06D63Rd?=
 =?us-ascii?Q?6kkEvfC1rIOcu05PSh2yYn2NVACNFafJA4ZblRjYwveIHRd11RpchSpfC0Cj?=
 =?us-ascii?Q?gX0Rhsqeo7wdyXqieipo6w+2dPTPeTpfhC2LIERZb0ozSahfNWh0TqaVDqJS?=
 =?us-ascii?Q?GccRbGTpsAp9IHqZg3dYFD1GqaPBtWx8tRdqrgtuPI9IQaBv+7xhTJaHobyQ?=
 =?us-ascii?Q?9I1LLqFZKA1uL7Az6UeSahGFar4okXj9e7Xar9O/7aBZkah0hbJoxWX2Yt74?=
 =?us-ascii?Q?gbmlKuYCVuNv5IS0l+c+ZCAvs5r6khJQsZLB9euZzd2W+Vi91cETwAvSzaOt?=
 =?us-ascii?Q?LO8gYfnE/urLJX/feC6FIw+a9Jtv2EFiwPwrEUSfuiyXbErFyWIlylS6HC2Z?=
 =?us-ascii?Q?h3h0wXZF79iaFFjIjrKSOubwq0Vhca1DT4Ddj0EBoeaXnf1kyhXpTLTLc5Un?=
 =?us-ascii?Q?BghikpxdgpXe8ZpCvaIMoPwbxKwaI3In1PmJhrGxT1BGVK9hd5YoUyQGRBdO?=
 =?us-ascii?Q?vfHMUyM+DVvDR41uLWuUMnzI799Vfy1orML/273DLCHEPL2OQZjrHZ1nV9wK?=
 =?us-ascii?Q?SK3tvF6eBR1Ee20EsICVdGRiD4m+GNzGoPZCXF4jkIYxcoXlLWtr8ju2YzuY?=
 =?us-ascii?Q?u8kghhc4eNNsiBKco5dCjqzZwjtFMhDIU2/YFlaFE/SC7bJsGG8pLK02rlL8?=
 =?us-ascii?Q?d+kRiYY/w1WODRGxJEqKDC5BS70t9sSxcp1RCpfzqjILcRxZ6GgJ8C6ec8nv?=
 =?us-ascii?Q?DXRZB00Fp90DSSALAFo4pRoZV93s2JNFBCAIkTp2PHf9TUWTgCVJ7KZpKg9f?=
 =?us-ascii?Q?Zt4QNCzLIaWOycNIi88aDO5gPshShYk+99SWtXCa91k97HxbRQUvbqY96xvL?=
 =?us-ascii?Q?joJPKO6c8rdRXBglDlBxhPnus2zF0kGRgnr8RwSBr793IxJyNweohJZrcBoM?=
 =?us-ascii?Q?92WhenMlYRW9xuQfh7oV88V0ZmnhY7XH2PGXk7ZBpQ08NEkgXJyHveTQ6kOH?=
 =?us-ascii?Q?4YgAxoSMa+6gnaPZoKk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IX3HAVIjcTLhJReHb5zamhW/TIxPnjqAAN8T8jyEyaLEEusrfyGRT4UtGho3?=
 =?us-ascii?Q?Z94QgGcPT3zUGiuh5vwW6gZ5Xes1uiaM2dWJNwrFDRsP544xBhYxFsDPylrU?=
 =?us-ascii?Q?Pnm7sD348EYX+FEvXCHUZbMRAIo8Jy5nD3hvWixvddkQ2Y2qsfeOUTrL5m+j?=
 =?us-ascii?Q?jkDwm/l9F87JelNr58rs0FxtvtLQmS8T6bVq66vlPXejbPdBaICgj9W9st0V?=
 =?us-ascii?Q?7BGd/YTUQxRUzgmq4k4jMVoR3lbR6xjJbustBZ09mOZvPr4I7QLsLyOHl22F?=
 =?us-ascii?Q?wiWF6dtVOPYeCaW29Ompku/CA9lF6VcGDzQPzCPTgjIlogC+P/wZgGlJiCIh?=
 =?us-ascii?Q?+JmBG8I+rs5AqpKjfhwYoFU5tHwj+omDIy1ImD8N39TfyBVdE2Hves/6YzHk?=
 =?us-ascii?Q?belHCGnBnM3Y+50hzWrU6q3OmM4X7yC7eKmNTUuR6UCG23quO5qWqLVZGgCR?=
 =?us-ascii?Q?LLH4Vw1Lm+Nz8Y+ApNAUlKTjsdkTZ0Wp2BEIXbTPrpl59ujN3LO8eIZ2IJar?=
 =?us-ascii?Q?0a9TnQENKFvf8R47sA7+aVW/R6nD6w01MkXxB+pCnbm2G0MxTvLnINofzybS?=
 =?us-ascii?Q?tqAeX4DXDd0EOWy4nIjQlxEfhSh+/gBcjzJJGBF+2HQVgesCP8u7kwxUBOcb?=
 =?us-ascii?Q?BH70YqTiDFYSOS63oYSKZo7E6l93V27+YClilziPQaF/+M/odzyukwOP2YBa?=
 =?us-ascii?Q?PkWRYFy0gUMcCpxvECld9PZ5wxYqT6MAEyFFW3mudMINad6z2DxM54m5rufq?=
 =?us-ascii?Q?S4XswvF6mDfB72X3n5YEicX4sOZdwKVF63033z6im7tcFgIfRN7BfIMWblTB?=
 =?us-ascii?Q?6W8rt4bR0GCzTfJTvZz/mwtRGEPVyN9Ik1+odwIGEI03XBOGH0trCB6Gmm+P?=
 =?us-ascii?Q?IImhFAZ5uH/ch5cyKIEaBQHxBexGLGYsdBssroffzuziDd5ZzoHDI5XNv3Fk?=
 =?us-ascii?Q?He+2gLOhTCaKUhN74HbPOuBA73KmYD6xMYfgg5DP0WXl0+n0MuCondjvf09v?=
 =?us-ascii?Q?vNMbL8rtvVMK3pkVXSoQug1FqtedKdto2Pbq4VrB3+62rjrrGEKahH1LqwV1?=
 =?us-ascii?Q?0APFpQ6cVGc2hy0u8VRDsKHldqXhQqA3Gpsq0Fe6F1qmPgYJrZD4bxLgSYHL?=
 =?us-ascii?Q?GsAH9er3PLTub/mOwwZj2ysCAFZntZLtSs+luSQhZOqd5pALMiH2KWnsVUeb?=
 =?us-ascii?Q?topXANPXMuwq2Yk7Zb5GTPosnKh+chZZV3hpju3VOcFSG7GDHyeVtaPZyBWh?=
 =?us-ascii?Q?SafNEqOW84gCJLoDYOU9twbhZvrN1XWSEfqWi/om0nGY61cy1ntYVJS6z05K?=
 =?us-ascii?Q?Db6EqwztUqWhvxZX5WsYIylZ14h2JBIozYn6gYCRYYnTgLvpPNCvPI0/oI7J?=
 =?us-ascii?Q?LjdZG5Xc0RWYMZmNIRlQgsPxljpjUPm6TZtHOUeDFrO1HGE379R5eMVRHcuM?=
 =?us-ascii?Q?6UTcGgFdBRF81Sy+RAIlICulOcv7PhIiShpDo3yBIz4zUp2+zIS+tGXr1e+M?=
 =?us-ascii?Q?N5PKclChj4easw5SQX9UKZG+h7pEPGbrgoNmgYWFZKunYyXm/bQaeZ1Xozvm?=
 =?us-ascii?Q?xmsWTRq9QlGyw4nT4a9308b0T3xmOYuW0l4ftNwNwD53YaoqCAVtcIcWYFDO?=
 =?us-ascii?Q?nzNL5GhvQic0HTOy1PNEJzQsPzO05wcIqp5qZui9tPN/6kIr+K1JAS9EmzjG?=
 =?us-ascii?Q?QmNaLpkvmmy9BtziIrMuAOAvbf/DME6RaTV5FkoSdnEuXM4E4wwMupgzC7Ef?=
 =?us-ascii?Q?lBUu6G7m7fRME+9eq5rWRAtpdfvnBU8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D0ssKzh341+1ATy6/riOynmOS7eZQNetfo0BQckA31hbd/HR/L17ZcE9JL5dN9TRBpeWb90C0c4pSipORqOzBckbNRbMoQIPTEHuI5rEZ3k9aSxli0wC3jGSK1otysbSnsVdfXm425R1d7dq+04NBY2fyV44BNTIRgUSq3FQaoX7Gs6vi85tDpBalxVb5m39AqZ2VoQxbpnvPyDzoOETdJxHk+MyjVpMxlUfohFB4PZqaJjFXtnZgxjAfsWnWxfcifLySiE6MKcAQs7THCyZhXqQuWhTHrhXZuSbVIC/A4AhZPNwyTdbO7ykksu5z8BVz/Zn6Q9FhmW9ADHip1AqWq6bO06RYVgeNc0YCK0fOwUbjXDSIo7L3RZKRCYPwXtcnwC7dL5XLbZdaECF0T8WPNU86SQdWPsGhhwUfpUhBFjmWDw66IAHvRWDsfAuOwgG92Jh1jiTrpl+MpdZ7dz2FKygqh92bVkYi76QxII+/Bliv0u1E5QRnGgYI46j9YLvuzco12NIDdPPFOdVCO2phVVZJHySdXScXkGl9D7/58MB7fhD97tGyweoxUCqb1HUQUKUSrxYe6628ZFLNoLUzedl8BSPl3LUABh43kvOmds=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8201feed-5e83-4966-0d1d-08de68cac69f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:35:25.9755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FIEMqksr86NL4dvrD48FmRiEpJx8800oHCe9aFV08LM8xYdf3jmaI/+KVznmVWhztCywxI8x1woBXB6FWX/zvL9e076rM3schekNjmNOLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6351
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_02,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100146
X-Proofpoint-ORIG-GUID: 5EwCVblMlJcGs2FQyNriIzIJwNSVTg4s
X-Authority-Analysis: v=2.4 cv=Qchrf8bv c=1 sm=1 tr=0 ts=698b6c68 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=UuTJR58Xwip1wQKR3-4A:9
X-Proofpoint-GUID: 5EwCVblMlJcGs2FQyNriIzIJwNSVTg4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE0NyBTYWx0ZWRfX8ayS1++JB3tv
 uUOpK1bFyH/BdwfKN6XNCspl/aEhScdqz1NkVRxbSTcAFBKW23U4wbU6Loun+O21ENdIgjzx1HO
 hX4LDr9xV/uAQIN/LI++osrrtUrSETareDVGunpeLlUyTj1HIEwsmuakhp86o2+FCvb+SV39ZyL
 UAHf2MyaS7/QKfv5o7iZ6yB00jbme3i3GF5tqYpfd+qHbHk6HbQzt0cMN1tixr8jN55Zpod6jjk
 DEhwgr7cOBDiGR0nmssqpBKoWy3pQhsZ0phd1G2ftk6ov80K8Kh7wyJN7wyL2Gzy/j6EpPKXXq7
 NlcCwYsjWbqGHlXLWgVQVDK/l4QGTGhybT/+g5T3c/vCbg+yRBDtjczEcQJGaSMD+kOs3+cgGJY
 u2YkUZv87X4uEU50FhQVHrWRBClkbC013bMomhhuJ22DGJyXVpFcb1CELm2lqkpqQZ6XdVYyTb0
 Svh2BFRv9yHq/FW9RSg==

The flexible array at the end of the mm_struct has changed name in newer
kernels.  Rather than depending on a particular name, we can simply get
the name of the last member (since that is there the flexible array is
always found) and try to use that.

The testsuite gains a dependency on bpftool for this test.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec                                   |  2 +-
 .../arrays/tst.ctf-dynsized-bounds-runtime.d  | 25 -----------
 .../arrays/tst.ctf-dynsized-bounds-runtime.sh | 43 +++++++++++++++++++
 3 files changed, 44 insertions(+), 26 deletions(-)
 delete mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
 create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh

diff --git a/dtrace.spec b/dtrace.spec
index d6af5a80..e0d832ac 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -115,7 +115,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
 Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
 Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
 Requires:     coreutils wireshark %{glibc32}
-Requires:     time bc nfs-utils
+Requires:     time bc nfs-utils bpftool
 Suggests:     kernel-uek-tools
 Autoreq:      0
 Group:	      Development/System
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
deleted file mode 100644
index f3801454..00000000
--- a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
- *	      (ensuring the bounds checking is also bypassed at runtime).
- *
- * SECTION: Pointers and Arrays/Array Declarations and Storage
- */
-
-BEGIN
-{
-	i = pid - pid;			/* Non-constant 0 value. */
-	trace(curthread->mm->cpu_bitmap[i]);
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
new file mode 100755
index 00000000..60fe6afc
--- /dev/null
+++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
@@ -0,0 +1,43 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
+#            (ensuring the bounds checking is also bypassed at runtime).
+#
+# SECTION: Pointers and Arrays/Array Declarations and Storage
+
+dtrace=$1
+
+# The mm_struct 'cpu_bitmap' was renamed to 'flexible_array', so we need to
+# see which member name the current kernel uses.  Since it is always the last
+# member of mm_struct, we just use that member name, and hope for the best.
+# If mm_struct ever gets changed to not have a flesible array at its end, this
+# test will need a new structure to work with.
+# are out of luck.
+
+# Determine the member name we should use.
+member=`bpftool btf dump id 1 | \
+		awk '/^\[[0-9]+\] STRUCT \047mm_struct\047/ { in_mm = 1; next; }
+		     /^\t/ && in_mm { fld = $1; gsub(/\047/, "", fld); next }
+		     /^\[[0-9]+\] [A-Z]+ \047/ && in_mm { print fld; exit; }'`
+
+
+# Try to access the flexible array.
+$dtrace $dt_flags -qn "
+BEGIN
+{
+	i = pid - pid;			/* non-constant 0 value */
+	v = curthread->mm->$member[i];
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}"
+
+echo $?
-- 
2.51.0

