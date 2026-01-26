Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8916D46BF
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 22:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769468058; cv=fail; b=AOWfYTIpaZHSuDjkNeKMpOcY2UOBM3ADxmG7CTEX+XXAZWtwiIhdaMUSJldGOeJhNSbpTCzhsCcoco43xtiMEAoaxL6+IJfoyOzWOQKZnRhHwNtQjhVGmyg0sVGDTDKtfKlyBZTBHPS+NNkUYgdMyK5U8uFK4Dvc8mRper2dQiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769468058; c=relaxed/simple;
	bh=OYH17JFtJKvf9WMMjGkh215rLLHCmu9JrYP/28QJJKE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pMBJi3Nnjp3/XyfPchxAfkeLXqNiKige+I8E8+zloUKbMPOjSeBi8nFK9Jk7mTfuTyfA0/fXNYEX5fXAPnPBxnAkNW94BzYoNNlu6oywetOJn89dzgHPSO7rpXNP5qQ1j1XTgZ0yGhp/rwTOm5ZlkRw7JnF7OBWJdZbM2g6oHvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IplpE2RV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dL/3BYl5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IplpE2RV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dL/3BYl5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QM9YD84124073
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 22:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=0PEYisAA45tsMCpMgin8Ltr6o29W9ttZ4/2JwuaQE3Q=; b=
	IplpE2RVGwBwYe3f1cCHSkd6Gjo+XyL615ZO4BnQly7DIHpCxM3FDhlQftRC8Cis
	vcKHFHbjmd1jp/l8iPxupboLlDnvDYz12BNzXT2MHyQOwTbNdfoioIyuaOa6g0Lq
	CXec01ZrVfhnzXaYsCbdllTiQ0POkUXUlZvDnmDczQuf68TUorc3yZPgm4OX/XpB
	Ocu95wwz+LLvlSRSykVkNBUMxK8Ukd7hrSTJYB9pWR0SA9UwvO2bXdzzF+HbVfFB
	HgcXGLyhb/0sPm4N/kPwHoDG6yx/LODar2dn4MW/8pKCWpG3hk7KAcQI8kEkA3VM
	bNrf0Y3XO+CTQvmDAqAjGw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvpmrb16w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 22:54:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QM0XRg036020
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 22:54:14 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhmv1t5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 22:54:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2BOxpFUrMoOIMRUxfBFNs1dA0NUWdbMmMC4Z4TUk6ujiyL7du+YKchxK+4BSQyAWO8VLhbvVRFk8V6y3oiqSuNlGOH4U2V+XfRzEZIVDr7r+T1kgVIjn5Cf4FtzukV2csKG0zsVeO8/85ZUf/d3/bS2lnsDK/1w6UAdMCblpKIZScLI/xYEOhl3yw2D+uoJmPj1GOkMiMOeO/qJyuvIGBmZnOr4lNevdNvnmZOR1MSy/fkAquGqyyZhBQXgToJniH72JtM+yiRzoMCVTXlBSrhW33j2BExnFFcGW65ITr1V7PxToHTzU+Jfn6A1wjXqIe7mo/+w2EE33yz4OSPzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PEYisAA45tsMCpMgin8Ltr6o29W9ttZ4/2JwuaQE3Q=;
 b=C7LndJgS3v8171spetbMqdH1d2ofgyWxItWGuex4tinR4LcR5X77oJVOd2GhH4dMxJQFyoSOnMMqHFlf88Sqv6C4s5NElef4LDQwuJjsZ8HbJ3Fxwgkf41Q6CSq/HGZjSi9zsq3IVu6NMqWCWwCpKIuL2TtcploY/FkhunIZxJ15cH5fpHD1tlTxxkMB3awmj53bYhPQRGRNxe2dyDY3q0nKij+C7LUp2FY4cg/QtUMtlwfC2hcEDS1evR758yJXgZl19XVJiu/fI1gNl67oRyAb43735BIGGXKVPI78uYG0wxhwVpPbOFbS6pqO1ZZKfPYlbPS+dVqRWkmoChPsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PEYisAA45tsMCpMgin8Ltr6o29W9ttZ4/2JwuaQE3Q=;
 b=dL/3BYl54VgSii+Yn9RzBjt2yrF476a0XtTatOI4Hla/CTvASLCrhz5kjJwbAvoA3WjDvX8h/KFp5oorFBGib5ayTqqx7Gg+lcZYarhs6EqKVIGZ/SKPAKVT5/T7ea6e3jBYKkVpZMSIn2v+AAjKGW7oT5aqVQW3mJ8HDY5o5hw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7027.namprd10.prod.outlook.com (2603:10b6:510:280::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 22:54:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 22:54:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] rawfbt: prvname is not properly set
