Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D98320E6
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 21:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743369211; cv=fail; b=eWcfvMq+1tVSrT5HvJ1XaKnzS9/Yg2de/Q9aqAw1jeJZmc8UzsduANPpGGI8PW90REw2S4JZbo5YWEPtz2qBQr+tWDQcaxVNw4NJbVME8CHikpHcDPf2PRM7l6hiDdZqfEgrOpA0LyIyaBOYi3TOwyIG0XmuCs1qggj2/9UlQ5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743369211; c=relaxed/simple;
	bh=Ij7Ld6/9A02Wumz3/59Nl+HnyR8pZ/yUxwmkooqTkco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dVXx5EeuPSz+RlEXTkcUsQTXkSRIGECLV1oeBuK+XXha1AYfqtFsDEzmeZEgZ9JCFbCQwljR8yGXA3hLTV9NMgQbKUccXyxNdlCwexf5+s5KqlGRdvfNLNXPOIliL0vEUCikhO0JevAYOglIM860ZgNOO/VupipiYxo6DS/DSwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=baLQj9c6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DcrwEfYC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="baLQj9c6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DcrwEfYC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UK2vOf022300
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 21:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=jWzj5zXmzA2mGxiSjw
	4AnjSBiwVlMAvXv8EXc9wyhCI=; b=baLQj9c6aYvMtKvxNLxrAYdzzb7qjYz6/7
	TmFooAveceNGyS28Vd0gCltP1jx1hL/jYPB05zotqNG0smo9S9N8W46KoaB5mBDk
	fKfOBQQuOmDll8m46OHuzR7SXqrFHxrz8f36ESC0IVHeoExgch39QmMnAInCC91O
	YRiuT31RtAtJGGWptygUAHnnDlvZ2eo1qHQEN1HYCTiiNSSXYqaxKBAkDewnLywA
	eLKQ8wDykRMogXEMdt+hKs7RBf/0U2+XTbq7E5oxpqRY7bpcDhTea3/s0nMQyMYV
	9EILFIaqbdh6jzwj/g97/h4f1HXwesoUPbaVcQRbToloj/eOn7zg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n22b3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 21:13:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKPmaQ010880
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 21:13:27 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ad9kqd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 21:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QusAkGaRzDVeZfYEe4jVTP8XXHOvdpuoldik7JeFSNKyIGxRf/KP91I8zDb8WjL/h19z95t7kgA0+3PMymWKdQEMQUozDxV+AuPodbqwrA4yj/V7DFm0OoVd4RJzGjIei9XZ5zFz5cFqtXOjJYDruiP3enGCW/WtfDxO5AmDEuluv7KiESwO/O5jaTTL22T/2i43bYq8NVWtUkYvWCb/ishoB2MS7g3CH08iC7fW0PKfUpkX77Fk6iA4I8qi8P58u0S4x18mh4OvqpCQ2chg1kiS2pdRieRcnwJ7X7+2+aCccmPfSDXC6angGo6g1i6W8us+a8+XyPmPK1qYUXtpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWzj5zXmzA2mGxiSjw4AnjSBiwVlMAvXv8EXc9wyhCI=;
 b=nDbyRLMt6U9ekJQiMr6lIXuu3cUIs3lB2b8NTUMy+5qThv5BiO091JxPjAGJ69V1yYQ1AHl0a8cLkNSAJU77L3Oftn66+Jll1NwQIEbPNFItdUhUc390vtIb+GRLif6yKboc0a5mCFu73l6W3eGaOsPeoJ+mTaoGxBYoL3ZsoLhCwKUER5y+trYRSTRVt/kqcJYzmHyMOE5fO5LXU8bPAe5k/RWXWaZQf16AdTs7ipqgQhrMREmxuuJNE+kVzdqJ3gOGz80riu4glrHwW8/lgqAaqVR3EhGRa6UvDFdNATdRhUgElDE+CQmUxugQTFebX2yOtkvFnCsnh7+lIzlVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWzj5zXmzA2mGxiSjw4AnjSBiwVlMAvXv8EXc9wyhCI=;
 b=DcrwEfYCdn7zHr/tNqTNqEQ471grlxMJAGhbgC8zDPHhl61eUFxTXRYhucrWrPxQlfJP7JZV9weWOvqX4wRYZQLiJhfClT7r3v1nNsQV2jzcPEQF+Lyn67y/DSiBH8OMWAjiIzbKrfjW8gv2L2Ud1RGO8SQAM43yYsxWscr1e58=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA6PR10MB8062.namprd10.prod.outlook.com (2603:10b6:806:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.35; Sun, 30 Mar
 2025 21:13:24 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8583.030; Sun, 30 Mar 2025
 21:13:24 +0000
Date: Sun, 30 Mar 2025 17:13:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix arg3 for sched enqueue and dequeue probes
Message-ID: <Z+mz8bIK2rJBsQmW@oracle.com>
References: <20250330205736.10970-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330205736.10970-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA6PR10MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 311a6dab-d511-4ada-c756-08dd6fcfb4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wAATwZM4MHdMt0KdksBNTmYnpqOMaZpjjAPraxdDGv1Db/mW/xenlnyx6b+5?=
 =?us-ascii?Q?/HzXHeJuJGvZNf7btRLnC0gqOyXNA41HkAxN+4JLl88ol8bvvmxoK6qlMDaj?=
 =?us-ascii?Q?64dqviLtoR7NteJ5CjV3p0B4JsCHWGg23bmY1nH4odhf6/RWQFXar5pQ+m6L?=
 =?us-ascii?Q?eg28Bz/6kWeostzt3Y+fH4nXEt/XZpR0SHoOIbCapn8Hn+TrvovfGkYzVAvk?=
 =?us-ascii?Q?UXIwoIosNZGgsMGbPpND/Qf1R9fzoVgojXta47ZFT0cfrBzgdycJTUcT+TVK?=
 =?us-ascii?Q?JjpMkfdtYGy0NIwPXLLIr/e76fLB+PdoLFRTdTLVtDJmysFqkQShV9YB3CEQ?=
 =?us-ascii?Q?et9eiCUcqPjJCrD97h1BsVeiUVPhxajXe40tWYWer6uVJdtrdHFl2Ph8TIFU?=
 =?us-ascii?Q?zhMZosTbE3xJwldtDT5J5NltAce/MEFojUQJM72MiaLxTg9RQdI6bHtqzdoe?=
 =?us-ascii?Q?1PlUZ0hyXrXF3rGDcdPHaGDai7I0KDUXR8WyzDqLeAQbX0VP/BbdRvgby3aO?=
 =?us-ascii?Q?WbV02gVWurrBWCLLOoZTsw7pZvy1AgJbm+ksUTHYPca9zN4KUCwJTmgOIz9V?=
 =?us-ascii?Q?dRkVApgANUhtmphrcz87T5kkLtx64UnXt2VG5vfRPvokvtorczfOGdX78IqX?=
 =?us-ascii?Q?lAXFhKlc90cJ5uLznbv6Uu4SrQYgG+Mr3gqC5YxsOpd7cJqGLa4u2f5cp1BM?=
 =?us-ascii?Q?gtczviyFEpepYWriZ07WcUHC1bNT0O5lOokCC+mke9ax6mOJWZ0AGQ70XP91?=
 =?us-ascii?Q?DLZLDda0sHwEtgGfVuB4+yn1+Kfr6a536Ct745O9Q9gb5elLl4AQPAvs+gr9?=
 =?us-ascii?Q?68KzVuB6ihufTb9+PszZVH9tOp3DjZuY/pt2ongiOKDLN65h3mTlPpNmNckp?=
 =?us-ascii?Q?9RNFT954AhQR0a7yWNKOsSbV3XgqUJSwx1R1aO7DWOif/sZgmZ/SBe+WFvAn?=
 =?us-ascii?Q?ay45Wcxl87Nos8LKHfJ3rA68oAq4Vy+c0avmAtvaAwbD4vnJgUin/LtCuUl2?=
 =?us-ascii?Q?8ZKn5DSWxSXKoOy/td3hXczZWQjd2v50Y6bkU7rhzoYLuXYN2SJI+qkRVEiG?=
 =?us-ascii?Q?euqhb0b4EE06AEALwignckwC3xlrAYeCHoXlJz3hKUOnsGP/wmXSR82ndIZj?=
 =?us-ascii?Q?/pr2Rn8SwEWIseKDWefDU7vXPjucssvm2juKVBhM0NfvBtXaMTJTOvFlRUDt?=
 =?us-ascii?Q?aMKFPMjMadazcuTVbfu5s1ma8I0kK6ZwtGhjTCalEKzkxBzI6VDZ8oHb1idF?=
 =?us-ascii?Q?Pv+8agJsq/KSSojvUVPz2TY1X6iLrRzZvuyIQmODpB81CoNwkiTsuC7ZB56C?=
 =?us-ascii?Q?nNoBuWiyS4/yZgTfO36JAJI0+RFiAd9LFA6eg0N+NN2lFDpGwShSUkvNUntu?=
 =?us-ascii?Q?JNMH/lE964NK0E6ezovQMxK0kig/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IvS5OuzDl2u9zi0HI/K3XbNoq3CDUqmdjszCjVcuOgUAfPQ0PJ6ZrsTUG4RF?=
 =?us-ascii?Q?96kWyxvZAK+9mN96TQKJgYV2NgTpyDAVAkB582ihQYZO5s/JfR2glYeJaSn5?=
 =?us-ascii?Q?M6ZKAbclLhSTopCsUH4DKHjORDguHpHuKObyPBd39lrDFjgPJk39mNkyvFC5?=
 =?us-ascii?Q?O9SSMsBjENe12SplFFwSdMnGTTsc23TFPQJiLuUfP8qDfrSXU44sEtHhS8cn?=
 =?us-ascii?Q?MCBBIPQbKK+APAjFK17021jwR5bYaEwvOOH4Z/+TrYU0aX2saRIuN3skb26O?=
 =?us-ascii?Q?q6UeSFyVeybHQEC+keHGwczocWYyA51AGJMfViz/ThnSY5I5REAUSidPiO5n?=
 =?us-ascii?Q?xgGcDgbkvjtsosSjzYKJ8rYMQSaBdI4AS107uhT3GYw5W2Iz7+6UXJCyWDdL?=
 =?us-ascii?Q?BAMX4OZsFnPhlVpMndNhC/3Re3zN8+XyCnCsiWnSacbcxFd/PTuXqRPJjpBv?=
 =?us-ascii?Q?8BBsved2CofH4+M4XE0xn+pABAnOPCUpYcbQQdbwvvSgAmpyYHeKBRHQrFze?=
 =?us-ascii?Q?LkFYm5hsrPhUCovN4azgq7K8CxI6FqlYq1u525r2q+G71RBXC7argwL0dihb?=
 =?us-ascii?Q?rw7KVoEcxQbhn2iv6CwpfZgQJ8fV62vYGUiiGN2V8ITdCC1eSlsbZte+ROJP?=
 =?us-ascii?Q?3PWPN7T/mjUPSKeY7w+a+AvzuhhQzHSWgmKtSuoXMcSpPHhq1H4RXQ5ormSz?=
 =?us-ascii?Q?nu9yTAhl8X+p9ws/Bbm1jw6tN1/vOI5DEcsZB7xGmIwO+fovz4T//OC2C4eK?=
 =?us-ascii?Q?x9vonZpApB/v8LEpJilAVPyII6Kg9xHyAX0knWEG50y9HqmqTuxWK2vpmfrB?=
 =?us-ascii?Q?Cmdik+lJlLB0f/NTjc2nLCXQUQbYfLx27aForvXtQSy+PxXn6HRga5nBC4vU?=
 =?us-ascii?Q?YvaSkjbaXrgCPs+6QkQbP8Jjtj+uCSU6jwGNc3goLXhKDbUt6+ZEN0J2fDRG?=
 =?us-ascii?Q?8nK2AXgIZ5ERHyo20VVgCJ3uPMskRDRWrOKY9YAxWHEy8lDwU0KkSIYhZwu7?=
 =?us-ascii?Q?NcrjlpL+x0niYttl4QXyKdJmeJbRn6otMwAVId2hbPataOFClYsFtfA2Hrat?=
 =?us-ascii?Q?TUqCBjpysNZ6S3JGp0m/56M5GNE5V7yLv6lusu93s5NVou9z7NZXlCSypsOQ?=
 =?us-ascii?Q?GoY1rgSRcQd8hEcwexnGAeQmp4J83Eu9z35D/q3Pgmrev+K8aaNgDH+YlB2n?=
 =?us-ascii?Q?blUp576PMQrjI6HF9/mGHWG4Sbwl495kTfCYZXoFmL6NNYZSyMPqUXf/My5T?=
 =?us-ascii?Q?oRl6i1XJr1aPgZuaCtcO8xExBRWWcJoryMlA/dC4UPfY9+McMeuDWl9JDXfH?=
 =?us-ascii?Q?4aI/6EtGDS5SKzlCckZIdNDMRN5U83JeNvgsMTryh8QrfDPvI78rGq38keUX?=
 =?us-ascii?Q?c0evtOaICxt8O7f3k17qUbjVw/lROGMZV522eB4u5JYbbaP0wHBeOAUA1MjZ?=
 =?us-ascii?Q?aHKfOnOkaja/a3iQr+UKtmDNWx1+dKCKGrFoANkBMYrCAJp3DMvcgDvj944X?=
 =?us-ascii?Q?bg7bzqQ9BG3AkMp4AJXm0zifVyiWA+1n3XXCZUwH7fTp0G+ocpdn0HNsNyM7?=
 =?us-ascii?Q?xvykF3uEpfnlUvuXXLUJUif7kljRDAqt8fu8Cdu8ugO+oWNLUvPxolS43fpS?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yT93YRFGgPqSzevFhugL0IQqDrXOChNQHEpu/IyXsxKba2cIfw1daBO9FJ7m/HUkVbFSxYBq0d3/E3ebvTf1ONx/omO3TE8NNYfSS9jl30q0k/PY2Soe2kklHgpkIMvgsPLrYsyu/7nReti/0sajx5/khUWx4G8jiD/E/tlTopVdAmwrWRTk8SysYtqF8I/U735cKGWp5krv98IiNfRd+mCMuIiO4cChRGWA/ZrZHHcDtDBkFs/8jBVLqglMr5Yy/ggyIblrlOCnG/dQpM6Idymz7cHjOtjCKMJAZvEB2212KmGmMTiCKE9yMqUDLsc4q0EJ4ILDoWiABpQzc6jqqlMS0TJLjFUxcb3JPypwwjO0YMEH4V7fhl1+p+q6bwGbVSsSebmqRUHBF9KzGQqG/acU33KtYKMdY3YbGY3qUN2Syc8y6K6yuKjiRZG4vwCzW1vhWWWvOjCQOTKxV4YKVrkfQXEbEDeY3d/w9bzmWG+BLa2noCmTQN5WWkWIUvapjucE5CB7AM+sIUyrUIoYwhM503NSI0HqSxT8LgjrfVv4u0BdIGHhMLPjurkixRhRXityhxotzFl4a/ofU5an1EtiLnKIkeQtF+ifysee29c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311a6dab-d511-4ada-c756-08dd6fcfb4fc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 21:13:24.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xu94GkYx+YnuNhWerM0ePd55cdR33vtOHnlZkJFsVL4HpzLI3XdyU301Hhltko7Vwl260qK3CHsMLM5UdgPtCV/syXiGQqCmOMbwXcup9CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8062
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503300150
X-Proofpoint-ORIG-GUID: PlZEcvSFXvapYBfDHN3IvDDo3IX2YeQY
X-Proofpoint-GUID: PlZEcvSFXvapYBfDHN3IvDDo3IX2YeQY

On Sun, Mar 30, 2025 at 04:57:36PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> For sched enqueue and dequeue probes, arg3 should be an int
> for enqueue and not exist for dequeue.  In the code it was
> the other way around.  Fix this and the associated tests.
> 
> The trampoline was already set up to get this argument correct.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_sched.c            | 3 ++-
>  test/unittest/sched/tst.lv-dequeue.r | 1 -
>  test/unittest/sched/tst.lv-enqueue.r | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
> index 125d58917..3a218f3cb 100644
> --- a/libdtrace/dt_prov_sched.c
> +++ b/libdtrace/dt_prov_sched.c
> @@ -46,10 +46,10 @@ static probe_arg_t probe_args[] = {
>  	{ "dequeue", 0, { 0, 0, "struct task_struct *", "lwpsinfo_t *" } },
>  	{ "dequeue", 1, { 0, 0, "struct task_struct *", "psinfo_t *" } },
>  	{ "dequeue", 2, { 1, 0, "cpuinfo_t *", } },
> -	{ "dequeue", 3, { 2, 0, "int", } },
>  	{ "enqueue", 0, { 0, 0, "struct task_struct *", "lwpsinfo_t *" } },
>  	{ "enqueue", 1, { 0, 0, "struct task_struct *", "psinfo_t *" } },
>  	{ "enqueue", 2, { 1, 0, "cpuinfo_t *", } },
> +	{ "enqueue", 3, { 2, 0, "int", } },
>  	{ "off-cpu", 0, { 0, 0, "struct task_struct *", "lwpsinfo_t *" } },
>  	{ "off-cpu", 1, { 0, 0, "struct task_struct *", "psinfo_t *" } },
>  	{ "on-cpu", },
> @@ -128,6 +128,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		 *	  associated with the runqueue.
>  		 */
>  		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> +
>  		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
>  		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
>  		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> diff --git a/test/unittest/sched/tst.lv-dequeue.r b/test/unittest/sched/tst.lv-dequeue.r
> index 7580a8abc..657667f34 100644
> --- a/test/unittest/sched/tst.lv-dequeue.r
> +++ b/test/unittest/sched/tst.lv-dequeue.r
> @@ -14,5 +14,4 @@ PROBE sched vmlinux dequeue
>  		args[0]: lwpsinfo_t *
>  		args[1]: psinfo_t *
>  		args[2]: cpuinfo_t *
> -		args[3]: int
>  
> diff --git a/test/unittest/sched/tst.lv-enqueue.r b/test/unittest/sched/tst.lv-enqueue.r
> index edc5e2c4c..2f5efa30c 100644
> --- a/test/unittest/sched/tst.lv-enqueue.r
> +++ b/test/unittest/sched/tst.lv-enqueue.r
> @@ -14,4 +14,5 @@ PROBE sched vmlinux enqueue
>  		args[0]: lwpsinfo_t *
>  		args[1]: psinfo_t *
>  		args[2]: cpuinfo_t *
> +		args[3]: int
>  
> -- 
> 2.43.5
> 
