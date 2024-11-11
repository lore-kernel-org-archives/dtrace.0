Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443E42A87
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731349984; cv=fail; b=cPXKblgfO0/2vD8HM6DfTbFBYjIs8X8psAwl+b/Y0xa2XDs4U9ob7fDHeWYozl53rE3eOegAdnQxazvor+JWMLIOAoivItQv0R495hPM4R4Iuy+uVDIBIgeG3ZzlfzDVIGr+ANFJoadRzAxdcDHmyK9E6Q+qQhB1awC+4dTOupQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731349984; c=relaxed/simple;
	bh=aYfffn6dvOPC6XbtOGtea+otVDbMW6hxUJCNOx0UNOw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=CgYQr2ww9daBXwNI6LfoBzKsgbqysoQBRXnke/BLgxE45bMPNrvTXyKDX7XT2XHpT0WK6VOWDqulxzTz3mMhrtUeZUP71ASug24djpVlRc8mxbt/EoQI0FlAELKrpYN4vz0e4L+FkfSXxbGbYj1+73tybnzR5MiJqf2FpHS3XhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W9N6NU4+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BXteofne; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W9N6NU4+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BXteofne"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGcnHV030158
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 18:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=MRTYW6F/FbPIqPwsCz
	cjErRq7TtyCTtbyo/E4WFUFvM=; b=W9N6NU4+SIuslTKj30JQ2pzwp/ZO5+roJO
	47zaTa9937Sy7IJuupyitUNGOx+seOZiYfyZ76D9emIN8eDPckq+63BLJ89MsOxb
	KI0MBGIcpsVbqDv9fSqKhUS4NiNeCqXkR2Oe6n/F7GHvWLz7KuPJn8aFzSwTcme3
	38gJY/G+dDNSuamJmFF3j3J/hbW5oJlEe0y6/Q6CtSTUZUd5mBhvVTolJlYvRSqZ
	wQ94MfknsUogQC49+H+b6X19oQdHBhI/It0WICXQqI42jZM2a3aj4cNK3kAT2DQS
	EzAW2X3ud/ORRYUVN8gCYnWgTAxESqm9JRK0obCS93/KC1k1waQQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kbu2yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 18:33:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGKuPF023674
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 18:33:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx672dv1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 18:33:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhIaeK5E1QgLUjA6a0jPIdrihCoEg+0WLy9QHiJr8bTZoMDV7VvcnmOa9nmxMgs5LlDzKRDHjwoR5F14prIUhvCfMLqoBGnd10CWU7FgZkIYG/5M2wk+sc6UivPoVgQXE+n04Jt4ZzuoF++SPA5UCTtJexbWo57pPdP8vi94ixtPkW5A7G4AlalEUxhwL6VeUEVpcYJ2E8Dw7lrKaZQsAdJKjjP6PP8Hv0gTM/FFrh012kTtkVYnjhoLCWKJxVSlF2qsPvn+TY9xf2auwDEQV9jsHKIOLqiwXAgBnpMb7TJdg8oqmE1MXzwYtwsfDxzkr2RPGz81w149PxYDMd8TOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRTYW6F/FbPIqPwsCzcjErRq7TtyCTtbyo/E4WFUFvM=;
 b=uKcWewfCGex9SP5rF8trnU8RRdZrJL4JxLobEJ0jCYMwIG52T/PR6wsvDOoVflnRNT/Bir/ydgCxGBh4PUkFL5i1FiFaH1sAutTlTY+o1PD35ZryW0MqV2sfknMG7bsU6JV1mHmy2l+pW5bBMz0wrCChZuR0M05wNWwY+EJ3SkXogWMKYB/Zcjg6pWsBf1H7DgjvmDOQUk2DqwC/hVPYsyvAXtDBJwaCI5c+K6Gsbqi0Bfguu7TG7u9wztYNAhzIgDKJWU051O6DuH+7nDq+tkVUJ/tPL+FxauctegN0SEdK+Miqpz9msCU6YWVlFQ3PUakh2aBOtSmA83sIGpTVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRTYW6F/FbPIqPwsCzcjErRq7TtyCTtbyo/E4WFUFvM=;
 b=BXteofneTDTKG7af49dbtbyNjd4vYVrxrXKxjpEI6HlA+qJAT8uJ1nus7R4r8JmWTaVyfUkSLYfYUNGjUIDtjekl+EhuCk7z+rIu6iwFnXYWlte8sIB6+Qqc7qOvKGbptt6VlUnTbd2emC1BnajSQP8WfrCUi3n59MBgCLQsnD0=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BY5PR10MB4338.namprd10.prod.outlook.com (2603:10b6:a03:207::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 18:32:56 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 18:32:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] spec: add dtrace.pc to filelist