Date: Mon, 26 Jan 2026 17:54:08 -0500
Message-Id: <20260126225408.20289-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: baec68a6-62df-48cc-8101-08de5d2dd117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?th03s3RZS5Mw9pv7mYE3tYtmkoXmCfjkTie/6QkqQUbo0riPRUVpXHRk78go?=
 =?us-ascii?Q?VE1qBlPEHRPxL1kt43TJfTNvXdIRYfyQwN61HdoK1lPagTG42FGVEDYTHwjI?=
 =?us-ascii?Q?r3hXbcC1bC/BA1mIQuaVAUJdjGp/aX+zXJb2iBvdP6sZXohCA/Tx0l5hm+W5?=
 =?us-ascii?Q?mEfZ00v9nHQ/jqZ2tTw2WzvEfyhbuJlLVZDRiicf5PJAjLf+5bQj8zr7NL4F?=
 =?us-ascii?Q?v+pMRtm41Y61Fka6nNuSnePRL9i2ASt+Y+QMqWvU/R9OeKBEZ6thyvjcRN3f?=
 =?us-ascii?Q?M8oi+xi0+5oaTN89yC67jh8GybIgeerZCOjw1zE4Fg+7ybsXNHGuNbWcnl/3?=
 =?us-ascii?Q?AF2fO84cQFFpUpqCdP+Z/sxdHgQ8D3n30Tgdo9FLB4EAoIFKirDqQBRkhQX8?=
 =?us-ascii?Q?daWXjSdxxjchgsZwkVJd2L+L8oUmtUQk+SnaTNZjWXV++f6/X+sjh2LcxqoZ?=
 =?us-ascii?Q?nn13w76/z9tqUOw41ZFmj0imzv0sqlpyJrnQV4DSvNjKIDNvmGt8VFv5AytV?=
 =?us-ascii?Q?e/iH32RJDMB/kXNOXmhIlwN8X44ypw2Pqm/noHXWwND6K9tZr8yzJI1dS7dH?=
 =?us-ascii?Q?JDDypqGkDI5i1rsPnWZU/gJ/oi9dnj5NkCwfjT6NPBCuK9WdWGTKHwNWHzJ+?=
 =?us-ascii?Q?5v9QZwabwBzeXIJgt0YRm+WrZg9FktUJQVcKVIQU0yDflklv98j9Wm/BaVaC?=
 =?us-ascii?Q?1PCRML2XHQ/s9VxsFAp3lgvx+1dl9FauR3cDdmQYdh8Jmd+/nmHAftrH9p5p?=
 =?us-ascii?Q?6mKvIqJTqO1K6E1cnPBhfeUC9LrOJYoo5IDHeNuRyF6FvO+PfrXrvZzDdXzv?=
 =?us-ascii?Q?6+LS7aIyfjAhFRKfWCtBSPtVOs6bqjers0M6avItbZG2tRV1i2n7yXwaPqxF?=
 =?us-ascii?Q?MjMTy78YAAHJOf4ypWxA0Ztf03FA1xRcn8m2erKNSEreu3lFBCLtMh1KVl80?=
 =?us-ascii?Q?B9mYh+jmQQ+nxSQU2y4J2MtIlf9Lxv6Y8Yh0STsI4A3QAHx5McuImAHFPJbV?=
 =?us-ascii?Q?MTpjjmTnN6jDPJSkzpq76sLyFYqhx9OuNkppUb8tS3UnQ0I+rNg/LyZWMprU?=
 =?us-ascii?Q?6SYucqifGUOEt6VRuGDdUskp3/GaoLE2UozlpoQGWinRi5WLeVfsGJQeDQCb?=
 =?us-ascii?Q?2gCOcPu2Uq7aYz7A4XWxxqB/ilXGWmXklMpPZp5wVKENShKEJdkyUgDFrlvx?=
 =?us-ascii?Q?3Hrqdg2I9w3Lfkgg8LR7ROf06aQp4WAKma1rmvQBGntSCFg01h5tcUPCWsE6?=
 =?us-ascii?Q?AVeBgrI1vlBAOy49fhdWefuwRoaAazNqrmbw3KmoNss1axYf6nkQx50Hq7mG?=
 =?us-ascii?Q?1VePpNBs0BCFNvsC7KlthMMxTRWRiBOzA8mvb5Fy4W8dL+g4c+ekpg+MnlM5?=
 =?us-ascii?Q?LckxS0i5nqw1XmTT9E5DVvwscqFqLUM3ntLlSyy+4r+jMHfSztgG7D2HFxBg?=
 =?us-ascii?Q?4jR6JoNv/pWIxARxlRyoyWeXjbkMtp/L/qytGNATynBQxR7nexnkgqMGMTk+?=
 =?us-ascii?Q?cFxyfpxADNn6y1WNw4rVqo9vN3z7Un7l9XLp6M8VJW3l3OZ0BkBXWu/ubzRU?=
 =?us-ascii?Q?9XK9c0N7KhYEGxw4Nq3LNgTELOjYoW5vhWv3VCiF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IrUpAVePT6D21Pl5UkzLNHI3in5P1MgUFJSzotUEkCPPzIESrTcU/I2kcW9i?=
 =?us-ascii?Q?hFsCkErvUMEaJyRq9bINPdcMmgjkVavx/GL2/zbN6a4TPgV1i4yt+3v654zx?=
 =?us-ascii?Q?Lr4d6EIBjB+UkU4n/U6JTaRy8KPWXQ3usjRqfNYORUcpnwKukoFgpr2e9yLI?=
 =?us-ascii?Q?frjolZOISZS3Z/gXIsnuqkViKDE6rS+LR2fO7emmFWCaHbHok0xgcJj/ZG9Z?=
 =?us-ascii?Q?JKURXNYWKly/7m63fjd7zjN8Lgl6HAEDSODQWjcehaGtOLUH7VZ3dMN6364z?=
 =?us-ascii?Q?iRT/64MB9I875bnRIpGi67YYNgn0rh9/o6UUEV7oZeFj8ROXJZhUiWs9ix3R?=
 =?us-ascii?Q?+JAyoYqxg5dfoTJW9ww5+4ChUijbldJ5mdAwurnqYMF4sfNCeaEWCYjU9FE8?=
 =?us-ascii?Q?jszDoWInnWqsXEQxCsQRG0XTgh9Oe8mOrzg1QCK7Y7nQjYnbkckFv/0GAwfn?=
 =?us-ascii?Q?nb+V4MQPCW/R7RbgCnBkmrBri3jMwwzqlhIa8tZjZOb+UugGbxCUu7EMLTHN?=
 =?us-ascii?Q?DH1VDujCv17SdpgWuEY+vyaZxP7lckcGWebrhm1mIJSUy29LCnPwtyl9dhD7?=
 =?us-ascii?Q?MLxUDF3/rb6ZT5GV796qSrSMRGkWaPpxF5Bvl7G3BOim6GstCvFTHRhZruYA?=
 =?us-ascii?Q?uTg4U8LV4pWLuNt0/zcmTAVg9VhmtD1aUT7jbIzNCeeARLP6ippCI4SVpjwN?=
 =?us-ascii?Q?5tnOM8i4fSwHcsJj/EzzptrBAa3w7BpgrpyTNwpv201m79bfl5IoxbK1hnPF?=
 =?us-ascii?Q?Hq1jYWOk7W0O22+tJOv95X4/tShKWY2dGMUASPt7+s6NhZCwqbMEgEa+0JqE?=
 =?us-ascii?Q?QXBvFCGuULMMF5B4lEHFuxaJaERmd4kG31cruW+c5SdcgpL8VXPqub/VsOmn?=
 =?us-ascii?Q?NPm/YAsITLKv54ntIytj3iBUbwqxtaGTBh93dcqZp6mgYilY/yqPitnEedR6?=
 =?us-ascii?Q?lZCpgOH3X3Eag8h5jmXbgFL1xaZ1MBgez2G++O3wJX0zzYTUKDF/1jxzayqL?=
 =?us-ascii?Q?0ZYkYSUNXufD9cCAiPCNfIU51s1TA95kAcpm5Ag4B5x41Z4TiuP9egfETCBH?=
 =?us-ascii?Q?LF62d3kCx4LiaxZa4p3sVa9oCfi5unaiuYyj+Vrd0darDkxa8xS6O4eoVV4+?=
 =?us-ascii?Q?36K8fuPXPs8bcWEandqk9jt6zIMhnIwMEX9zkJ/xp+vsTCX/BTxLgJpn+rm3?=
 =?us-ascii?Q?YZe7yF03pOkpHQ8wbIPTAr/IFKCwkU5aNElY0iuzhMatxR0vxYrKszUvC8+B?=
 =?us-ascii?Q?k7mrfzVfP9HHwHeauZKdTO4Kbc776TI0XyicepMZ4nxsp4KFfuiR2wyFuklG?=
 =?us-ascii?Q?QR/1/Y4VGJkTlWv5q+YD9u3ZRnyXy/lOr28KJ8cZOS/ZhtTjm+UkalpOXX8H?=
 =?us-ascii?Q?bD66MFEXe/spEcnmlLdCKyQesrGuubdQMkQdzQcgX4Q6j37GcnWLT9+jSenF?=
 =?us-ascii?Q?lkInyYoT5mn+1NG11hD8Yxpzmb5ks2bkRWwMRJ6vze9kfjmqQ+8W/DJ6r3+S?=
 =?us-ascii?Q?VOTN1/k5mYibTOK74JO19K6cGU4G3iRn1RjL/o71brs2PWNYXcUA9OX/ZIFl?=
 =?us-ascii?Q?RUkGTllGbGOZCPkxFkNll4QLB9ZpMruBPRwAsW4yzuq+WWEDqyni+J9WlREx?=
 =?us-ascii?Q?3HvA9mig3xzT4XtzZSFJ/u+rNFYpQre8Y+40DORPPSdVzNzRA/iPZCVV2LL1?=
 =?us-ascii?Q?FrjRZnoFwgdxBvaLKuu6M07mx+6OXik1EDF2KoNNFyOK1+m/xAthSXGBr1yQ?=
 =?us-ascii?Q?soomGpqq9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FbGmm+DS2hHJKmgzZCtDYRfFoL3dk5eFQrKNzWKYtL48bjKO9FTHSaJDNbGHc+J+FIz9fk/7Soc4if3uSzUSf+AL926Q05bRcXekkO2dlCmEyK7Tat0vRUKIqyaqHWeoRUYJdQqWCzDUBMkzT8A1sVdQf04wdrNVBG/EtL0pH8Mwni/rfoXMhbU+94fSIbAIhFwNw8p7qtPXq1RD1YEjzvk+ik2FZQOsyb0PTXcMOGpgkvIjVI4FwBXkuH0gWaigWISWWqGcv1on7B90ZrQSU3OswD5t3KbWmPq7VU418A3HQu0/I2rkjDvOrSkijxl4nhkVIk+BHRdH2lFQoycvR6q2TppsYn2OEQIfFoBDeNuJCZIg9VKC73X6YrordmtOS2wPbL/diFe/qmxi/Dk7GumQY37zIjblWMeL5Le4jlCs85Tp2IEpCiYAIeSujrCY/OlDcL/PGcm08PYX/9tYhM0J2s0SAdT/ozBy6emyQKwnI+QwKJ2NHyHrIDqFedK55SPY3jRbdSC/jr5Oxms0gVJBkkq4D5oQguwtSPrAtWFzrsvly4ag4R8/PJrH9/F9/Tl88jKDswXrG4tAVooBDI0wBazoENIGNwQVER/vEnI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baec68a6-62df-48cc-8101-08de5d2dd117
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 22:54:09.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wv9h7JvXitvHJ4XiFsCR2aENDp1iBUp1cfsVpCIbeF6pGJRzGHopcXIzYp7SqjXucBtwhQKN2gv1R5+qb0NGMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7027
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601260196
X-Authority-Analysis: v=2.4 cv=Q//fIo2a c=1 sm=1 tr=0 ts=6977f097 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Rll2F_O5yxex1jawJBQA:9 cc=ntf awl=host:12104
X-Proofpoint-ORIG-GUID: aXBMVhmGkmgWbJGCFNDFQ2TVi1IR0QqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE5NSBTYWx0ZWRfX6yNRTbQ0aiK6
 riOmh0ojkq0FaFr8OhuyvlQFrikl7E1zsUwVvy4uZb/y1oMqhsHCw/UJoO0tTnEp4Gj5GPGHFi8
 K5NHO0CornP/qpI4EP0+4yxm4WoIibbvBomeMS/wWQazKCXvpBzrFlBJfWZbpTSEXMpZleN90QQ
 ioSe+EL7gWEkFHUeqMXGXhVuPZAtlplg8kEsc3JOHalQ+GLQspQXh74IgAkc4FK3UCOIP0D7I0g
 YSVknFMLAaMa/gVcIrltfCd3fvfNIlGKUX6siSYLv2bSTDhhez5F+fP+5dGaK+CJ6PCSRIn5G4b
 sERwjwvI6GC5TRmnUchFaT8A4J6NYd0VeZxnafFuM5uBvlO/XjgPQpCSdywQ0TZ8+ICRamio9CT
 WsUQtKQoKTpoJ9wpF3JY++2T9Iyfit+bRTzyWP8xzSJ6CS/bOJTsHeqCgT7wQ12n6Mti3H/qjFR
 e5IwRQ6VrQYixbwS8nyvT0kD99jt/QliK7W9H5hs=
X-Proofpoint-GUID: aXBMVhmGkmgWbJGCFNDFQ2TVi1IR0QqD

From: Eugene Loh <eugene.loh@oracle.com>

The char array prvname[] is set for each provider.  It is used in the
file that implements the provider.  It might also be passed to
dt_sdt_populate() via a function argument.

However, dt_provider_tp.h also defines the macro GROUP_DATA in terms of
prvname.  In turn, GROUP_DATA is used not only in dt_prov_dtrace.c but
then again in dt_prov_fbt.c to define FBT_GROUP_DATA.

In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
the fbt and rawfbt providers are combined into a single file.  Thus, two
uses of prvname collide.  The in-file collisions get resolved, but the
cascade of macro definitions does not:  FBT_GROUP_DATA ends up using
"fbt" for both fbt and rawfbt providers.  As a result, it is possible
for rawfbt probes not to be seen.

Notice that GROUP_DATA is always paired with prp->desc->prb.  Therefore,
simply replace:
    -#define GROUP_DATA     getpid(), prvname
    +#define PROBE_DATA     getpid(), prp->desc->prv, prp->desc->prb
This makes the code more compact and relieves the macro definitions from
needing prvname.  It also makes the FBT_GROUP_DATA macro unnecessary.

The format (FMT) macro is similarly renamed and redefined to include the
probe info.