References: <CO1PR10MB47692B203911603E18C72BDAC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
	<87ttcd4vbr.fsf@esperi.org.uk> <ZzI8XV+quXXPzwBR@oracle.com>
Emacs: Lovecraft was an optimist.
Date: Mon, 11 Nov 2024 18:32:50 +0000
In-Reply-To: <ZzI8XV+quXXPzwBR@oracle.com> (Kris Van Hees's message of "Mon,
	11 Nov 2024 12:18:21 -0500")
Message-ID: <87y11p39kd.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BY5PR10MB4338:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b4540f-db4b-41c0-909c-08dd027f4291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/eSK6r+Bw+a/qQXx+C5krdrHt+tS9CV1bjUAx9yHTAYTtkGJsZRFUZktlh4y?=
 =?us-ascii?Q?uPd7tyQDKWMVNPim6wMwsi1dVJOv/BFen+n0QsUStdJWm0iOUtM2OC53aes7?=
 =?us-ascii?Q?N60aHxRIxobTmcNqQkurux7T9vWOSLYb3nO5dCjELXwamufrQxFrCXrnE3Ez?=
 =?us-ascii?Q?Y4Ij8CHrmpfFFyAb0CuSI+a+4ba2kjduxXQ9IddwozAioUUtWG1zpKFoXlsj?=
 =?us-ascii?Q?K2pWuNKgdbie+NLmAshXov28Wqlc+DaGfxJmF3U/DD/UR3Oc95rPrNSDKWRV?=
 =?us-ascii?Q?yKXvqMzpznh0+KWADbRuXsIiPbVnFSQZ5xt08t1wFiSj4sD2keT/tingW6CB?=
 =?us-ascii?Q?gqWXaM1jUavuwHVv0PCNs90Jef+25lwPZn9bFulo6/2uvzyLUuvCiRpRLQ2M?=
 =?us-ascii?Q?wkQQyhRyiDwqz00jOxlZyPhUTRvAzX0YDm0j8/aj4TrOmPSPU/j4hx8SFBkj?=
 =?us-ascii?Q?d477X/ibyGdfwjCQrZA6X8W4i+hXAxcQGugvoVgfqCtDQWaxpL8xim+I9AM+?=
 =?us-ascii?Q?GNSSPDteQahyBWIdYrznRU8n1nbLLfTBgPVevp83S1TDSNePkoaea34w402J?=
 =?us-ascii?Q?GInHZ9Dtb15YcJdzOAmQp8MbJTsX3HnibGy0VMX4Nd9N74W338HpYRjRkdRO?=
 =?us-ascii?Q?o9wGS0RW3HEc3piWG5wlxCMOK61+fpEKTr+gFzWsr/6R4VRQAf7QQzS4PVdr?=
 =?us-ascii?Q?KP7RC7E01Ys0gt0SGXpaY+0HrvM7yeCzUliVSA7eePbh5duB2q7zYeDCqLPT?=
 =?us-ascii?Q?K+R8VPt1S1B8+Jjcq2M4xKHqQ3sng9vQ3duFX6GJR/NyiZkv1ft92Hw+lzwM?=
 =?us-ascii?Q?OvEfe5tYmQDoA01IYx95X6RuXhpxWyyG9HFIaAO1QiOmRTZNKjbtmZdY61Kr?=
 =?us-ascii?Q?i7AJ4UettBU+HjTA5LnT1MnDAzETaqDHIwv1aaXP6tjEx+w6X/QW+PzJvZQM?=
 =?us-ascii?Q?OPkjttgAMgTZnRWGzmEhIxwtNnU6Qr6mElQLsYdErRey5SnviQQgRlD3a41f?=
 =?us-ascii?Q?pLyXo+kELhEqSpIeOO7DmzPTMUgJnK0/bkJX1Yh6i1PHBjCFRdqoU87M9KnG?=
 =?us-ascii?Q?IgZaJJ9p0nlkzPjHbBvK0IJrYPTsUhwc0RYMfpDjeDa2YfIuiVblRByHvFnd?=
 =?us-ascii?Q?u3P14NJg2IrjOqjnF5bchOkHUa/fuWkfFMEmIEAdTZsU42yiyWL12kh+u7Yc?=
 =?us-ascii?Q?cOewHc/gODn+6PcBuL3+BrjBwYz4aR4Sf3iwQdorxdmLnLMcADf6DW9R/mbG?=
 =?us-ascii?Q?28dzV9+JIVlOTs+a/S8kpuwJ4ImOAFyHWCKa/fF6d+S05tcwI1VqO7sdlFi9?=
 =?us-ascii?Q?+P49u9t0L7iT6L1te9E+Fw6B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HjvBDsLGdRWM68xvW5xYQM0mqdeY43InAOwOwRTfbdsJwWz9YxMSc8i00M19?=
 =?us-ascii?Q?OcxPOzTOthO3YJA0TZmCyCGEjTXh2AVnt063j/MojSQ1u8F+5MV0BuyTT8nn?=
 =?us-ascii?Q?r6+ZKy9SWsbypZyAvR0arW+UnGF5sec0XxPt8XHpn5oKfaFoTajsIJ4HNv+o?=
 =?us-ascii?Q?19de6/X0SHpF8xkR4wp107zZ5VYtaFJW4VFiDHy2xizx5qegsCicQGi+BoWn?=
 =?us-ascii?Q?y72p4h+H03h3gk0GMl3UEYqGozi9k2tkK5k7AxPWSmVbNzOVwO4uPJrOGZgO?=
 =?us-ascii?Q?YuFVj/pZcAkRx5G8djwG17wfxhJKUYfq+rPyCD37jPKpLo2GcVQAQe93ZfNN?=
 =?us-ascii?Q?5rhvevO1tNfKSn5r4DQ2n72w2PE6OEGuceS4ti9nrdW8IeFEGCxdrUEkolU2?=
 =?us-ascii?Q?AAafyvBY7bSZeXKthaHgDnSXhPdA9FfPQeeV8R+zMyOP4cX6zo3d84lp7HBE?=
 =?us-ascii?Q?ixGlSQMg+nQtXYzzxI+g4SxMJXVxcy2zt7h+FNNlimIKtQyysJe8V25XGK4m?=
 =?us-ascii?Q?8fzXpEMQGBzfSwfgun7PmbTsV3kdaL2U+GS9PyJkbZYu84ZzuYwTODYvdI1g?=
 =?us-ascii?Q?lMLqEAqsAQxUGY9kzbsegzhHfa/Zn9N2FYhxIAbhvRdODHXvcbHrOhzLuN3F?=
 =?us-ascii?Q?r6E/FZR/7JqtfByGVe0l0Fxlzn7A2h9QHjw1WN4I/Z1Cv2jhaD/Qc7NQ1hAw?=
 =?us-ascii?Q?RYh0a9dgN00Pojw4MWHb+WTgGXVURfwXe9xdHA3yoCnWMK6ff4DMW59bon1E?=
 =?us-ascii?Q?6PQXE6uDEWhfC6YuvnaZrvNr3m7elrgb1QXxcbdSSdhDPSsoaSVKeE2EYAwp?=
 =?us-ascii?Q?NWVoZKmFjLO+Q2Tj5NOZcY80mAQUHPf30aEY3GuIetDxi919uREPiJdGdO17?=
 =?us-ascii?Q?OiUaCMyQqUGilDzmYPAmnye32CcF5jc2gTkQqafjsadBDJYeqWimf8WUTcmW?=
 =?us-ascii?Q?RMiznx/f7y23oE4Eje/j0bCIjRuklYUcB5C/bEaH1MBMSytmr3tbUa5Bw+Bc?=
 =?us-ascii?Q?D7szZJfSizmsj6IrDPJPrRYqScKWEOJyOREwGIRtEvLkI1ulOF3G2WeK95Fl?=
 =?us-ascii?Q?uG50XLbQuDOJ5evgWHgVkfsSIzyxlnnlKQfkalWkpDZ+EDdq0gyqH46x1wS4?=
 =?us-ascii?Q?2kwPhLIenM/2HMA8BZactqmZLdFgrTWYhvc+pyIZ01Oy8VJjX8adbdN0mRh7?=
 =?us-ascii?Q?ooMMps4cHbEZi0fd/bY9rmz4Uvx1fFgTdBS7pQVbHUFW7iHtS9wTKplVZBDQ?=
 =?us-ascii?Q?ySWCW4hIROYNkaSnTKkBS2qj9ZKMJm2Rbu6dgA2mcU917620c5L7Y2/7p3Dg?=
 =?us-ascii?Q?M8W4KW3oAoqg136UsSFXn/PqJkx+rS9Ez7UDEkXS/iFEXTTTYY1ibxAtsVR7?=
 =?us-ascii?Q?a7hUhDcGorM/OsLVFfuHQbBxCnbUYY3XILtx2Gbh4FgruuBsNNx8GgzbxIAw?=
 =?us-ascii?Q?JHbJ8YbCKse4Eo4Gpv4D5d/hU9pzZAlFdBjTkdxI5mGR8n811HcNoDvbXKWD?=
 =?us-ascii?Q?l62eKAexaLZyX031KmnRsnvlmz2Wg5rTKiBtKhFG5id5mN44v3c+qNfOjeyf?=
 =?us-ascii?Q?hNFsSRbO4lVs9fmqwbWgn7xo0CFQSuFzy7e5zpvCwMgyNGc6YYVzeFO8riXy?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HZi5lIvAkuyaoLLY1mqt+mjiwuTg/Az/J/IFXr2p1KUmt2KZsTBDIMuCBLIfouJXLJCzgY7rzzg66+aAT97cZmCJ3XF7GMNBzOb6FnXFFh8jummRXZPECwNG+kGwD55UJwRGkc2s5iTu4Mcriwm6ZzyaEj42M+kqnP7Y5KdSOz4NJriGPtw9m9KtwqyEt7WTMIT1StorNsxSi/88pwpqvzkLo3GCU6JVhQjfB41SaAec2zEORotU1Q15RjzzNUN73gYS9FHo8KxfxAH7YQsfDrXYRWNbDvIJfOu970iqfmQxAc2uUaLhZjs1CXSLmxfJS0lD/zn3o7cTK0I6TCyVoY3a75Zj7NNLPcreFi52D5guPZms71Km/Eh96G12Gis3WZjy22QPNMP6HraFQRhg9fItBPScoQsmaWlT/IOYK4YbpKVIpGT/2QliEdqz2mB8MJ+cMo8dkTqi2Y8uCPScsO5K3FdwQT2sfhAI819BoGs+OGP1dkP102QKMA3UKbThPifwkjC3mkHmBUrJNACK39sm0dAZ+eLawy/irCKQVUcc/cK2FLCjPz61AQfKqBRqao3Y5EG+HToIQgWtxeCztlg9dKjwQSbHPftqmqXZtLE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b4540f-db4b-41c0-909c-08dd027f4291
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:32:56.0516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY00C5CjZkAGDIn7FHC7ZqrXv0KUmmEftGLeqXc814HtqITVQxveBXs14f66UBYxvTdSuzTLgkFZBe6atxydyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4338
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411110149
X-Proofpoint-GUID: WdFU8oZvCGSZhMJU5QjvGJtDhvq56dcC
X-Proofpoint-ORIG-GUID: WdFU8oZvCGSZhMJU5QjvGJtDhvq56dcC

On 11 Nov 2024, Kris Van Hees stated:

> On Mon, Nov 11, 2024 at 03:57:28PM +0000, Nick Alcock wrote:
>> On 11 Nov 2024, Kris Van Hees uttered the following:
>> 
>> > Commit 52a18d35 "build: add a pkg-config file for dtrace consumers: use it"
>> > added a dtrace.pc file but failed to add it to the dtrace.spec as well.
>> > 
>> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> 
>> Wrong package: it's a consumer .pc so it should be in -devel.
>> 
>> (See the patch I just sent when I woke up before, uh, reading any mail.)
>
> But dtrace.pc is the pkgconfig file that specifies where dtrace itself is
> located.  I honestly would expect that to be part of the main package since
> other tools that need dtrace for something would then be able to use pkgconfig
> to find dtrace, etc.  Why else would we put the location of the dtrace
> executble itself in there?  Without installing -devel you don't get to find
> out where dtrace resides, but with -devel installed suddenly that becomes
> something relevant?

Ahhh. Yeah, sorry, you're probably right: its original purpose was to
specify the -ldtrace path, etc. I quite forgot we're now using it to
report the actual binary path too (mostly because I didn't expect anyone
but the testsuite to ever use it, but that's a totally unjustified
assumption). Objection withdrawn.

(People without the devel package installed will now find
pkgconf --libs dtrace returning something that won't work until they
install it, but I guess this is fairly commonplace among binary packages
that install .pc files -- which must be fairly rare, mind you. I guess
we can see if we get a bug report about it.)

-- 
NULL && (void)