Add a test to check that a rawfbt probe can be found behind an fbt probe
when the probe description has a wildcard provider.

Orabug: 38842114
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_dtrace.c                    | 14 ++++-----
 libdtrace/dt_prov_fbt.c                       | 13 ++++----
 libdtrace/dt_prov_rawtp.c                     |  4 +--
 libdtrace/dt_prov_sdt.c                       |  4 +--
 libdtrace/dt_provider_tp.h                    | 12 +++----
 .../providers/rawfbt/tst.wildcard-provider.d  | 31 +++++++++++++++++++
 .../providers/rawfbt/tst.wildcard-provider.r  |  6 ++++
 7 files changed, 60 insertions(+), 24 deletions(-)
 create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.d
 create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.r

diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 9f1d3e104..1bd405b81 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -239,8 +239,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		/* add a uprobe */
 		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
 		if (fd != -1) {
-			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
-				     GROUP_DATA, prp->desc->prb, spec);
+			rc = dprintf(fd, "p:" PROBE_FMT " %s\n",
+				     PROBE_DATA, spec);
 			close(fd);
 		}
 		free(spec);
@@ -248,14 +248,14 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* open format file */
-		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
-			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
+		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
+			       EVENTSFS, PROBE_DATA) + 1;
 		fn = dt_alloc(dtp, len);
 		if (fn == NULL)
 			return -ENOENT;
 
-		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
-			 EVENTSFS, GROUP_DATA, prp->desc->prb);
+		snprintf(fn, len, "%s" PROBE_FMT "/format",
+			 EVENTSFS, PROBE_DATA);
 		f = fopen(fn, "r");
 		dt_free(dtp, fn);
 		if (f == NULL)
@@ -296,7 +296,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 	if (fd == -1)
 		return;
 
-	dprintf(fd, "-:" GROUP_FMT "/%s\n", GROUP_DATA, prp->desc->prb);
+	dprintf(fd, "-:" PROBE_FMT "\n", PROBE_DATA);
 	close(fd);
 }
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 76134ce1d..ed1bd93d9 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -53,8 +53,7 @@ static const char		prvname[] = "fbt";
 
 #define KPROBE_EVENTS		TRACEFS "kprobe_events"
 
-#define FBT_GROUP_FMT		GROUP_FMT "_%s"
-#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
+#define FBT_PROBE_FMT		"dt_%d_%s_%s"
 
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
@@ -508,16 +507,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (fd == -1)
 			goto out;
 
-		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
+		rc = dprintf(fd, "%c:" FBT_PROBE_FMT "/%s %s\n",
 			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, tpn, fun);
+			     PROBE_DATA, tpn, fun);
 		close(fd);
 		if (rc == -1)
 			goto out;
 
 		/* create format file name */
-		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			     FBT_GROUP_DATA, tpn) == -1)
+		if (asprintf(&fn, "%s" FBT_PROBE_FMT "/%s/format", EVENTSFS,
+			     PROBE_DATA, tpn) == -1)
 			goto out;
 
 		/* open format file */
@@ -583,7 +582,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 		}
 	}
 
-	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
+	dprintf(fd, "-:" FBT_PROBE_FMT "/%s\n", PROBE_DATA, tpn);
 	close(fd);
 
 	if (tpn != prp->desc->fun)
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 897415459..193795974 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -56,7 +56,7 @@ static const dtrace_pattr_t	pattr = {
 /*
  * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
  * We need to ignore these groups:
- *   - GROUP_FMT (created by DTrace processes)
+ *   - PROBE_SFMT
  *   - kprobes and uprobes
  *   - syscalls (handled by a different provider)
  *   - pid and usdt probes (ditto)
@@ -89,7 +89,7 @@ static int populate(dtrace_hdl_t *dtp)
 
 			*p++ = '\0';
 
-			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
+			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
 				free(str);
 				continue;
 			}
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index fb024b078..f9de2cf85 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -54,7 +54,7 @@ static const dtrace_pattr_t	pattr = {
 /*
  * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
  * We need to ignore these groups:
- *   - GROUP_FMT (created by DTrace processes)
+ *   - PROBE_SFMT
  *   - kprobes and uprobes
  *   - syscalls (handled by a different provider)
  *   - pid and usdt probes (ditto)
@@ -87,7 +87,7 @@ static int populate(dtrace_hdl_t *dtp)
 
 			*p++ = '\0';
 
-			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
+			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
 				free(str);
 				continue;
 			}
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index f131b1e02..406609d1b 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -18,13 +18,13 @@ extern "C" {
  * Tracepoint group naming format for DTrace providers.  Providers may append
  * to this format string as needed.
  *
- * GROUP_DATA provides the necessary data items to populate the format string
- * (PID of the dtrace process and the provider name).  GROUP_SFMT is like
- * GROUP_FMT, but for sscanf().
+ * PROBE_DATA provides the necessary data items to populate the format string.
+ * PROBE_FMT formats that data.
+ * PROBE_SFMT is a format string for recognizing PROBE_FMT data in sscanf().
  */
-#define GROUP_FMT	"dt_%d_%s"
-#define GROUP_SFMT	"dt_%d_%ms"
-#define GROUP_DATA	getpid(), prvname
+#define PROBE_DATA	getpid(), prp->desc->prv, prp->desc->prb
+#define PROBE_FMT	"dt_%d_%s/%s"
+#define PROBE_SFMT	"dt_%d_%ms"
 
 typedef struct tp_probe tp_probe_t;
 
diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
new file mode 100644
index 000000000..f73b33f24
--- /dev/null
+++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
@@ -0,0 +1,31 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: rawfbt probes can be found even when a wildcard provider
+ * description also allows fbt probes.
+ */
+
+/*
+ * We expect to find 5 probes:
+ *   BEGIN
+ *   fbt vmlinux do_sys_openat2 entry
+ *   fbt vmlinux do_sys_open entry
+ *   rawfbt vmlinux do_sys_openat2 entry
+ *   rawfbt vmlinux do_sys_open entry
+ *
+ * We want to validate:
+ * - the FBT and rawfbt probes are all found
+ * - the script executes (dtrace could attach to the probes)
+ */
+
+BEGIN,
+*fbt:vmlinux:do_sys_open*:entry
+{
+	printf("success\n");
+	exit(0);
+}
diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.r b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
new file mode 100644
index 000000000..f7b429211
--- /dev/null
+++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
@@ -0,0 +1,6 @@
+                   FUNCTION:NAME
+                          :BEGIN success
+
+
+-- @@stderr --
+dtrace: script 'test/unittest/providers/rawfbt/tst.wildcard-provider.d' matched 5 probes
-- 
2.47.3

